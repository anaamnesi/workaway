<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
    <%@ page import="com.generation.workaway.entities.Viaggio"%>
<% Map<String,String> map = (Map<String,String>) request.getAttribute("utente"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="\css\about.css" />
		<title>About</title>
    </head>
    <body>

      <header>
        <a href="#" class="brand">WorkAway</a>
        <br>
        <div class="navigation">
          <div class="navigation-items">
          <a href="/">Home</a>
          <% if((!(map == null)) && map.get("ruolo").equalsIgnoreCase("Utente")){ %>
	          <a href="/accesso/pacchettiOfferte">Pacchetti Offerte</a>
	          <a href="/accesso/prenotazioni">Prenotazioni</a>  
	          <a href="/accesso/profilo">Profile</a>
	          <a href="/logout">Logout</a>
	          <a href="/accesso/formCarrello"><ion-icon size="large" name="cart-outline"></ion-icon>
					<% if( !(request.getAttribute("carrello")== null)){%>
					<% ArrayList<Viaggio>appoggio=(ArrayList<Viaggio>)request.getAttribute("carrello"); %>
					<%if(appoggio.size()>0) {%>
					<%= appoggio.size() %>
					<% } %>
					<% } %></a>
          <% } %> 
          <% if((!(map == null)) && map.get("ruolo").equalsIgnoreCase("Admin")){ %>
          	<a href="/admin/elencoUtenti">Lista Utenti</a> 
			<a href="/admin/elencoViaggi">Lista Viaggi</a>
          	<a href="/logout">Logout</a>
          
          <% } %> 
          <% if(map == null){ %>
	          	<a href = "/formlogin">ACCEDI</a>
          
          <% } %> 
            </div>
          </div>
          
         </header>


 <!--===========About Us===============-->
 <div class="header">
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
</div>
 <section class="about">
  <div class="about-img">
      <img src="/images/working.jpg">
  </div>
  <div class="about-text">
      <small>ABOUT US</small>
      <h2>WORKING AS A WHOLE NEW EXPERIENCE</h2>
      <p>Offri la possibilità di far vivere ai tuoi dipendenti
         esperienze uniche: <br>
         vivi e lavora in giro per il mondo!
      </p>

      <ion-icon class="icon" name="earth-outline" size="large"></ion-icon></ion-icon> 
      <p class="world">International environment</p>
      <ion-icon name="desktop-outline" size="large"></ion-icon>
      <p class="world">Co-working</p>
      <ion-icon name="people-outline" size="large"></ion-icon>
      <p class="world">Co-living</p>
      <ion-icon name="globe-outline" size="large"></ion-icon>
      <p class="world"> Community for Remote Workers and Digital Nomads</p>
      <a href="/accesso/pacchettiOfferte">PRENOTA SUBITO</a>
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