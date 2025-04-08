FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy application
COPY --from=build /app/target/*.war app.war

# Create uploads directory
RUN mkdir -p uploads && chmod 777 uploads

# Create a more comprehensive startup script
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'echo "Configuring application for stable operation..."' >> /app/start.sh && \
    echo 'if [ -n "$MYSQL_URL" ]; then' >> /app/start.sh && \
    echo '  case "$MYSQL_URL" in' >> /app/start.sh && \
    echo '    jdbc:*)' >> /app/start.sh && \
    echo '      export SPRING_DATASOURCE_URL="$MYSQL_URL"' >> /app/start.sh && \
    echo '      ;;' >> /app/start.sh && \
    echo '    *)' >> /app/start.sh && \
    echo '      export SPRING_DATASOURCE_URL="jdbc:$MYSQL_URL"' >> /app/start.sh && \
    echo '      echo "Added jdbc: prefix to database URL"' >> /app/start.sh && \
    echo '      ;;' >> /app/start.sh && \
    echo '  esac' >> /app/start.sh && \
    echo 'fi' >> /app/start.sh && \
    echo 'echo "Database URL: $SPRING_DATASOURCE_URL"' >> /app/start.sh && \
    echo 'echo "Preparing application with stability configurations..."' >> /app/start.sh && \
    echo 'exec java -Xms128m -Xmx256m \
        -XX:+UseContainerSupport \
        -XX:MaxRAMPercentage=75.0 \
        -Dserver.tomcat.max-threads=20 \
        -Dserver.tomcat.min-spare-threads=5 \
        -Dserver.connection-timeout=12000 \
        -Dlogging.level.com.zaxxer.hikari=INFO \
        -Dlogging.level.org.hibernate=INFO \
        -Dspring.datasource.url=$SPRING_DATASOURCE_URL \
        -Dspring.datasource.hikari.maximum-pool-size=3 \
        -Dspring.datasource.hikari.minimum-idle=1 \
        -Dspring.datasource.hikari.connection-timeout=30000 \
        -Dspring.datasource.hikari.maxLifetime=1800000 \
        -Dspring.jpa.properties.hibernate.generate_statistics=false \
        -Dserver.shutdown=graceful \
        -Dspring.lifecycle.timeout-per-shutdown-phase=20s \
        -Dmanagement.endpoints.web.exposure.include=health,info \
        -Dmanagement.endpoint.health.show-details=always \
        -Dmanagement.endpoint.health.probes.enabled=true \
        -Dmanagement.health.livenessstate.enabled=true \
        -Dmanagement.health.readinessstate.enabled=true \
        -Dmanagement.endpoints.web.base-path=/ \
        -jar app.war' >> /app/start.sh && \
    chmod +x /app/start.sh

# Environment variables
ENV PORT=8080
ENV SPRING_PROFILES_ACTIVE=prod

# Health check to help Railway understand when the application is truly ready
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD wget -q -O /dev/null http://localhost:8080/health || exit 1

# Expose port
EXPOSE 8080

# Set the entrypoint to use the start script
CMD ["/bin/sh", "/app/start.sh"]