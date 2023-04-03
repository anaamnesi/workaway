<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import = "java.util.*" %> 
<%String errore = "no" ;%>
<% if(!(request.getAttribute("errore")==null)){%>
<% errore = (String)request.getAttribute("errore") ; %>
<%} %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE-edge">
  <meta name="viewport" content="width = device-width, initial-scale=1.0">
  <title>workawayexperiences | JAITA79</title>
  <link href="\css\workaway.css" type="text/css" rel="stylesheet" />
</head>

<body>

 <div class="overlay">
  <header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                	<a href="/">Home</a>
                	<a href="/about">About</a>
			      </div>
			  </div>
			  
		   </header>
<% if(errore.equalsIgnoreCase("si")) {%>
  
            <div class="avviso">
            <div class="message">
           
              <span class="text1">Ops!</span>
              <span class="text2"> I dati che hai inserito non sono corretti</span>
            </div>
          </div>
          
 <%} %>
 
 
 

  <%if (!(request.getAttribute("regOk")==null) && (errore.equalsIgnoreCase("no"))) {%>
            <div class="avviso">
            <div class="message">
              <span class="text2">Registrazione avvenuta con successo.</span>
            </div>
          </div>
          
 <%} %>


  <div class="wrapper">

    <div class="form-box login">
      <h2>Login</h2>
      <form action="/login">
        <div class="input-box">
         <span class="icon">
          <ion-icon name="mail-outline"></ion-icon>
         </span>
         <input type="txt"  name="username" required>
         <label>Username</label>
        </div>
        <div class="input-box">
          <span class="icon">
            <ion-icon name="lock-closed-outline"></ion-icon>
          </span>
          <input type="password" name="password" required>
          <label>Password</label>
         </div>
         <div class="remember-forgot">
          <label><input type="checkbox" name="ricordami">
          Ricordami
        </label>
        <a href="#">Password dimenticata?</a>
         </div>
         <button type="submit" class="btn">Accedi</button>
         <div class="login-register">
          <p>Non sei registrato?<a href="#" class="register-link"> Registrati</a></p>
         </div>
      </form>
    </div>


    
    <div class="form-box register">
      <h2>Registrati</h2>
      <form action="Registrazione" method="get">
        <div class="input-box">
          <span class="icon">
            <ion-icon name="id-card-outline"></ion-icon>
          </span>
          <input type="text" name="nome" required>
          <label>Nome</label>
         </div>
         <div class="input-box">
          <span class="icon">
            <ion-icon name="id-card-outline"></ion-icon>
          </span>
          <input type="text" name="cognome"required>
          <label>Cognome</label>
         </div>
        <div class="input-box">
          <span class="icon">
            <ion-icon name="person-circle-outline"></ion-icon>
          </span>
          <input type="text" name="username" required>
          <label>Username</label>
         </div>
        <div class="input-box">
         <span class="icon">
          <ion-icon name="mail-outline"></ion-icon>
         </span>
         <input type="email" name="mail" required>
         <label>Email</label>
        </div>
        <div class="input-box">
          <span class="icon">
            <ion-icon name="lock-closed-outline"></ion-icon>
          </span>
          <input type="password" name="password" required>
          <label>Password</label>
         </div>
         
         <div class="input-box">
          <span class="icon">
            <ion-icon name="id-card-outline"></ion-icon>
          </span>
          <input type="text" name="telefono" required>
          <label>Telefono</label>
         </div>
         <div class="input-box">
          <span class="icon">
            <ion-icon name="id-card-outline"></ion-icon>
          </span>
          <input type="text" name="azienda"required>
          <label>Azienda</label>
         </div>
         
         <div class="remember-forgot">
          <label><input type="checkbox" name="termini">
          Accetto i termini e le condizioni.
          </label>
         </div>
         <button type="submit" class="btn">Registrati</button>
         <div class="login-register">
          <p>Sei già  registrato?<a href="#" class="login-link">Accedi</a></p>
         </div>
         </form>
    </div>
      
  </div>
  
<script src="\js\workaway.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</div>
</body>

</html>