<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%	String m = (String) request.getAttribute("ruolo"); %>
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
		<title>Nuovo Admin</title>
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
		
		<form action="/admin/aggiungiAdmin" method="get">
		
			<div id="wrapper">
			<h1>Aggiungi un nuovo Admin</h1>
				<table id="keywords" cellspacing="0" cellpadding="0">
	           <thead>
	             <tr>
	             	<th><span></span></th>
	               	<th><span></span></th>
	             </tr>
	             </thead>
	             
	             <tbody>
	             	<tr>
	             		<td>USERNAME</td>
	             		<td><input type="text" name="username"></td>
	             	</tr>
	             	<tr>
	             		<td>PASSWORD</td>
	             		<td><input type="text" name="password"></td>
	             	</tr>
	             	<tr>
	             		<td>RUOLO</td>
	             		<td><input type="text" name="ruolo" value="Admin" readonly></td>
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