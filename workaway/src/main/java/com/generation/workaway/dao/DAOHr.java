package com.generation.workaway.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.generation.workaway.entities.Hr;
import com.generation.workaway.entities.Viaggio;

import dao.Database;

public class DAOHr {


	@Autowired
	public Database db;

	public List<Map<String,String>> leggiTutti()
	{
		return db.rows("SELECT * FROM Hr");
	}
	// Quando registriamo un account nuovo devo creare anche una riga Hr 
	public boolean create(Hr a)
	{   
		String query = "insert into Hr (id ,nome,cognome , mail,telefono,azienda) values (?,?,?,?,?,?);"; 
		return db.update(query, a.getId() + "",a.getNome(),a.getCognome(),a.getMail(), a.getTelefono(), a.getAzienda());
	}


	public boolean update(Hr m)
	{
		String query = "update hr set nome = ? , cognome = ? , mail = ? , telefono = ?, azienda = ?  where id = ?"; 
		return db.update(query,m.getNome(),m.getCognome(),m.getMail(), m.getTelefono(), m.getAzienda(), m.getId()+"");
	}



	public Map<String,String> cercaPerId(int id)
	{
		return db.row("select * from hr where id = ?;", id + "");
	}
	//metod per trovare le proprie prenotazioni.

	public List<Map<String,String>> trovaPrenotazioni(int id){

		String query = "select * , prenotazioni.id as prenotato from viaggi \r\n"
				+ "inner join prenotazioni \r\n"
				+ "on viaggi.id = prenotazioni.id_viaggi \r\n"
				+ "inner join hr \r\n"
				+ "on prenotazioni.id_hr = hr.id \r\n"
				+ "where hr.id = ?;";
		return db.rows(query, id+"");

	}
	public boolean nuova_Prenotazione(Map<String,String>prenota) {
		String query="INSERT INTO prenotazioni ( nDipendenti, nCamere,codice_prenotazione, id_hr, id_viaggi, data_prenotazione)\r\n"
				+ "VALUES(?,?,?,?,?,?)";
		LocalDate i=LocalDate.now();
		return db.update(query, prenota.get("dipendenti"),prenota.get("dipendenti"),prenota.get("codice"), prenota.get("cliente"),prenota.get("id_viaggi"),i.toString());

	}

	public boolean deletePrenotazione(int id){
		String query = "delete from prenotazioni where id = ?"; 
		return db.update(query, id + "");


	}

}

