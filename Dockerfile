# Build stage
FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml first to leverage Docker cache for dependencies
COPY pom.xml .
# Download dependencies separately (will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src
# Build the application
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built artifact from the build stage
COPY --from=build /app/target/*.war app.war

# Create upload directory with proper permissions
RUN mkdir -p uploads && chmod 777 uploads

# Define environment variables
ENV PORT=8080
ENV UPLOAD_PATH=/app/uploads

# Expose the port
EXPOSE ${PORT}

# Start the application with proper environment variables
ENTRYPOINT ["java", "-jar", "app.war", "--server.port=${PORT}"]