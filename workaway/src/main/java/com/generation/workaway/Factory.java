package com.generation.workaway;

import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.generation.workaway.dao.DAOHr;
import com.generation.workaway.dao.DAOUtente;
//import com.generation.workaway.service.UtenteService;
//import com.generation.workaway.service.ViaggioService;
import com.generation.workaway.dao.DAOViaggio;
import com.generation.workaway.entities.Hr;
import com.generation.workaway.entities.Utente;
import com.generation.workaway.entities.Viaggio;

import dao.Database;

@Configuration
public class Factory {

	@Bean
	public Database db() {
		return new Database("workaway", "root", "root");
	}

	@Bean
	public DAOUtente du() {

		return new DAOUtente();
	}

	@Bean
	public DAOViaggio dv() {

		return new DAOViaggio();
	}
	@Bean
	public DAOHr daohr() {

		return new DAOHr();
	}


	@Bean
	@Scope("prototype")
	public Viaggio v(Map<String,String> map) {
		Viaggio v = new Viaggio();
		v.fromMap(map);
		return v;
	}
	@Bean
	@Scope("prototype")
	public Utente u(Map<String,String> map) {

		Utente u = new Utente();
		u.fromMap(map);
		return u;
	}



	@Bean
	@Scope("prototype")
	public Hr d(Map<String,String> map) {

		Hr c = new Hr();
		c.fromMap(map);
		return c;
	}


}
