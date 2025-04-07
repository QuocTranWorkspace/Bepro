FROM eclipse-temurin:17-jdk as build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*war app.war

# Create upload directory
RUN mkdir -p upload-dir
ENV UPLOAD_PATH=/app/upload-dir

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]