<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filtres Articles</title>
<link rel="stylesheet" href="../css/styletest.css">
</head>
<body>

<h3>Filtre</h3>
	
    <form method="post" action="${pageContext.request.contextPath}/accueil">
	
        <input type="text" name="rechercher" minlength="2" placeholder="Le nom de l'article contient"> 
        <br>
        <label for="categorie">Catégorie:</label>
        <select name="categorie" id="categorie">
            <c:forEach items="${listeCategorie}" var="categorie">
                <option value="${categorie.libelle}"${categorie.libelle == article.categorie.libelle ? 'selected' : ''}>${categorie.libelle}</option>
            </c:forEach>
        </select>
        <br>
        <input type="submit" value="Rechercher">
    </form>

    <br>
    
   <c:choose>
		<c:when test="${userConnected != null}"><!-- Si l'utilisateur est connecte -->
			<p>

    <form method="post" action="${pageContext.request.contextPath}/filtre" >
        
        <input type="radio" name="achatsVentes" value="achats" id="achats" checked="checked">
        <label for="achats">Achats</label>
        <br>
        <input type="radio" name="achatsVentes" value="ventes" id="ventes">
        <label for="ventes">Ventes</label>
        
        <br>

        <fieldset id="filtresAchat">
        <input type="checkbox" name="filtresAchat" value="enchereOuverte" id="enchereOuverte">
        <label for="enchereOuverte">Enchères ouvertes</label>
        <br>
    
        <input type="checkbox" name="filtresAchat" value="mesEncheresEnCours" id="mesEncheresEnCours">
        <label for="mesEncheresEnCours">Mes enchères en cours</label>
        <br>
    
        <input type="checkbox" name="filtresAchat" value="mesEncheresRemportees" id="mesEncheresRemportees">
        <label for="mesEncheresRemportees">Mes enchères remportées</label>
        </fieldset>

        <br>

        <fieldset id="filtresVente">
        <input type="checkbox" name="filtresVente" value="mesVentesEnCours" id="mesVentesEnCours">
        <label for="mesVentesEnCours">Mes ventes en cours</label>
        <br>
    
        <input type="checkbox" name="filtresVente" value="ventesNonDebutees" id="ventesNonDebutees">
        <label for="VentesNonDébutées">Mes ventes non débutées</label>
        <br>
    
        <input type="checkbox" name="filtresVente" value="ventesTerminees" id="ventesTerminees">
        <label for="VentesTerminees">Ventes terminées</label>
        </fieldset>
        
         <input type="submit" value="Filtrer">
    </form>
    </c:when>
    </c:choose>
</body>
</html>