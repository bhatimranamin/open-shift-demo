# Build the application first using Maven
FROM maven:3.8-openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn install

# Inject the JAR file into a new container to keep the file small
FROM openjdk:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/open-shift-demo-1.0.0.jar /app/app.jar
EXPOSE 8086
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar app.jar"]

