FROM openjdk:8-jdk-alpine AS build-env

WORKDIR /work
COPY . .
RUN ./gradlew assemble

FROM openjdk:8-jdk-alpine

WORKDIR /work
COPY --from=build-env /work/build/libs /work

CMD sh -c "java -agentlib:jdwp=transport=dt_socket,address=5006,server=y,suspend=n -Djava.security.egd=file:/dev/./urandom -jar /work/*.jar"
