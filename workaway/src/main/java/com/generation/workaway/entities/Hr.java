package com.generation.workaway.entities;

import classe.Entity;

public class Hr extends Entity{
	private String mail;
	private String telefono;
	private String azienda;
	private String nome;
	private String cognome;


	public Hr() {}
	// Quando faremo la registrazione creeremo su Database anche una riga su Hr.
	public Hr(int id , String nome,String cognome,String mail) {
		super(id);
		setNome(nome);
		setCognome(cognome);
		setMail(mail);
	}
	public Hr( int id, String mail, String telefono, String azienda,String nome,String cognome) {
		super(id);
		setMail(mail);
		setTelefono(telefono);
		setAzienda(azienda);
		setNome(nome);
		setCognome(cognome);
	}

	public String getMail() {
		return mail;
	}

	public String getTelefono() {
		return telefono;
	}
	public void setMail(String mail) {

		if(!(mail == null))	{
			String controllo= mail.split("@")[1];
			if(controllo.equals("gmail.com")||controllo.equals("libero.it") 
					|| controllo.equals("hotmail.com")|| controllo.equals("live.it")	) {
				this.mail = mail;
			}
			else {
				this.mail = "none";
			}
		} else {
			this.mail = "none";
		}
	}


	public void setTelefono(String telefono) {

		if(!(telefono == null) && telefono.length()==10) {
			this.telefono = telefono;
		}
		else {
			this.telefono="none";
		} 
	}


	public String getAzienda() {
		return azienda;
	}


	public void setAzienda(String azienda) {
		if(!(azienda == null) && azienda.length()>0) {
			this.azienda = azienda;
		}else {
			this.azienda = "none";
		}

	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		if(!(nome==null) && nome.length()>0) {
			this.nome = nome;
		}else {
			this.nome = "none";
		}

	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		if(!(cognome==null) && cognome.length()>0) {
			this.cognome = cognome;
		}else {
			this.cognome="none";
		}
	}
	@Override
	public String toString() {
		return super.toString()+ " + mail + " +  "telefono=" + telefono + ", azienda=" + azienda + ", nome=" + nome
				+ ", cognome=" + cognome + "]";
	}



}
