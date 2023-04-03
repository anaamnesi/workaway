package com.generation.workaway.dao;




import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.workaway.entities.Viaggio;

import dao.Database;

public class DAOViaggio {

	@Autowired
	public Database db;


	@Autowired
	private ApplicationContext factory;

	public List<Viaggio> read(String query, String... params)
	{
		List<Viaggio> ris = new ArrayList<Viaggio>();
		List<Map<String, String>> righe = db.rows(query, params);
		for(Map<String,String> riga : righe)
		{
			Viaggio v = factory.getBean(Viaggio.class,riga);
			v.setAttivita(attivita(v.getId()));

			ris.add(v);
		}
		return ris;
	}

	public List<Viaggio> leggiTutti()
	{
		return read("select * from viaggi");
	}

	public boolean create(Viaggio v)
	{
		String query = "insert into viaggi (img, data_viaggio,partenza, destinazione, tariffa,tipo_pernottamento,disponibili) values (?,?,?,?,?,?,?)"; //data_viaggio

		return db.update(query,v.getImg(),v.getData_viaggio().toString(), v.getPartenza(), v.getDestinazione(), v.getTariffa() + "",v.getTipo_pernottamento(),v.getDisponibili()+"");//dataViaggioStr
	}

	public boolean update(Viaggio v)
	{ 
		String query = "UPDATE viaggi SET img = ?, data_viaggio = ?, partenza = ?, destinazione = ?, tariffa = ?, tipo_pernottamento= ?, disponibili= ? WHERE id = ?"; //data_viaggio = ?


		return db.update(query,v.getImg(),v.getData_viaggio().toString(), v.getPartenza(), v.getDestinazione(), v.getTariffa() + "",v.getTipo_pernottamento(),v.getDisponibili()+"", v.getId() + "");//dataViaggioStr,
	}

	public boolean delete(int id)
	{
		String query = "delete from viaggi where id = ?";
		return db.update(query, id + "");
	}

	public Viaggio cercaPerId(int id)
	{
		return read("select * from viaggi where id = ?", id + "").get(0);
	}

	public List<Map<String,String>> viaggiPerUtente(int idUtenti)
	{
		String query = 	"select	*\r\n" + 
				"from viaggi inner join appartiene\r\n" + 
				"		on\r\n" + 
				"        viaggi.id = appartiene.idutenti\r\n" + 
				"		inner join utenti\r\n" + 
				"        on\r\n" + 
				"        appartiene.idviaggi = utenti.id\r\n" + 
				"where	utenti.id = ?";
		return db.rows(query, idUtenti + "");
	}
	public List<Map<String,String>>attivita(int id){
		String query="select * from viaggi\r\n"
				+ "	   		inner join attivita on viaggi.id=id_viaggi\r\n"
				+ "			   where viaggi.id=?;";
		return db.rows(query, id + "");
	}
	public boolean acquisto(Map<String,String>dany) {
		String query="UPDATE viaggi SET disponibili=? WHERE id=?";
		Viaggio m=cercaPerId(Integer.parseInt(dany.get("id")));
		return db.update(query, ( m.getDisponibili() - Integer.parseInt(dany.get("scelti"))) + "",dany.get("id"));

	}

	public boolean annullaAcquisto(int id, int dipendenti) {

		String query="UPDATE viaggi SET disponibili=? WHERE id=?";
		Viaggio m=cercaPerId(id);
		return db.update(query, (m.getDisponibili() + dipendenti) + "", id+"");

	}


	public boolean nuovaAttivita(Map<String,String>map) {

		String query= "insert into attivita (nome, tipo, oreTot, id_viaggi) values (?,?,?,?)"; 
		return db.update(query, map.get("nome"),map.get("tipo"), map.get("oreTot"),map.get("id_viaggi"));
	}


}

