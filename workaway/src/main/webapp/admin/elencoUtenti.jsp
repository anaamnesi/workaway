<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%	List<Map<String,String>> tutti = (List<Map<String,String>>) request.getAttribute("elencoUtenti"); %> 
<%	String ruolo = (String) request.getAttribute("ruolo"); %>  


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="\css\elencoutenti.css" />
		<title>Elenco Utenti</title>
	</head>
	<body>
	
		<header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                	<a href="/">Home</a> 
					<a href="/admin/formNuovoUtente">Nuovo Utente</a>
					<% if(ruolo.equalsIgnoreCase("Webmaster")){ %>
		 			<a href="/admin/formNuovoAdmin">Nuovo Admin</a>
		 			<%} %>
		 			<a href="/about">About</a>
					<a href="/logout">Logout</a>
				  </div>
			  </div>
			  
		   </header>
	
			<div id="wrapper">
	         <h1>Lista Utenti</h1>
	         
	         <table id="keywords" cellspacing="0" cellpadding="0">
	           <thead>
	             <tr>
	               <th><span>ID</span></th>
	               <th><span>Ruolo</span></th>
	               <th><span>Nome</span></th>
	               <th><span>Cognome</span></th>
	               <th><span>Abilitato</span></th>
	               <th><span></span></th>
	               <th><span></span></th>
	             
	             </tr>
	             
	             <% for(Map<String,String> m : tutti) {%>
				<%if(!(m.get("ruolo").equalsIgnoreCase("Webmaster"))){ %>
				<% 
					String enable = "";
					if(m.get("enable").equalsIgnoreCase("0") || m.get("enable") == null)
						enable = "No";
					else
						enable = "Sì";
				%>
	             
	           </thead>
	           <tbody>
	           
	             <tr>
	               <td class="lalign"><%= m.get("id")%></td>
	               <td><%= m.get("ruolo")%></td>
	               <% if(m.get("ruolo").equalsIgnoreCase("Admin")){ %>
	               <td>Admin</td>
	               <td>Admin</td>
	               <%} else{ %>
	               <td><%= m.get("nome")%></td>
	               <td><%= m.get("cognome")%></td>
	               <%} %>
	               <td><%= enable %></td>
	               <%if(ruolo.equalsIgnoreCase("Webmaster")) {%>
	               <td><a href="/admin/eliminaUtente?id=<%= m.get("id")%>">ELIMINA</a></td>
	               <td><a href="/admin/formModificaUtente?id=<%= m.get("id")%>">MODIFICA</a></td>
	               <%} else { %>
	               <%if(m.get("ruolo").equalsIgnoreCase("utente")) {%>
	               <td><a href="/admin/eliminaUtente?id=<%= m.get("id")%>">ELIMINA</a></td>
	               <td><a href="/admin/formModificaUtente?id=<%= m.get("id")%>">MODIFICA</a></td>
	               <%} %>
					<% } %>
	             </tr>
	             
	           
	           </tbody>
	           <% } %>
			<%} %>
	         </table>
	        </div>
	</body>
</html>