package com.generation.workaway;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//classi di configurazione del progetto che sono definite 

public class ServletInitializer extends SpringBootServletInitializer {
	//SpringBootServletInitializer è un'interfaccia che serve per far runnare SpringApplication da una tradizionale distribuzione WAR

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(WorkawayApplication.class);
	}

}
