package fr.eni.enienchere.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.enienchere.BusinessException;
import fr.eni.enienchere.bll.ArticleManager;
import fr.eni.enienchere.bo.ArticleVendu;
import fr.eni.enienchere.bo.Utilisateur;

/**
 * Servlet implementation class ServletFiltresRecherche
 */
@WebServlet("/filtre")
public class ServletFiltresRecherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFiltresRecherche() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String type = request.getParameter("type");
		session.setAttribute("type", type);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/JSPAccueil.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String[] filtresAchats = request.getParameterValues("filtresAchat");
		String[] filtresVentes= request.getParameterValues("filtresVente");
		int nombreParametresAchats;
		int nombreParametresVentes;
		if(filtresAchats!=null) {
			nombreParametresAchats = filtresAchats.length;
		}else {
			nombreParametresAchats = 0;
		}
		if(filtresVentes!=null) {
			nombreParametresVentes = filtresVentes.length;
		}else {
			nombreParametresVentes = 0;
		}
		List<String> listeFiltresAchats = new ArrayList<>();
		List<String> listeFiltresVentes = new ArrayList<>();
		
		if(nombreParametresAchats!=0) {
			
			for(int i =0; i<nombreParametresAchats; i++) {
				listeFiltresAchats.add(filtresAchats[i]);
			}
		}
		if(nombreParametresVentes!=0) {
			
			for(int i =0; i<nombreParametresVentes; i++) {
				listeFiltresVentes.add(filtresVentes[i]);
			}
		}
		
		session.setAttribute("listeFiltresAchats", listeFiltresAchats);
		session.setAttribute("listeFiltresVentes",listeFiltresVentes);
		System.out.println(nombreParametresAchats);
		System.out.println(nombreParametresVentes);
		ArticleManager articleManager = new ArticleManager();
		Utilisateur userConnected = (Utilisateur) session.getAttribute("userConnected");
		List<ArticleVendu> listeArticles = null;
		try {
			if(nombreParametresAchats!=0) {
			listeArticles = articleManager.selectionnerArticlesFiltresAchats(filtresAchats, nombreParametresAchats, userConnected);
			for(ArticleVendu article : listeArticles) {
				System.out.println("???"+article);
			}
			}else {
				if(nombreParametresVentes!=0){
					listeArticles = articleManager.selectionnerArticlesFiltresVentes(filtresVentes, nombreParametresVentes, userConnected);
				}else {
					listeArticles = articleManager.selectionnerParDefaut(userConnected);
				}
			}
			
			if(!listeArticles.isEmpty()) {
				for(ArticleVendu a : listeArticles) {
					System.out.println(a);
				}
				request.setAttribute("articles", listeArticles); // ou session
				//response.sendRedirect(request.getContextPath()+"/accueil");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/JSPAccueil.jsp");
				rd.forward(request, response);
			}else {
				System.out.println("Liste null");
				BusinessException businessException = new BusinessException();
				businessException.ajouterErreur(CodesResultatServlet.PAS_D_ARTICLES_ERREUR);
				throw businessException;
			}	
		} catch (BusinessException e) {
			e.printStackTrace();
			List<Integer> listeErreurs = e.getListeCodesErreur();
			request.setAttribute("listeErreurs", listeErreurs);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/JSPAccueil.jsp");
			rd.forward(request, response);
		}
		

	}

}
