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

# Create symlink from /data to our application's upload directory
RUN mkdir -p /data/product/avatar /data/product/images && \
    chmod -R 755 /data && \
    ln -s /data /app/uploads

# Set upload directory environment variable
ENV APP_UPLOAD_DIR=/app/uploads

# Create startup script
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'if [ -n "$MYSQL_URL" ]; then' >> /app/start.sh && \
    echo '  case "$MYSQL_URL" in' >> /app/start.sh && \
    echo '    jdbc:*)' >> /app/start.sh && \
    echo '      export SPRING_DATASOURCE_URL="$MYSQL_URL"' >> /app/start.sh && \
    echo '      ;;' >> /app/start.sh && \
    echo '    *)' >> /app/start.sh && \
    echo '      export SPRING_DATASOURCE_URL="jdbc:$MYSQL_URL"' >> /app/start.sh && \
    echo '      ;;' >> /app/start.sh && \
    echo '  esac' >> /app/start.sh && \
    echo 'else' >> /app/start.sh && \
    echo '  echo "Warning: No MYSQL_URL environment variable found"' >> /app/start.sh && \
    echo 'fi' >> /app/start.sh && \
    echo 'echo "Starting application with uploads at $APP_UPLOAD_DIR..."' >> /app/start.sh && \
    echo 'exec java -Xms128m -Xmx256m \
        -XX:TieredStopAtLevel=1 \
        -Djava.security.egd=file:/dev/./urandom \
        -Dspring.datasource.url=$SPRING_DATASOURCE_URL \
        -Dapp.upload.dir=$APP_UPLOAD_DIR \
        -jar app.war' >> /app/start.sh && \
    chmod +x /app/start.sh

ENV PORT=8080
EXPOSE 8080

CMD ["/bin/sh", "/app/start.sh"]