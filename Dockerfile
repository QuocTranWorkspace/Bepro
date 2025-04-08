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

# Simple start script that always adds jdbc: prefix
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'MYSQL_URL="${MYSQL_URL:-mysql://localhost:3306/railway}"' >> /app/start.sh && \
    echo 'SPRING_DATASOURCE_URL="jdbc:${MYSQL_URL}"' >> /app/start.sh && \
    echo 'echo "Using database URL: $SPRING_DATASOURCE_URL"' >> /app/start.sh && \
    echo 'exec java -Xms128m -Xmx512m \
        -Dspring.datasource.url=$SPRING_DATASOURCE_URL \
        -Dspring.datasource.username=root \
        -Dspring.datasource.password=HMXrZqPazPLDMVlwhufWbkjtywlboSeA \
        -Dlogging.level.com.zaxxer.hikari=DEBUG \
        -jar app.war' >> /app/start.sh && \
    chmod +x /app/start.sh

# Environment variables
ENV PORT=8080

# Expose port
EXPOSE 8080

# Set the entrypoint to use the start script
CMD ["/bin/sh", "/app/start.sh"]