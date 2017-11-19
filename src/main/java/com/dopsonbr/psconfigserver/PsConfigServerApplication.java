package com.dopsonbr.psconfigserver;

import io.prometheus.client.spring.boot.EnablePrometheusEndpoint;
import io.prometheus.client.spring.boot.EnableSpringBootMetricsCollector;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableAutoConfiguration
@EnableConfigServer
@EnableDiscoveryClient
@EnablePrometheusEndpoint
@EnableSpringBootMetricsCollector
@SpringBootApplication
public class PsConfigServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(PsConfigServerApplication.class, args);
	}
}
