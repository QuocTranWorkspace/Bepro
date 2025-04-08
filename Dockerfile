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

# Create a start script that ensures the correct JDBC URL format
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'echo "Checking database URL format..."' >> /app/start.sh && \
    echo 'if [ -n "$MYSQL_URL" ]; then' >> /app/start.sh && \
    echo '  # Check if URL already has jdbc: prefix' >> /app/start.sh && \
    echo '  if [[ $MYSQL_URL != jdbc:* ]]; then' >> /app/start.sh && \
    echo '    export SPRING_DATASOURCE_URL="jdbc:$MYSQL_URL"' >> /app/start.sh && \
    echo '    echo "Added jdbc: prefix to database URL"' >> /app/start.sh && \
    echo '  else' >> /app/start.sh && \
    echo '    export SPRING_DATASOURCE_URL="$MYSQL_URL"' >> /app/start.sh && \
    echo '  fi' >> /app/start.sh && \
    echo 'elif [ -n "$DATABASE_URL" ]; then' >> /app/start.sh && \
    echo '  # Alternative environment variable name' >> /app/start.sh && \
    echo '  if [[ $DATABASE_URL != jdbc:* ]]; then' >> /app/start.sh && \
    echo '    export SPRING_DATASOURCE_URL="jdbc:$DATABASE_URL"' >> /app/start.sh && \
    echo '    echo "Added jdbc: prefix to database URL"' >> /app/start.sh && \
    echo '  else' >> /app/start.sh && \
    echo '    export SPRING_DATASOURCE_URL="$DATABASE_URL"' >> /app/start.sh && \
    echo '  fi' >> /app/start.sh && \
    echo 'else' >> /app/start.sh && \
    echo '  echo "Warning: No database URL environment variable found"' >> /app/start.sh && \
    echo 'fi' >> /app/start.sh && \
    echo 'echo "Database URL: $SPRING_DATASOURCE_URL"' >> /app/start.sh && \
    echo 'echo "Starting application with proper database configuration..."' >> /app/start.sh && \
    echo 'exec java -Xms128m -Xmx512m \
        -Dlogging.level.com.zaxxer.hikari=DEBUG \
        -Dspring.datasource.hikari.maximum-pool-size=3 \
        -Dspring.datasource.hikari.minimum-idle=1 \
        -Dspring.datasource.hikari.connection-timeout=30000 \
        -jar app.war' >> /app/start.sh && \
    chmod +x /app/start.sh

# Environment variables
ENV PORT=8080

# Expose port
EXPOSE 8080

# Set the entrypoint to use the start script
CMD ["/app/start.sh"]