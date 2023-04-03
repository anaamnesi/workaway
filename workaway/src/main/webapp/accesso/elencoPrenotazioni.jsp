<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.generation.workaway.entities.Viaggio"%>
<%	List<Map<String, String>> maps = (List<Map<String, String>>) request.getAttribute("prenotazioni"); %>

<html lang="en" dir="ltr">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="\css\prenotazioni.css" />
		<title>Prenotazioni</title>
		
	</head>
	
	
	<body>
	
		<header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                 <a href="/accesso/home">Home</a>
					<a href="/accesso/pacchettiOfferte">Pacchetti Offerte</a>
					<a href="/accesso/profilo">Profile</a>
					<a href="/about">About</a>  
					<a href="/logout">Logout</a>
					<a href="/accesso/formCarrello"><ion-icon size="large" name="cart-outline"></ion-icon>
					<% if( !(request.getAttribute("carrello")== null)){%>
					<% ArrayList<Viaggio>appoggio=(ArrayList<Viaggio>)request.getAttribute("carrello"); %>
					<%if(appoggio.size()>0) {%>
					<%= appoggio.size() %>
					<% } %>
					<% } %></a>
					
				  </div>
			  </div>
			  
		   </header>

        <section class="places">
            <div class="places-text">
                <h2>Le Tue Prenotazioni</h2>
            </div>
        <div class="cards">
        <% for(Map<String,String> m : maps ) {%>
            <div class="card-horizontal">
                <div class="card-horizontal-image">
				  <h1 class="dubai"><%= m.get("destinazione")%></h1>
				  <div class="imm"><img src="/images/<%= m.get("img") %>"
				alt="testo alternativo dell'immagine"></div>
                </div>
				
                
                <div class="card-horizontal-text">  
                    <div class="divfrom"><p class="from">Partenza da: <%= m.get("partenza")%></p></div>
					<div class="divdatafrom"><p class="datafrom">Data Partenza : <%= m.get("data_viaggio")%></p></div>
					
                  
				  <div class="pernottamento">Tipo di Pernottamento : <%= m.get("tipo_pernottamento")%></div>
                    <div class="people"><p>Dipendenti: <%= m.get("ndipendenti")%></p></div>
					<div class="camere"><p>Numero Camere: <%= m.get("ncamere")%></p></div>
                  
                   
                    <div><p class="date">Data di Prenotazione: <%= m.get("data_prenotazione")%></p></div>
                    <div class="code"><p>Codice di Prenotazione: <%= m.get("codice_prenotazione")%></p></div>
                  
                  
                    <div class="tot"><p class="tot">Totale: <%= (Double.parseDouble(m.get("tariffa")))*(Integer.parseInt(m.get("ndipendenti"))) %></p></div>
                    <div class="annulla"><a href="/accesso/annullaPrenotazione?id=<%= m.get("prenotato")%>&ndipendenti=<%= m.get("ndipendenti")%>&id_viaggi=<%= m.get("id_viaggi")%>">Annulla</a></div>
                </div>  
                
            </div>
			<%} %>
			
		</div>	
		
		<!--===========Footer=================-->
	    <div class="footer">
	        <div class="links">
	            <h3>Quick Links</h3>
	            <ul>
	                <li>Offers & Discounts</li>
	                <li>Get Coupon</li>
	                <li>Contact Us</li>
	                <li>About</li>
	            </ul>
	        </div>
	        <div class="links">
	            <h3>Our Community</h3>
	            <ul>
	                <li>WorkAway Blog</li>
	                <li>Get Inspired</li>
	                <li>Check-out the latest</li>
	                <li>Meet and Connect</li>
	            </ul>
	        </div>
	        <div class="links">
	            <h3>Support</h3>
	            <ul>
	                <li>Frequently Asked Questions</li>
	                <li>Report a Payment Issue</li>
	                <li>Terms & Conditions</li>
	                <li>Privacy Policy</li>
	            </ul>
	        </div>
	    </div>
		
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
			
	</body>
</html>