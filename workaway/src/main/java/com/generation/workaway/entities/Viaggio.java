package com.generation.workaway.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import classe.Entity;



public class Viaggio extends Entity {


	private String img;
	private LocalDate data_viaggio;
	private String partenza;
	private String destinazione;
	private double tariffa;
	private int disponibili;
	private String tipo_pernottamento;
	private List<Map<String,String>>attivita;



	public Viaggio() {}
	public Viaggio(int id, String img, LocalDate data_viaggio, String partenza, String destinazione, double tariffa,int disponibili,String tipo_pernottamento) {

		super(id);
		setImg(img);
		setData_viaggio(data_viaggio);
		setPartenza(partenza);
		setDestinazione(destinazione);
		setTariffa(tariffa);
		setDisponibili(disponibili);
		setTipo_pernottamento(tipo_pernottamento);
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}



	public String getTipo_pernottamento() {
		return tipo_pernottamento;
	}
	public void setTipo_pernottamento(String tipo_pernottamento) {
		this.tipo_pernottamento = tipo_pernottamento;
	}
	public LocalDate getData_viaggio() {
		return data_viaggio;
	}




	public int getDisponibili() {
		return disponibili;
	}
	public void setDisponibili(int disponibili) {
		this.disponibili = disponibili;
	}
	public void setData_viaggio(LocalDate data_viaggio) {
		this.data_viaggio = data_viaggio;
	}



	public String getPartenza() {
		return partenza;
	}



	public void setPartenza(String partenza) {
		this.partenza = partenza;
	}



	public String getDestinazione() {
		return destinazione;
	}



	public void setDestinazione(String destinazione) {
		this.destinazione = destinazione;
	}



	public double getTariffa() {
		return tariffa;
	}



	public void setTariffa(double tariffa) {
		this.tariffa = tariffa;
	}


	public List<Map<String, String>> getAttivita() {
		return attivita;
	}
	public void setAttivita(List<Map<String, String>> attivita) {
		this.attivita = attivita;
	}
	@Override
	public String toString() {
		return super.toString() + "img=" + img + ", data_viaggio=" + data_viaggio + ", partenza=" + partenza
				+ ", destinazione=" + destinazione + ", tariffa=" + tariffa + "]";
	}



}
