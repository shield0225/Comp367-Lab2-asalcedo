FROM openjdk:17-jdk-slim AS build

WORKDIR /app

COPY pom.xml .
COPY src src

RUN apt-get update && \
    apt-get install -y maven && \
    mvn clean package

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/comp367_welcome_web_app-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
