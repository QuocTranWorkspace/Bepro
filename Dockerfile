FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
# Copy the WAR file with a fixed name
COPY --from=build /app/target/*.war app.war

# Create uploads directory if needed
RUN mkdir -p uploads && chmod 777 uploads

# Add clear logging
ENV PORT=8080
EXPOSE 8080

# Create a start script using traditional methods
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'echo "Starting application with Java options: -jar app.war"' >> /app/start.sh && \
    echo 'echo "Current directory: $(pwd)"' >> /app/start.sh && \
    echo 'echo "Files in current directory:"' >> /app/start.sh && \
    echo 'ls -la' >> /app/start.sh && \
    echo 'echo "Environment variables:"' >> /app/start.sh && \
    echo 'env | sort' >> /app/start.sh && \
    echo 'echo "Starting Java application..."' >> /app/start.sh && \
    echo 'java -jar app.war' >> /app/start.sh && \
    chmod +x /app/start.sh

# Use the script as the entry point
CMD ["/app/start.sh"]