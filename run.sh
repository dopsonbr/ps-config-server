#!/bin/sh

echo "********************************************************"
echo "Waiting for the eureka server to start  on port $EUREKA_SERVER_PORT"
echo "********************************************************"
while ! `nc -z eureka-server $EUREKA_SERVER_PORT`; do sleep 3; done
echo ">>>>>>>>>>>> Eureka Server has started"

echo "********************************************************"
echo "Starting Configuration Service with Eureka Endpoint:  $EUREKA_SERVER_URI";
echo "********************************************************"

java -agentlib:jdwp=transport=dt_socket,address=5006,server=y,suspend=n \
	-Djava.security.egd=file:/dev/./urandom \
	-Deureka.client.serviceUrl.defaultZone=$EUREKA_SERVER_URI \
	-Dspring.cloud.config.uri=$CONFIG_SERVER_URI \
	-jar /work/*.jar
