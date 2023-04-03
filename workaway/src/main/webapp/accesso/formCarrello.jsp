<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.generation.workaway.entities.Viaggio" %>  
<% ArrayList<Viaggio>appoggio=null;%>  
<% if( !(request.getAttribute("carrello")== null)){%>
<% appoggio=(ArrayList<Viaggio>)request.getAttribute("carrello"); %>
<% } %>
<%String comprato = (String)request.getAttribute("comprato"); %>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="\css\cart.css" />
    <title>WorkAway-experience | JAITA79</title>
    <link rel="icon" type="image/x-icon" href="./style/imgworkaway/favicon.png">
</head>

<body>
    <body>
        <!--===========Nav Bar=================-->
       <header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
	                 <a href="/">Home</a>
	                <a href="/accesso/pacchettiOfferte">Pacchetti Offerte</a>
	                <a href="/accesso/prenotazioni">Prenotazioni</a>
	                <a href="/accesso/profilo">Profile</a>
	                <a href="/about">About</a>
	                <a href="/logout">Logout</a>
					
				  </div>
			  </div>
			  
		   </header>
	<%if(comprato.equalsIgnoreCase("no")) {%>
<%if(!(appoggio == null) && appoggio.size()!=0){ %>
        <section class="places">
            <div class="places-text">
                <h2>Ci siamo quasi!</h2>
            </div>
           	
       
         <% for(Viaggio m : appoggio) {%>
            <div class="card-horizontal">
                <div class="card-horizontal-image">
                 <img src="/images/<%= m.getImg() %>"
				alt="testo alternativo dell'immagine">
                </div>
                <div class="card-horizontal-text">
                  <h1 class="dubai"> <%= m.getDestinazione()%></h1>
                  <div class="info">
                    <p class="from">Partenza da: <%= m.getPartenza()%></p>
                    <div class="people"><p>Persone: <%= m.getDisponibili()%></p> </div>
                  </div>
                  <div class="info2">
                
                    <p class="date">Data di partenza: <%= m.getData_viaggio()%></p>
                    <div class="board"><p><%= m.getTipo_pernottamento()%></p></div>
                  </div>
                  <div class="info3">
                    <p class="tot">Totale: <%= (m.getTariffa())*(m.getDisponibili()) %> </p>
                    <a class="delete" href="/accesso/carrello/elimina?id=<%=m.getId()%>">RIMUOVI</a>
                    <a class="buy" href="/accesso/compra?id=<%= m.getId()%>&scelti=<%=m.getDisponibili()%>">ACQUISTA</a>
                  </div>
                </div>
                </div>
                
                 <%} %>
           
           
            <%}else{%>
			<h1 class="ritorno">NON CI SONO OGGETTI NEL TUO CARRELLO.</h1>
            <%} %>
			<%}else{ %>
			<h1 class="carrellovuoto">ACQUISTO AVVENUTO CON SUCCESSO.</h1>
			 <a class="carrellovuoto" href="/accesso/formCarrello"> Torna Al Carrello
			<%} %>
            
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
        </section>
    </body>
</html>