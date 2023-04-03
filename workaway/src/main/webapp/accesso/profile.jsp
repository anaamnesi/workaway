<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<%@ page import="java.util.*" %>
    <%@ page import="com.generation.workaway.entities.Viaggio"%>
    <% Map<String,String> m = (Map<String,String>)request.getAttribute("cliente"); %> 
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="\css\profile.css" />
    <title>Utenti</title>
</head>
<header>
    <a href="#" class="brand">WorkAway</a>
   
    <br>
    <div class="navigation">
        <div class="navigation-items">
            <a href="/accesso/home">Home</a>
            <a href="/accesso/pacchettiOfferte">Pacchetti Offerte</a>
            <a href="/accesso/prenotazioni">Prenotazioni</a>
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

<body>
    <div class="profile">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="profilepic"
                        src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                    <form action="/accesso/modificaProfilo" method="get">
                    <input type="hidden" name="id" value="<%= m.get("id")%>">
                        <div class="informazioni">
                            <h4 class="text-right">  <%= m.get("nome") %> <%= m.get("cognome") %> </h4>
                         
                            <div class="informazioni2">
                                <div class="info"><label class="labels">Nome</label><input type="text"
                                        class="form-control1" name ="nome" value="<%= m.get("nome") %>"></div>
                                <div class="info"><label class="labels">Cognome</label><input type="text"
                                        class="form-control2" name="cognome" value="<%= m.get("cognome") %>"></div>
                                <div class="info"><label class="labels">E-Mail</label><input type="text"
                                        class="form-control3" name="mail" value="<%= m.get("mail") %>"></div>
                                <div class="info"><label class="labels">Telefono</label><input type="text"
                                        class="form-control4" name="telefono" value="<%= m.get("telefono") %>"></div>
                                <div class="info"><label class="labels">Azienda</label><input type="text"
                                        class="form-control5" name="azienda" value="<%= m.get("azienda") %>"></div>
                            </div>
                            <input class="salvare" type="submit" value="Salva">
                        </div>
                                     
                                   
                         </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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