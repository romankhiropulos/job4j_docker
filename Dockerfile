# Этап 1 - сборка проекта в jar
FROM maven:3.6.3-openjdk-17 AS maven

RUN mkdir job4j_docker

WORKDIR job4j_docker

COPY . .

RUN mvn package

# Этап 2 - указание как запустить проект
FROM openjdk:17-alpine

WORKDIR job4j_docker

COPY --from=maven /target/main.jar /target/main.jar

CMD ["java", "-jar", "/target/main.jar"]