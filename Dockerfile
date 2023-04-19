# syntax=docker/dockerfile:1

FROM maven:3.6.3-openjdk-17

RUN mkdir job4j_docker

WORKDIR job4j_docker

COPY . .

RUN mvn install

CMD ["java", "-jar", "target/job4j_docker-1.0.jar"]