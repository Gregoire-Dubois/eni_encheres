<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="fr.eni.enienchere.messages.LecteurMessage"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >
</head>
<body>

	<header>
  <div class="header-left">
    <%@ include file="JSPHeader.jsp"%>
  </div>
  <div class="header-right">
    <%@ include file="JSPHeaderConnexion.jsp"%>
  </div>
</header>

	<section>


			<h1>Liste des enchères</h1>
			<%@ include file="tests/FiltreArticles.jsp"%>
		
		<c:choose>
			<c:when test="${!empty listeErreurs}">
				<c:forEach var="erreur" items="${listeErreurs}">
					<p>${LecteurMessage.getMessageErreur(erreur)}</p>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<c:choose>
			<c:when test="${userConnected != null}"><!-- Si l'utilisateur est connecte -->
			<c:forEach var="article" items="${articles}">
			<div class="resultatsNonConnecte">
		
				
					<div class="card">
					<a href="${pageContext.request.contextPath}/encherir?idArticle=${article.noArticle}">
						<img
							src="https://static.fnac-static.com/multimedia/Images/FR/MDM/24/35/1f/18822436/1540-1/tsp20230519135127/The-Legend-of-Zelda-Tears-Of-The-Kingdom-Nintendo-Switch.jpg"
							alt="Image de la card"></a>
						<div class="card-content">
							<h2><a href="${pageContext.request.contextPath}/encherir?idArticle=${article.noArticle}">${article.nomArticle}</a></h2> 
							
							<p>Prix :${article.prixVente != '0' ? article.prixVente : article.prixInitial}</p> 
							<p>Fin de l'enchère :${article.dateFinEncheres}</p>
							<p><a href="${pageContext.request.contextPath}/profil?idVendeur=${article.vendeur.noUtilisateur}">Vendeur : ${article.vendeur.getPseudo()}</a></p> 
		
						</div>
					</div>
				
		
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise><!-- Si l'utilisateur n'est pas connecte -->

				<div class="resultatsNonConnecte">

						<c:forEach var="article" items="${articles}">
							<div class="card">
									<img src="#" alt="Image de la card">
									<div class="card-content">
										<h2>${article.nomArticle}</h2>
										<p>Prix :${article.prixVente != '0' ? article.prixVente : article.prixInitial}</p> 
										<p>Fin de l'enchère : ${article.dateFinEncheres}</p>
										<p>Vendeur : ${article.vendeur.pseudo}</p>
		
									</div>
							</div>
						</c:forEach>
					
				</div>

			
			
			</c:otherwise>

		</c:choose>
		
		</c:otherwise>
		
		</c:choose>



	</section>

	<%@ include file="JSPFooter.jsp"%>



</body>
</html>