FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/myspringapp.war app.war

# Create upload directory
RUN mkdir -p uploads
ENV UPLOAD_PATH=/app/uploads

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war", "--debug"]