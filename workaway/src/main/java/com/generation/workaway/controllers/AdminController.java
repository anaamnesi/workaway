package com.generation.workaway.controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.workaway.dao.DAOHr;
import com.generation.workaway.dao.DAOUtente;
import com.generation.workaway.dao.DAOViaggio;
import com.generation.workaway.entities.Hr;
import com.generation.workaway.entities.Utente;
import com.generation.workaway.entities.Viaggio;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private DAOUtente du;
	@Autowired
	private DAOViaggio dv;
	@Autowired
	private DAOHr dhr;
	@Autowired
	private ApplicationContext factory;

	@GetMapping("/home")
	public String homeAccesso(HttpSession session, Model model) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else { 
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if (map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster")) 
			{
				model.addAttribute("utente", (Map<String, String>) session.getAttribute("utente"));

				return "/admin/home.jsp";
			}

		}
		return "redirect:/";
	}

	//UTENTI
	// ELENCO UTENTI
	@GetMapping("/elencoUtenti")
	public String elencoUtenti(Model model, HttpSession session) {
		if (session.getAttribute("utente") == null) {

			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/admin/elencoUtenti");
				return "redirect:/formlogin";
			}
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if (map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster")) 
			{
				model.addAttribute("elencoUtenti", du.leggiTutti());
				model.addAttribute("ruolo", map.get("ruolo"));
				session.setAttribute("step", null);
				return "/admin/elencoUtenti.jsp";
			}

		}// utente not null.
		return "redirect:/";
	}

	// MODIFICAUTENTE
	@GetMapping("/formModificaUtente")
	public String formModificaUtente(@RequestParam("id") int id_Utente, Model model, HttpSession session) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>utente=(Map<String,String>) session.getAttribute("utente");
			if (utente.get("ruolo").equalsIgnoreCase("Admin")|| utente.get("ruolo").equalsIgnoreCase("Webmaster")) 
			{

				Map<String, String> map = du.cercaPerId(id_Utente);
				Map<String,String> cliente = dhr.cercaPerId(id_Utente);
				model.addAttribute("utente", map);
				model.addAttribute("cliente",cliente);
				model.addAttribute("ruolo",utente.get("ruolo"));

				return "/admin/formModificaUtente.jsp";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/modificaUtente")
	public String modificaUtente(@RequestParam Map<String, String> dati, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{
				//username controllo problema

				Utente v = factory.getBean(Utente.class, dati);
				System.out.println(v.toString());
				if(v.getUsername().equalsIgnoreCase("none")||
						v.getPassword().equalsIgnoreCase("none")||
						v.getRuolo().equalsIgnoreCase("none")) {
					//caso in cui si inserisce un dato non sensato
					System.out.println("Riga 120");
					return "redirect:/admin/elencoUtenti";
				}
				Map<String,String>utenteBefore=du.cercaPerId(Integer.parseInt(dati.get("id")));
				if (du.update(v)) {
					System.out.println("cambiamento avvenuto");
				} else {
					System.out.println("cambiamento non avvenuto");
				}

				if(v.getRuolo().equalsIgnoreCase("Utente")) {

					Hr h = factory.getBean(Hr.class, dati);
					if(h.getMail().equalsIgnoreCase("none")||
							h.getTelefono().equalsIgnoreCase("none")||
							h.getAzienda().equalsIgnoreCase("none") ||
							h.getCognome().equalsIgnoreCase("none") ||
							h.getNome().equalsIgnoreCase("none"))
					{  du.update(utenteBefore);
					return "redirect:/admin/elencoUtenti";
					}
					dhr.update(h);
				}



				return "redirect:/admin/elencoUtenti";
			}
		}
		return "redirect:/";
	}

	// NUOVO UTENTE
	@GetMapping("/formNuovoUtente")
	public String formNuovoUtente(HttpSession session,Model model) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/admin/formNuovoUtente");
				return "redirect:/formlogin";
			}
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{

				model.addAttribute("ruolo",map.get("ruolo"));
				return "/admin/formNuovoUtente.jsp";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/aggiungiUtente")
	public String aggiungiUtente(@RequestParam Map<String, String> nuovo, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if (map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster")) {
				if(du.UserEx(nuovo.get("username"))) {
					//se vogliamo far verdere il messaggio di errore, lavorare qui.
					return "redirect:/admin/formNuovoUtente";
				}
				else {
					Utente v = factory.getBean(Utente.class, nuovo);
					v.setRuolo("Utente");			
					v.setEnable(true);
					if(v.getUsername().equalsIgnoreCase("none")||
							v.getPassword().equalsIgnoreCase("none")||
							v.getRuolo().equalsIgnoreCase("none")) {
						//caso in cui si inserisce un dato non sensato
						return "redirect:/admin/formNuovoUtente";
					}
					Hr h = factory.getBean(Hr.class, nuovo);
					if(h.getMail().equalsIgnoreCase("none")||
							h.getTelefono().equalsIgnoreCase("none")||
							h.getAzienda().equalsIgnoreCase("none") ||
							h.getCognome().equalsIgnoreCase("none") ||
							h.getNome().equalsIgnoreCase("none"))
					{  //caso in cui si inserisce un dato non sensato
						return "redirect:/admin/formNuovoUtente";
					}


					if (du.create(v)) {
						System.out.println("Utente aggiunto con successo!");
						Map<String,String>dati = du.trovaAccesso(v.getUsername(), v.getPassword());

						h.setId(Integer.parseInt(dati.get("id")));
						if(dhr.create(h))
							System.out.println("HR aggiunto con successo!");
					}
					return "redirect:/admin/elencoUtenti";

				}
			}

		}

		return "redirect:/";

	}

	//NUOVO ADMIN
	@GetMapping("/formNuovoAdmin")
	public String formNuovoAdmin(HttpSession session,Model model) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/admin/formNuovoAdmin");
				return "redirect:/formlogin";
			}
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if (map.get("ruolo").equalsIgnoreCase("Webmaster")) 
			{

				model.addAttribute("ruolo",map.get("ruolo"));
				return "/admin/formNuovoAdmin.jsp";
			}
		}
		return "redirect:/";
	}



	@GetMapping("/aggiungiAdmin")
	public String aggiungiAdmin(@RequestParam Map<String, String> nuovo, HttpSession session) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if (map.get("ruolo").equalsIgnoreCase("Webmaster")) {
				if(du.UserEx(nuovo.get("username"))) {
					//se vogliamo far verdere il messaggio di errore, lavorare qui.
					//username già trovato
					return "redirect:/admin/formNuovoAdmin";
				}
				else {
					Utente v = factory.getBean(Utente.class, nuovo);
					v.setRuolo("Admin");			
					v.setEnable(true);
					if (du.create(v))
						System.out.println("Admin aggiunto con successo!");

					return "redirect:/admin/elencoUtenti";

				}
			}

		}

		return "redirect:/";

	}


	// ELIMINA UTENTE
	@GetMapping("eliminaUtente")

	public String eliminaUtente(@RequestParam("id") int id, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{   //APPLICARE INTEGRITA' REFERENZIALE CASCADE SU HR. 
				if (du.delete(id))
					System.out.println("Eliminazione avvenuta con successo");
				return "redirect:elencoUtenti";
			}
		}
		return "redirect:/";
	}

	//VIAGGI	
	// ELENCO VIAGGI
	@GetMapping("/elencoViaggi")
	public String elencoViaggi(Model model, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/admin/elencoViaggi");// devo passare i parametri.
				return "redirect:/formlogin";
			}
			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 
				model.addAttribute("elencoViaggi", dv.leggiTutti());

				return "/admin/elencoViaggi.jsp";
			}

		}
		return "redirect:/";
	}

	// MODIFICAVIAGGIO
	@GetMapping("/formModificaViaggio")
	public String formModificaViaggio(@RequestParam("id") int id_Utente, Model model, HttpSession session) {

		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 
				Viaggio v = dv.cercaPerId(id_Utente);
				model.addAttribute("utente", v);

				return "/admin/formModificaViaggio.jsp";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/modificaViaggio")
	public String modificaViaggio(@RequestParam Map<String, String>DATI, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 
				Viaggio v = factory.getBean(Viaggio.class, DATI);

				if (dv.update(v)) {
					System.out.println("cambiamento avvenuto");
				} else {
					System.out.println("cambiamento non avvenuto");
				}

				return "redirect:/admin/elencoViaggi";
			}
		}
		return "redirect:/";
	}

	// NUOVOVIAGGIO
	@GetMapping("/formNuovoViaggio")
	public String formNuovoViaggio(HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {
			if (session.getAttribute("ricordami") == null && session.getAttribute("step") == null) {
				session.setAttribute("percorso", "redirect:/admin/formNuovoViaggio");
				return "redirect:/formlogin";
			}

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 

				return "/admin/formNuovoViaggio.html";
			}
		}
		return "redirect:/";
	}

	@GetMapping("/aggiungiViaggio")
	public String aggiungiViaggio(@RequestParam Map<String, String> nuovo, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 
				Viaggio v = factory.getBean(Viaggio.class, nuovo);
				if (dv.create(v))
					System.out.println("Utente aggiunto con successo!");

				return "redirect:/admin/elencoViaggi";
			}

		}

		return "redirect:/";

	}

	// ELIMINAVIAGGIO
	@GetMapping("/eliminaViaggio")
	public String eliminaViaggio(@RequestParam("id") int id, HttpSession session) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 
				if (dv.delete(id))
					System.out.println("Eliminazione avvenuta con successo");
				return "redirect:/admin/elencoViaggi";
			}
		}
		return "redirect:/";
	}



	//Nuova AttivitÃ 
	@GetMapping("/formNuovaAttivita")
	public String formNuovaAttivita(@RequestParam("id") int id, HttpSession session,Model model) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 

				model.addAttribute("id", id+"");

				return "/admin/formAttivitaNuova.jsp";
			}
		}
		return "redirect:/";
	}


	//Aggiungi AttivitÃ 
	@GetMapping("/aggiungiAttivita")
	public String aggiungiAttivita(@RequestParam Map<String,String>m, HttpSession session,Model model) {
		if (session.getAttribute("utente") == null) {
			return "redirect:/formlogin";
		} else {

			Map<String,String>map=(Map<String,String>) session.getAttribute("utente");
			if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
					(map.get("enable")).equalsIgnoreCase("1")) 
			{ 

				if(dv.nuovaAttivita(m)) {
					System.out.println("Attività  aggiunta con successo");
				}
				else {
					System.out.println("errore nell'aggiunta dell'attività");
				}

				return "redirect:/admin/elencoViaggi";
			}
		}
		return "redirect:/";
	}








}
