<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%String id_viaggi=(String)request.getAttribute("id"); %>
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
		<title>Nuovo Utente</title>
	</head>
	<body>
	
		<header>
			<a href="#" class="brand">WorkAway</a>
			  <br>
			<div class="navigation">
				<div class="navigation-items">
                	<a href="/">Home</a> 
					<a href="/logout">Logout</a>
				  </div>
			  </div>
			  
		</header>
		
		<form action="/admin/aggiungiAttivita" method="get">
		<input type="hidden" name="id_viaggi" value="<%= id_viaggi%>">
			<div id="wrapper">
			<h1>Aggiungi una nuova Attività</h1>
				<table id="keywords" cellspacing="0" cellpadding="0">
	           <thead>
	             <tr>
	             	<th><span></span></th>
	               	<th><span></span></th>
	             </tr>
	             </thead>
	             
	             <tbody>
	             <tr>
	             		<td>NOME</td>
	             		<td><input type="text" name="nome"></td>
	             	</tr>
	             	<tr>
	             		<td>TIPO</td>
	             		<td><input type="text" name="tipo"></td>
	             	</tr>
	             	<tr>
	             		<td>ORE TOTALI</td>
	             		<td><input type="text" name="oreTot"></td>
	             	</tr>
	             </tbody>
	             <thead>
	             	<tr>
	             		<td></td>
	             		<td><input type="submit" value="ADD"></td>
	             	</tr>
	             </thead>
	             </table>
			</div>
		
		</form>
	
	</body>
</html>