FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17-openjdk-slim

COPY --from=build /app/target/comp367_welcome_web_app-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9091

CMD ["java", "-jar", "app.jar"]
