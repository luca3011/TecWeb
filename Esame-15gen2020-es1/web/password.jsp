<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gestione Password</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
	</head>
	
	<body>
	
		<h1>Gestione password</h1>
		
		<form action="/login" method="post">
			<label for="user">Username:</label><br>
			<input type="text" id="username" name="username"><br>
			<label for="password">Password:</label><br>
			<input type="password" id="password" name="password"><br><br>
			
			<label for="group">Scegli un gruppo:</label>
			<select name="group" id="cars">
			  <option value="gruppo1">gruppo1</option>
			  <option value="gruppo2">gruppo2</option>
			  <option value="gruppo3">gruppo3</option>
			  <option value="gruppo4">gruppo4</option>
			</select><br><br>
			
			<input type="submit" value="Login">
		</form><br><br>
			
		
		<form action="/register" method="post">
			<label for="user">Username:</label><br>
			<input type="text" id="username" name="username"><br>
			<label for="password">Password:</label><br>
			<input type="password" id="password" name="password"><br><br>
			<input type="submit" value="Sign-in">
		
		</form>
		
		<div>
		  	<%
		  		String err = (String)session.getAttribute("err");
		  	  	if(err!=null)
		  	  	{
		  		  int codiceErr = Integer.parseInt(err);
		  		  switch(codiceErr)
		  		  {
		  		  	case 1:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: il gruppo selezionato non esiste</b></p>
		  			  <% 
		  		 	}break;
		  		 	
		  		  case 2:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: L'utente non esiste per il gruppo selezionato</b></p>
		  			  <% 
		  		 	}break;
		  		 	
			  		case 3:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: Password utente scaduta, cambiarla presso la pagina registration</b></p>
		  			  <% 
		  		 	}break;
	  		 	
			  		case 4:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: Nel Gruppo selezionato ci sono almeno 3 password scadute, cambiare la propria presso la pagina registration</b></p>
		  			  <% 
		  		 	}break;
		  		 	
			  		case 5:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: Password sbagliata</b></p>
		  			  <% 
		  		 	}break;
		  		 	
			  		case 6:
		  		  	{
		  			  %>
		  			  	<p><b> Errore: Password sbagliata per piu di tre volte, utente bloccato</b></p>
		  			  <% 
		  		 	}break;
		  		  }
		  	  }
		  	%>
	  </div>
	  
	  
	
	</body>
	
</html>