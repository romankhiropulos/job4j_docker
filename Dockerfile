# Этап 1 - сборка проекта в jar
FROM maven:3.6.3-openjdk-17 AS maven

WORKDIR /app

COPY . /app

RUN mvn package

# Этап 2 - указание как запустить проект
FROM openjdk:17-alpine

WORKDIR /app

COPY --from=maven /app/target/job4j_docker-1.0.jar main.jar

CMD ["java", "-jar", "main.jar"]