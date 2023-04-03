<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.generation.workaway.entities.Viaggio" %>  
<%	Viaggio v = (Viaggio) request.getAttribute("utente"); %>

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
		<title>Modifica Viaggio</title>
	</head>
	<body>
		<header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                	<a href="/">Home</a>
                	<a href="/about">About</a>
					<a href="/logout">Logout</a>
				  </div>
			  </div>
			  
		</header>
		
		<form action="/admin/modificaViaggio" method="get">
		
			<div id="wrapper">
			<h1>Modifica Viaggio</h1>
				<table id="keywords" cellspacing="0" cellpadding="0">
	           <thead>
	             <tr>
	             	<th><span><input type="hidden" name="id" value="<%= v.getId()%>"></span></th>
	               	<th><span></span></th>
	             </tr>
	             </thead>
	             
	             <tbody>
	             <tr>
	             		<td>DESTINAZIONE</td>
	             		<td><input type="text" name="destinazione" value="<%= v.getDestinazione()%>"></td>
	             	</tr>
	             	<tr>
	             		<td>IMMAGINE</td>
	             		<td><input type="text" name="img" value="<%= v.getImg()%>"></td>
	             	</tr>
	             	<tr>
	             		<td>PARTENZA</td>
	             		<td><input type="text" name="partenza" value="<%= v.getPartenza()%>"></td>
	             	</tr>
	             	<tr>
	             		<td>DATA VIAGGIO</td>
	             		<td><input type="text" name="data_viaggio" value="<%= v.getData_viaggio()%>"></td>
	             	</tr>
	             	<tr>
	             		<td>TARIFFA</td>
	             		<td><input type="text" name="tariffa" value="<%= v.getTariffa() %>"></td>
	             	</tr>
	             	<tr>
	             		<td>PERNOTTAMENTO</td>
	             		<td><input type="text" name="tipo_pernottamento" value="<%= v.getTipo_pernottamento() %>"></td>
	             	</tr>
	             	<tr>
	             		<td>DISPONIBILI</td>
	             		<td><input type="text" name="disponibili" value="<%= v.getDisponibili() %>"></td>
	             	</tr>
	             </tbody>
	             <thead>
	             	<tr>
	             		<td></td>
	             		<td><input type="submit" value="AGGIORNA"></td>
	             	</tr>
	             </thead>
	             </table>
			</div>
		
		</form>
	</body>
</html>