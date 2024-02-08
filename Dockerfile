# Use a minimal base image with JDK 17
FROM eclipse-temurin:17-jre-alpine

LABEL authors="imranbhat"


# Set the working directory
WORKDIR /app

# Copy the JAR file into the container
COPY target/open-shift-demo-1.0.0.jar /app/app.jar

# Expose the port your application will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "/app/app.jar"]
