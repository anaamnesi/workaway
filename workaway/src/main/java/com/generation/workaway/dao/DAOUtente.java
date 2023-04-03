package com.generation.workaway.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.generation.workaway.entities.Utente;

import dao.Database;


public class DAOUtente {

	@Autowired
	public Database db;

	public List<Map<String,String>> leggiTutti()
	{
		return db.rows(" select utenti.*,nome,cognome from utenti left join hr on utenti.id = hr.id;");
	}

	public boolean create(Utente m)
	{

		String query = "insert into utenti (username,password,ruolo,enable) values (?,?,?,?);"; 
		return db.update(query, m.getUsername(), m.getPassword(), m.getRuolo(), ((m.isEnable())?"1": "0"));
	}
	// Metodo quando creiamo nuovi account.Dopo che qualcuno si è iscritto.
	public boolean registrazione(String username,String password)
	{

		String query = "insert into utenti (username,password,ruolo,enable) values (?,?,?,?);"; //ruolo FORSE DA TOGLIERE.
		return db.update(query, username,password,"Utente","1");
	}

	public boolean update(Utente m)
	{
		String query = "update utenti set enable = ? ,username = ?, password = ?, ruolo = ? where id = ?"; //and ruolo=utente";
		return db.update(query,((m.isEnable())?"1": "0"), m.getUsername(), m.getPassword(), m.getRuolo(),m.getId()+"");
	}
	public boolean update(Map<String,String> m) {
		System.out.println("DaoUtente " + m);
		String query = "update utenti set enable = ? ,username = ?, password = ?, ruolo = ? where id = ?"; //and ruolo=utente";
		return db.update(query,m.get("enable"), m.get("username"), m.get("password"), m.get("ruolo"),m.get("id"));
	}
	public boolean delete(int id)
	{
		String query = "delete from utenti where id = ?";
		return db.update(query, id + "");
	}

	public Map<String,String> cercaPerId(int id)
	{
		return db.row("select * from utenti where id = ?;", id + "");
	}

	public Map<String,String> trovaAccesso(String username, String password)
	{
		String query = "select * from utenti where username = ? and password = ?";
		return db.row(query, username, password);
	}

	public boolean UserEx(String username) {

		for(Map<String,String>map : leggiTutti()) {
			if(map.get("username").equalsIgnoreCase(username)){
				return true;
			}
		}
		return false;
	}


}

