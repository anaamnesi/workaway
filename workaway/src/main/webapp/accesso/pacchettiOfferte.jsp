 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.generation.workaway.entities.Viaggio"%>
<%
    List<Viaggio> elenco = (List<Viaggio>) request.getAttribute("elencoViaggi");
    Map<String,String> map = (Map<String,String>) request.getAttribute("descrizioni");
  
%>

<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="\css\offerte.css" />
    <title>WorkAway-experience | JAITA79</title>
   
</head>

<body>



        <!--===========Nav Bar=================-->
        <header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
					<a href="/accesso/home">Home</a>
					<a href="/accesso/prenotazioni">Prenotazioni</a>
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

        <!--===============Banner================-->
        <section class="banner">
            <div class="banner-text-item">
                <div class="banner-heading">
                    <h1>All'arrembaggio!</h1>
                </div>
                
            </div>
        </section>

        <!--=========Services===============-->
        <section class="services">
            <div class="service-item">
                <img src="/images/icons/localguide.png">
                <h2 class="icon-text">8000+ Our Local Guides</h2>
            </div>
            <div class="service-item">
                <img src="/images/icons/trusted.png">
                <h2 class="icon-text">100% Trusted Tour Agency</h2>
            </div>
            <div class="service-item">
                <img src="/images/icons/thumbup.png">
                <h2 class="icon-text">98% Our Travelers</h2>
            </div>
        </section>
        <!--==============Places===================-->
        <section class="places">
            <div class="places-text">
                <h2>Pacchetti Offerte</h2>
            </div>

            <div class="cards">
            <% for(Viaggio m : elenco) { %>
            <% if(m.getDisponibili() > 0){ %>
            
                <div class="card">
                    <div class="zoom-img">
                        <div class="img-card">
                            <img src="/images/<%= m.getImg() %>"
				alt="testo alternativo dell'immagine">
                        </div>
                    </div>

                    <div class="text">

                        <h2><%= m.getDestinazione() %></h2>
                        <p class="descrizione"><%= map.get(m.getDestinazione()) %></p>
                        <div class="info">
                            <p class="location">Partenza: <%= m.getPartenza() %></p>
                            
			</div>
                        </div>
                        <div class="activities">
                        <%for(Map<String,String>attivita : m.getAttivita()){ %>
                            <% if(attivita.get("tipo").equalsIgnoreCase("Ricreativa")){ %>
                            <span class="activity"><%=attivita.get("nome")  %></span>
                            <% } else { %>
                            <span class="activityFormativa"><%=attivita.get("nome")  %></span>
                            <% } %>
                        <% } %>
                        </div>
                        
                        <span class="rating">⭐⭐⭐⭐⭐</span>
                        
                        <div class="data"><p class="cost" id="giorno"><%= m.getData_viaggio() %></p>
                        <p class="cost" id="pensione"><%= m.getTipo_pernottamento() %></p></div>
                        <form id="form_<%= m.getId() %>" action="/accesso/carrello">
                        <input type="hidden" name="id" value="<%= m.getId()%>">
                        	<div class="disponibili"><p class="available">Posti disponibili:</p>
                        
	                        <select id="enable_<%= m.getId() %>" name="enable_<%= m.getId() %>">
								<% for (int i = 1; i <= m.getDisponibili(); i++) { %>
								<% if (i == 1) { %>
								<option value="<%= i %>" selected><%= i %></option>
								<% }else { %>
								<option value="<%= i %>"><%= i %></option>
								        <% } %>
								<% } %>
				
							</select></div>
							
	                        <p class="cost"><%= m.getTariffa() %>€ /A persona</p>
	                        
	                        <div class="card-box">
	                            <p class="buy"><input id="prenotaora" type="submit" value="Prenota"></p>
	                        </div>
                        </form>
                    </div>
                    
            <% } %>
            <% } %>
            </div>
        </section>
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
		
