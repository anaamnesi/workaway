<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%
    Map<String, String> m = (Map<String,String>) request.getAttribute("utente"); 
    Map<String, String> c = null;
    if(!(request.getAttribute("cliente")==null)) {
        c = (Map<String,String>) request.getAttribute("cliente");
    } else {
        c = new HashMap<String, String>();
        c.put("nome","Admin");
        c.put("cognome","Admin");
    }
%>

<!DOCTYPE html>
<html>
	<head>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="\css\elencoutenti.css" />
		<title>Modifica Utente</title>
	</head>
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
		  
			
			<form action="/admin/modificaUtente" method="get">
				<input type="hidden" name="id" value="<%= m.get("id")%>">
			
				<div id="wrapper">
	         	<h1>UTENTE <%= c.get("nome").toUpperCase() %> <%= c.get("cognome").toUpperCase() %></h1>
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
	             	<td><input type="text" name="nome" value="<%=c.get("nome")%>"></td>
	             </tr>
	             <tr>
	             	<td>COGNOME</td>
	             	<td><input type="text" name="cognome" value="<%=c.get("cognome")%>"></td>
	             </tr>
	             <tr>
		             <td>RUOLO</td>
		             <td><input type="text" name="ruolo" value="<%= m.get("ruolo")%>" readonly></td>
	             </tr>
	             <tr>
		             <td>USERNAME</td>
		             <td><input type="text" name="username" value="<%= m.get("username")%>"></td>
	             </tr>
	             <tr>
		             <td>PASSWORD</td>
		             <td><input type="text" name="password" value="<%= m.get("password")%>"></td>
	             </tr>

	             <% if(m.get("ruolo").equalsIgnoreCase("utente")){ %>
		             <tr>
			             <td>EMAIL</td>
			             <td><input type="text" name="mail" value="<%=c.get("mail") %>"></td>
		             </tr>
		             <tr>
			             <td>TELEFONO</td>
			             <td><input type="text" name="telefono" value="<%=c.get("telefono") %>"></td>
		             </tr>
		             <tr>
			             <td>AZIENDA</td>
			             <td><input type="text" name="azienda" value="<%=c.get("azienda") %>"></td>
		             </tr>
	             <%} %>
	             
	             <%
				String raritaTrue = "";
				String valoreTrue = "";
				String raritaFalse = "";
				String valoreFalse = "";
				if(m.get("enable").equalsIgnoreCase("0") || m.get("enable") == null)
				{
					raritaFalse = "No";
					valoreFalse = "0";
					raritaTrue = "Sì";
					valoreTrue = "1";
				}
				else
				{
					raritaFalse = "Sì";
					valoreFalse = "1";
					raritaTrue = "No";
					valoreTrue = "0";
				}
			%>
	             <tr>
	             	<td>ABILITATO</td>
	             	<td><select name="enable">
						<option value="<%= valoreFalse %>"><%= raritaFalse %></option>
						<option value="<%= valoreTrue %>"><%= raritaTrue %></option>
					</select></td>
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