<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import = "java.util.*" %>
<%@ page import="com.generation.workaway.entities.Viaggio"%> 
<% Map<String,String> utente = (Map<String,String>)request.getAttribute("cliente");%>

<!-- HOME ACCESSO PER GLI UTENTI -->

<html>
	<head>
	<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Welcome</title>
		<link rel="stylesheet" href="\css\homeutente.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
	</head>
	<body>
	
	<header>
			<a href="#" class="brand">WorkAway</a>
			<h4>Benvenuto <%= utente.get("nome") %> <%= utente.get("cognome") %>!</h4>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                  <a href="/accesso/pacchettiOfferte">Pacchetti Offerte</a>
				<a href="/accesso/prenotazioni">Prenotazioni</a>
				<a href="/about">About</a>  
				<a href="/accesso/profilo">Profile</a>
				<a href="/logout">Logout</a>
				<a href="/accesso/formCarrello"><ion-icon size="large" name="cart-outline"></ion-icon>
					<% if( !(request.getAttribute("carrello")== null)){%>
					<% ArrayList<Viaggio>appoggio=(ArrayList<Viaggio>)request.getAttribute("carrello"); %>
					<% if(appoggio.size()>0) {%>
					<%= appoggio.size() %>
					<% } %>
					<% } %></a>
					
				  </div>
			  </div>
			  
		   </header>
	   
	   <section class="home">
            <video class="video-slide active" src="/vid/croazia.mp4" autoplay muted loop></video>
            <video class="video-slide" src="/vid/copenhagen.mp4" autoplay muted loop></video>
            <video class="video-slide" src="/vid/tenerife.mp4" autoplay muted loop></video>
            <!--CROAZIA-->
            <div class="content active">
                <h1><strong><br><span>CROAZIA</span></strong></h1>
                <p>Scopri la bellezza mozzafiato della Croazia: mare cristallino, citt� storiche e isole incontaminate ti aspettano!</p>
                <a href="/accesso/pacchettiOfferte">Prenota ora</a>
            </div>
            <!--COPENHAGEN-->
            <div class="content">
                <h1><strong><br><span>COPENHAGEN</span></strong></h1>
                <p>Esplora la citt� pi� felice del mondo: Copenhagen ti incanter� con la sua architettura iconica, i canali pittoreschi, la cultura del design e la cucina nordica raffinata.</p>
                <a href="/accesso/pacchettiOfferte">Prenota ora</a>
            </div>
            <!-- TENERIFE-->
            <div class="content">
                <h1><strong><br><span>TENERIFE</span></strong></h1>
                <p>Tuffati nell'isola dell'eterna primavera: Tenerife ti sorprender� con le sue spiagge dorate, i vulcani maestosi e la natura spettacolare. Un paradiso tropicale tutto da scoprire!</p>
                <a href="/accesso/pacchettiOfferte">Prenota ora</a>
            </div>
            <div class="media-icons">
                <a href="https://www.facebook.com/workaway.info/?locale=it_IT"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/workawayinfo/?hl=it"><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/Workaway"><i class="fab fa-twitter"></i></a>
            </div>

            <div class="slider-navigation">
                <div class="nav-btn active"></div>
                <div class="nav-btn"></div>
                <div class="nav-btn"></div>
            </div>

        </section>

        <!--JAVASCRIPT for video slider navigation-->
        <script type="text/javascript">
        const btns = document.querySelectorAll(".nav-btn");
        const slides = document.querySelectorAll(".video-slide");
        const contents = document.querySelectorAll(".content");

        var sliderNav = function(manual){
            //PER I BOTTONCINI TONDI
            btns.forEach((btn) => {
                btn.classList.remove("active");
            });

            //PER LE SLIDE
            slides.forEach((slide) => {
                slide.classList.remove("active");
            });

            //PER LE DESCRIZIONI - CONTENUTI
            contents.forEach((content) => {
                content.classList.remove("active");
            });

            btns[manual].classList.add("active");
            slides[manual].classList.add("active");
            contents[manual].classList.add("active");
        }

        btns.forEach((btn, i) =>{
            btn.addEventListener("click", () =>{
                sliderNav(i);
            });
        });
        </script>
		
	   <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	</body>	
</html>