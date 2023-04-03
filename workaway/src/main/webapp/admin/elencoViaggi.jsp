<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.generation.workaway.entities.Viaggio" %>    
<%	List<Viaggio> elenco = (List<Viaggio>) request.getAttribute("elencoViaggi"); %>

<!DOCTYPE html>
<html>
	<head>
	        <meta charset="UTF-8" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	        <link rel="preconnect" href="https://fonts.googleapis.com">
	        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="\css\elencoviaggi.css" />
			<title>Elenco Viaggi</title>
	    </head>
	    <body>
	    	<header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                	<a href="/">Home</a> 
					<a href="/admin/formNuovoViaggio">Nuovo Viaggio</a>
					<a href="/about">About</a>
					<a href="/logout">Logout</a>
				  </div>
			  </div>
			  
		   </header>
		   
		   <div id="wrapper">
	         <h1>Lista Viaggi</h1>
	         
	         <table id="keywords" cellspacing="0" cellpadding="0">
	           <thead>
	             <tr>
	               <th><span>ID</span></th>
	               <th><span>Destinazione</span></th>
	               <th><span>Immagine</span></th>
	               <th><span>Partenza</span></th>
	               <th><span>Data Viaggio</span></th>
	               <th><span>Tariffa</span></th>
	               <th><span>Tipo di Pernottamento</span></th>
	               <th><span>Posti Disponibili</span></th>
	               <th><span></span></th>
	               <th><span></span></th>
	               <th><span></span></th>
	             </tr>
	           </thead>
	           <tbody>
	           <% for(Viaggio m : elenco) {%>
	             <tr>
	               <td class="lalign"><%= m.getId()  %></td>
	               <td><%= m.getDestinazione()%></td>
	               <td><%= m.getImg()%></td>
	               <td><%= m.getPartenza()%></td>
	               <td><%= m.getData_viaggio()%></td>
	               <td><%= m.getTariffa()%></td>
	               <td><%= m.getTipo_pernottamento()%></td>
	               <td><%= m.getDisponibili()%></td>
	                <td><a href="/admin/eliminaViaggio?id=<%= m.getId()%>">ELIMINA</a></td>
	                <td><a href="/admin/formModificaViaggio?id=<%= m.getId()%>">MODIFICA</td>
	                <td><a href="/admin/formNuovaAttivita?id=<%= m.getId()%>">ATTIVITA'</a></td>
	             </tr>
	             <%} %>
	           
	           </tbody>
	         </table>
	        </div> 
	
      
			   
	</body>
</html>