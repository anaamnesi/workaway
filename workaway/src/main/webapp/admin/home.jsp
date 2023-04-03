<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import = "java.util.*" %> 
<% Map<String,String> utente = (Map<String,String>)request.getAttribute("utente");%>

<!-- HOME ADMIN -->

<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
	 	<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Welcome</title>
		<link rel="stylesheet" href="\css\homeadmin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
	</head>
	<body>
		<header>
			<a href="#" class="brand">WorkAway</a>
			<h4>Benvenuto Admin <%= utente.get("id") %> !</h4>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                 <a href="/admin/elencoUtenti">Lista Utenti</a> 
					<a href="/admin/elencoViaggi">Lista Viaggi</a> 
					<a href="/about">About</a> 
					<a href="/logout">Logout</a>
					
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
                
            </div>
            <!--COPENHAGEN-->
            <div class="content">
                <h1><strong><br><span>COPENHAGEN</span></strong></h1>
                <p>Esplora la citt� pi� felice del mondo: Copenhagen ti incanter� con la sua architettura iconica, i canali pittoreschi, la cultura del design e la cucina nordica raffinata.</p>
                
            </div>
            <!-- TENERIFE-->
            <div class="content">
                <h1><strong><br><span>TENERIFE</span></strong></h1>
                <p>Tuffati nell'isola dell'eterna primavera: Tenerife ti sorprender� con le sue spiagge dorate, i vulcani maestosi e la natura spettacolare. Un paradiso tropicale tutto da scoprire!</p>
                
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
		
	</body>	
</html>