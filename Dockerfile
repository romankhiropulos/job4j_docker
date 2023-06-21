# Этап 1 - сборка проекта в jar
FROM maven:3.6.3-openjdk-17 AS maven
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mvn package

# Этап 2 - указание как запустить проект
FROM openjdk:17-alpine
COPY --from=maven /usr/app/target/main.jar /app/main.jar
ENTRYPOINT java -jar /app/main.jar