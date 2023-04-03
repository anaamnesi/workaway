package com.generation.workaway.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.workaway.dao.DAOHr;
import com.generation.workaway.dao.DAOUtente;
import com.generation.workaway.entities.Hr;
import com.generation.workaway.entities.Utente;



@Controller
public class HomeController {
	@Autowired
	private DAOUtente du;

	@Autowired							
	private ApplicationContext factory; 

	@Autowired
	private DAOHr dhr;


	@GetMapping("")						
	public String homepage(HttpSession session) { 

		String ris = "";

		if (session.getAttribute("utente") == null) {
			System.out.println("Sono nell'if di utente == " + session.getAttribute("utente"));
			ris = "redirect:/home"; 
		} else {

			if (((String) (((Map<String, String>) session.getAttribute("utente"))).get("ruolo"))
					.equalsIgnoreCase("utente")) {													

				System.out.println("utente : " + session.getAttribute("utente"));
				ris = "redirect:/accesso/home";                  
				// caso in cui ruolo dell'utente sia Utente.
			} else {
				Map<String, String> map = (Map<String, String>) session.getAttribute("utente");
				if (map.get("ruolo").equalsIgnoreCase("Admin") || map.get("ruolo").equalsIgnoreCase("Webmaster")) {
					System.out.println("Sono nell'ultimo else");
					ris = "redirect:/admin/home";
					// caso in cui ruolo sia admin o webmaster.
				}
			} // else nel caso ci sia nella servlet un utente not null ma neanche utente.
		}

		return ris;
	}

	@GetMapping("/home") //arrivo qui dal redirect del mapping "" quando la session dell'utente è null
	public String home(HttpSession session, @RequestParam(required = false) boolean cacheable,
			HttpServletResponse response) {
		if (session.getAttribute("utente") == null) {
			// Imposta l'header Cache-Control a no-store
			response.setHeader("Cache-Control", "no-store");
			return "home.html";
		}

		return "redirect:/";
	}

	// LOGIN
	@GetMapping("/formlogin")
	public String formlogin(Model model,HttpSession session) {
		if(session.getAttribute("errore")==null) {
			session.setAttribute("errore","no");
		}
		model.addAttribute("errore", session.getAttribute("errore"));
		session.setAttribute("errore","no");
		return "formlogin.jsp";
	}

	@GetMapping("/login")
	public String login(@RequestParam Map<String, String> datiAccesso, HttpSession session, Model model) {
		Map<String, String> map = du.trovaAccesso(datiAccesso.get("username"), datiAccesso.get("password"));

		String ris = "";
		System.out.println(map);

		if (map == null) {
			session.setAttribute("errore", "si");
			ris = "redirect:/formlogin";
		} else { 


			session.setAttribute("ricordami", datiAccesso.get("ricordami"));

			session.setAttribute("utente", map); 

			if (map.get("ruolo").equalsIgnoreCase("utente") && (map.get("enable")).equalsIgnoreCase("1")){

				if (session.getAttribute("percorso") == null) {

					ris = "redirect:/accesso/home";

					int d = Integer.parseInt(map.get("id"));

					session.setAttribute("cliente", dhr.cercaPerId(d));

				} else { 
					session.setAttribute("step", "si");
					ris = (String) session.getAttribute("percorso");
					session.setAttribute("percorso", null);
				}
			} 
			else { 
				if ((map.get("ruolo").equalsIgnoreCase("Admin")|| map.get("ruolo").equalsIgnoreCase("Webmaster"))&& 
						(map.get("enable")).equalsIgnoreCase("1")) 
				{

					if (session.getAttribute("percorso") == null) {

						ris = "redirect:/admin/home";
					} else {
						session.setAttribute("step", "si");
						ris = (String) session.getAttribute("percorso");
						session.setAttribute("percorso", null);
					}

				} // Qui finisce il blocco dove il ruolo è admin
			}

		} // chiusura dell'else dove sappiamo che c'è un utente

		return ris;

	}

	// LOGOUT
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.setAttribute("utente", null);
		session.setAttribute("step", null);
		session.setAttribute("percorso", null);
		session.setAttribute("ricordami", null);
		session.setAttribute("carrello", null);
		session.setAttribute("errore",null);
		return "redirect:/";
	}

	// REGISTRAZIONE

	@GetMapping("/Registrazione")
	public String registrazione(@RequestParam Map<String, String> datiAccesso,HttpSession session,Model model) {
		System.out.println("Mappa Utente: " + datiAccesso);

		if (datiAccesso.get("termini") == null || du.UserEx(datiAccesso.get("username"))) {
			// se vogliamo far verdere il messaggio di errore, lavorare qui.
			// username già trovato
			session.setAttribute("errore", "si");
			return "redirect:/formlogin";
		} else {

			Utente u = factory.getBean(Utente.class, datiAccesso);
			u.setRuolo("Utente");
			u.setEnable(true);
			if(u.getUsername().equalsIgnoreCase("none")||
					u.getPassword().equalsIgnoreCase("none")) {

				session.setAttribute("errore", "si");
				//caso in cui si inserisce un dato non sensato
				return "redirect:/formlogin";
			}




			// controlli se va tutto bene da mettere


			if (du.registrazione(u.getUsername(), u.getPassword())) {
				System.out.println("Utente aggiunto con successo!");

				Hr t = (Hr) factory.getBean("d", datiAccesso);
				Map<String, String> map = du.trovaAccesso(u.getUsername(), u.getPassword());
				if(t.getMail().equalsIgnoreCase("none")||
						t.getTelefono().equalsIgnoreCase("none")||
						t.getAzienda().equalsIgnoreCase("none") ||
						t.getCognome().equalsIgnoreCase("none") ||
						t.getNome().equalsIgnoreCase("none"))
				{   du.delete(Integer.parseInt(map.get("id")));
				//caso in cui si inserisce un dato non sensato
				session.setAttribute("errore", "si");
				return "redirect:/formlogin";
				}
				System.out.println("id" + map);
				t.setId(Integer.parseInt(map.get("id")));
				//---
				if (dhr.create(t)) {
					System.out.println("Utente aggiunto con successo!");
					model.addAttribute("regOk","si");
					return "formlogin.jsp";

				}else {
					du.delete(Integer.parseInt(map.get("id")));
					session.setAttribute("errore", "si");
					return "redirect:/formlogin";
				}
			} else {
				return "redirect:/formRegistrazione";
			}
		}
	}

	@GetMapping("/about")
	public String about(HttpSession session, Model model) {
		model.addAttribute("utente", session.getAttribute("utente"));
		if (!(session.getAttribute("carrello") == null)) {
			model.addAttribute("carrello", session.getAttribute("carrello"));
		}

		return "about.jsp";
	}

}
