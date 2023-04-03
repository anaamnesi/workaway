package com.generation.workaway.entities;

import classe.Entity;

public class Utente extends Entity {
	private String username;
	private String password;
	private String ruolo;
	private boolean enable;

	public Utente() {
	}

	public Utente(int id, String username, String password, String ruolo, boolean enable) {
		super(id);
		setUsername(username);
		setPassword(password);
		setRuolo(ruolo);
		setEnable(enable);

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		if (!(username==null) && (username.length() >= 5 && username.length() <= 20)) {
			this.username = username;
		} else {
			this.username = "none";
		}

	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {

		int i = 0;
		boolean trovato = false;
		if (!(password==null) && password.length() > 5) {
			while (!trovato && i < password.length()) {
				if ((password.charAt(i) >= 65 && password.charAt(i) <= 90)) {
					trovato = true;
				}

			}

			if (trovato && password.length() > 5) {
				i = 0;
				trovato = false;
				while (!trovato && i < password.length()) {
					if (password.charAt(i) >= 48 && password.charAt(i) <= 57) {
						trovato = true;
					}
					i++;
				}

				if (trovato) {
					this.password = password;
				} else { // caso in cui il secondo trovato = false;
					this.password = "none";
				}

			} else { // caso se il primo trovato = false;
				this.password = "none";
			}
		} // non è maggiore di 5
		else {
			this.password = "none";
		}

	}// fine set password

	public String getRuolo() {
		return ruolo;
	}

	public void setRuolo(String ruolo) {
		if (!(ruolo==null) &&(ruolo.equalsIgnoreCase("utente") || ruolo.equalsIgnoreCase("admin")|| ruolo.equalsIgnoreCase("webmaster"))) {
			this.ruolo = ruolo;
		} else {
			this.ruolo = "none";
		}

	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	@Override
	public String toString() {
		return super.toString() + " username=" + username + ", password=" + password + ", ruolo=" + ruolo + ", enable="
				+ enable;
	}

}