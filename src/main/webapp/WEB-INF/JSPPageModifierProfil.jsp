<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier profil</title>
</head>
<body>


	<%@ include file="/WEB-INF/jsp/JSPHeader.jsp" %>
	
	<h1>Mon profil</h1>
	  <form action="ServletModifierProfile" method="post">
	    <label for="pseudo">Pseudo :</label>
	    <input type="text" id="pseudo" name="pseudo" required minlength="2" maxlenght="30" value=${user.pseudo};><br><br>
	    
	    <label for="nom">Nom :</label>
	    <input type="text" id="nom" name="nom" minlength="2" maxlenght="30" required><br><br>
	   
	   
	    <label for="prenom">Prénom :</label>
	    <input type="text" id="prenom" name="prenom" required minlength="2" maxlenght="30"><br><br>
	    
	    <label for="telephone">Téléphone :</label>
	    <input type="tel" id="telephone" name="telephone" pattern="[0-9]{2}-[0-9]{2}-[0-9]{2}" required><br><br>
	    
	   	<label for="ville">Ville :</label>
	    <input type="text" id="ville" name="ville" minlength="2" maxlenght="30" required><br><br>
	    
	   	<label for="rue">Rue :</label>
	    <input type="text" id="rue" name="rue" minlength="2" maxlenght="30" required><br><br>
	    
	    
	   	<label for="codepostal">Code postal :</label>
	    <input type="text" id="codepostal" name="codepostal" required><br><br>
	    
	    
	    <label for="password">Mot de passe :</label>
	    <input type="password" id="password" name="password" minlength="2" maxlenght="30" required><br><br>
	    
	    <label for="confirmpassword">Confirmation du mot de passe :</label>
	    <input type="password" id="confirmpassword" name="confirmpassword" minlength="2" maxlenght="30" required><br><br>
	    
	    
	    <label for="email">Email :</label>
	    <input type="email" id="email" name="email" minlength="2" maxlenght="30" required><br><br>
	 
	    
	    <input type="submit" value="Créer">
	    <input type="reset" value="Annuler">
	  
	  </form>

	<%@ include file="/WEB-INF/jsp/JSPFooter.jsp" %>
	

</body>
</html>