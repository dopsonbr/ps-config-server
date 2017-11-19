FROM openjdk:8-jdk-alpine AS build-env

WORKDIR /work
COPY . .
RUN ./gradlew assemble

FROM openjdk:8-jdk-alpine

RUN apk update && apk upgrade && apk add netcat-openbsd
WORKDIR /work

COPY --from=build-env /work/build/libs /work
COPY --from=build-env /work/run.sh /work
RUN chmod +x /work/run.sh
CMD /work/run.sh
