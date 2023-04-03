package com.generation.workaway.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.workaway.dao.DAOHr;
import com.generation.workaway.dao.DAOViaggio;
import com.generation.workaway.entities.Hr;
import com.generation.workaway.entities.Viaggio;
import com.generation.workaway.utils.Reader;

// Cambiare il percorso di descrizioni in /webapp/res/descrizioni.txt nel GetMapping("/pacchettiOfferte")

@Controller
@RequestMapping("/accesso")
public class AccessoController {

	@Autowired
	private DAOHr dhr;

	@Autowired
	private DAOViaggio dv;
	@Autowired
	private ApplicationContext factory;


	@GetMapping("/home")
	public String homeAccesso(HttpSession session, Model model) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				model.addAttribute("utente", (Map<String, String>) session.getAttribute("utente"));
				model.addAttribute("cliente", (Map<String, String>) session.getAttribute("cliente")); // HR
				if (!(session.getAttribute("carrello") == null)) {
					model.addAttribute("carrello", session.getAttribute("carrello"));
				}
				return "/accesso/home.jsp";
			}
		}
		return "redirect:/formlogin";
	}

	@GetMapping("/prenotazioni")
	public String prenotazioni(HttpSession session, Model model) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/accesso/prenotazioni");
				return "redirect:/formlogin";
			}

			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				System.out.println("map" + utente);
				int idparsed = Integer.parseInt(utente.get("id"));

				List<Map<String, String>> list = dhr.trovaPrenotazioni(idparsed);
				model.addAttribute("prenotazioni", list);
				session.setAttribute("step", null);
				if (!(session.getAttribute("carrello") == null)) {
					model.addAttribute("carrello", session.getAttribute("carrello"));
				}

				return "/accesso/elencoPrenotazioni.jsp";
			}

		}
		return "redirect:/";
	}// fine prenotazioni.

	// PACCHETTI OFFERTE

	@GetMapping("/pacchettiOfferte")
	public String pacchettiOfferte(Model model, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			session.setAttribute("percorso", "redirect:/accesso/pacchettiOfferte");
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/accesso/pacchettiOfferte");
				return "redirect:/formlogin";
			}
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				session.setAttribute("step", null);
				model.addAttribute("elencoViaggi", dv.leggiTutti());
				Map<String, String> map = Reader.readDescr(
						"C:\\Users\\user\\OneDrive\\Desktop\\JAVA SOFIA\\AAA-WORKAWAY\\SPACEWORKS\\A-09 FINALE\\workaway\\src\\main\\webapp\\res\\descrizioni.txt");

				model.addAttribute("descrizioni", map);

				if (!(session.getAttribute("carrello") == null)) {
					model.addAttribute("carrello", session.getAttribute("carrello")); //"carrello" è per il numeretto del carrello
				}

				return "/accesso/pacchettiOfferte.jsp";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/carrello")  
	public String carrello(@RequestParam Map<String, String> map, HttpSession session) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {

				boolean trovato = false;
				if (session.getAttribute("carrello") == null) {
					ArrayList<Viaggio> carrello = new ArrayList<>();
					session.setAttribute("carrello", carrello);
				}

				ArrayList<Viaggio> appoggio = (ArrayList<Viaggio>) session.getAttribute("carrello");
				Viaggio v = dv.cercaPerId(Integer.parseInt(map.get("id")));
				for (Viaggio m : appoggio) {

					if (v.getId() == m.getId()) {
						if (v.getDisponibili()
								- (m.getDisponibili() + Integer.parseInt(map.get("enable_" + map.get("id")))) < 0) {

							m.setDisponibili(v.getDisponibili());
						} else {
							m.setDisponibili(m.getDisponibili() + Integer.parseInt(map.get("enable_" + map.get("id"))));
						}
						trovato = true;
					}
				}
				if (!trovato) {
					v.setDisponibili(Integer.parseInt(map.get("enable_" + map.get("id"))));
					appoggio.add(v);
				}
				session.setAttribute("carrello", appoggio);
				return "redirect:/accesso/pacchettiOfferte";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/formCarrello")
	public String formCarrello(HttpSession session, Model model) {
		if (session.getAttribute("utente") == null) {
			session.setAttribute("percorso", "redirect:/accesso/formCarrello");
			return "redirect:/formlogin";
		} else { 
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) { 
				session.setAttribute("percorso", "redirect:/accesso/formCarrello");
				return "redirect:/formlogin";
			}
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				if (!(session.getAttribute("carrello") == null)) { 
					model.addAttribute("carrello", session.getAttribute("carrello"));
				}
				session.setAttribute("step", null); 

				if(session.getAttribute("comprato")==null) {
					session.setAttribute("comprato", "no");
				}
				model.addAttribute("comprato",session.getAttribute("comprato")); 
				session.setAttribute("comprato", "no");


				return "/accesso/formCarrello.jsp";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/carrello/elimina")
	public String eliminaCarrello(HttpSession session, @RequestParam("id") String id) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				ArrayList<Viaggio> appoggio = (ArrayList<Viaggio>) session.getAttribute("carrello");
				for (int i = appoggio.size() - 1; i >= 0; i--) {

					if (Integer.parseInt(id) == appoggio.get(i).getId()) {
						appoggio.remove(i);
					}

				}

				session.setAttribute("carrello", appoggio);
				return "redirect:/accesso/formCarrello";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/compra")
	public String compra(HttpSession session, @RequestParam Map<String, String> dati) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				System.out.println("id viaggio acquistato + posti prenotati" + dati);
				if (dv.acquisto(dati)) {
					//inizio processo per togliere il viaggio acquistato dal carrello
					ArrayList<Viaggio> appoggio = (ArrayList<Viaggio>) session.getAttribute("carrello");
					Map<String, String> map = new HashMap<>();
					int i = appoggio.size() - 1;
					boolean trovato = false;
					while (!trovato && i >= 0) {
						if (Integer.parseInt(dati.get("id")) == appoggio.get(i).getId()) {
							Random r = new Random();
							String alphabet = "ABCDEFGHILMNOPQRSTUVZ123456789";
							String codice = "";
							for (int j = 0; j < 8; j++) {
								codice += alphabet.charAt(r.nextInt(alphabet.length()));
							}
							//posti prenotati per quel viaggio
							map.put("dipendenti", appoggio.get(i).getDisponibili() + "");
							map.put("codice", codice);
							map.put("cliente",
									((String) (((Map<String, String>) session.getAttribute("utente"))).get("id")));
							map.put("id_viaggi", dati.get("id"));
							appoggio.remove(i);
							trovato = true;
						} // ESCO DAL BLOCCO DI CODICE DOVE HO TROVATO LO STESSO OGGETTO NEL CARRELLO.
						i--;
					}
					session.setAttribute("carrello", appoggio);

					dhr.nuova_Prenotazione(map);
					session.setAttribute("comprato", "si");
					return "redirect:/accesso/formCarrello";

				} else {
					// acquisto non avvenuto
					return "redirect:/accesso/formCarrello";
				} // chiusura if acquisti
			} // CHIUSURA IF UTENTE=="UTENTE".
		} // ELSE UTENTE NON E' NULL.
		return "redirect:/"; //caso dell'utente non abilitato o con ruolo diverso da "utente"
	}// CHIUSURA



	@GetMapping("/annullaPrenotazione")					//id prenotato - nDipedenti - id Viaggio
	public String annullaPrenotazione(HttpSession session, @RequestParam Map<String, String> map) {
		System.out.println(map);
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				if (dhr.deletePrenotazione(Integer.parseInt(map.get("id")))) { //questo elimina tutto il record della prenotazione
					if (dv.annullaAcquisto(Integer.parseInt(map.get("id_viaggi")),
							Integer.parseInt(map.get("ndipendenti")))) { //qui aggiorno nella tabella viaggi al viaggio con lo specifico id i posti che sono tornati liberi
						System.out.println("annulla prenotazione avvenuta con successo");
						return "redirect:/accesso/prenotazioni";
					}
				}

			}
		}

		return "redirect:/";
	}


	@GetMapping("/profilo")
	public String profilo(HttpSession session,Model model) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/accesso/profilo");
				return "redirect:/formlogin";
			}

			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) {
				session.setAttribute("step", null);	
				int id = Integer.parseInt(utente.get("id"));
				utente = dhr.cercaPerId(id);

				model.addAttribute("cliente",utente);
				if(!(session.getAttribute("carrello") == null))
					model.addAttribute("carrello", session.getAttribute("carrello") );

				return "/accesso/profile.jsp";

			}	


		}
		return "redirect:/formlogin";
	}

	@GetMapping("/modificaProfilo") //dati: nome, cognome, telefono, email, azienda
	public String modificaProfilo(@RequestParam Map<String, String> dati, HttpSession session,Model model) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String, String> utente = (Map<String, String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Utente") && utente.get("enable").equalsIgnoreCase("1")) 
			{
				Hr h = factory.getBean(Hr.class, dati);
				if(h.getMail().equalsIgnoreCase("none")||
						h.getTelefono().equalsIgnoreCase("none")||
						h.getAzienda().equalsIgnoreCase("none") ||
						h.getCognome().equalsIgnoreCase("none") ||
						h.getNome().equalsIgnoreCase("none"))
				{  //caso in cui si inserisce un dato non sensato
					return "redirect:/accesso/profilo";
				}
				if(dhr.update(h)) {
					System.out.println("cambiamento avvenuto con successo");
					session.setAttribute("cliente", dati);
				}else {
					System.out.println("cambiamento non avvenuto");


					return"redirect:/accesso/profilo";
				}
			}
		}

		return"redirect:/";
	}






}// controller.
