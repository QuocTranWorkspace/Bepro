FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.war app.war

# Create directories needed by your application
RUN mkdir -p uploads && chmod 777 uploads

# Set environment variables
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Launch with explicitly empty context path
CMD ["java", "-jar", "-Dserver.servlet.context-path=", "-Dserver.port=8080", "app.war"]