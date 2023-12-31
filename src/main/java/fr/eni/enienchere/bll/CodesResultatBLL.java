package fr.eni.enienchere.bll;
//Attribution des codes de 20000 à 29999, concerne la couche BLL
public abstract class CodesResultatBLL {
	
	// Erreurs liées à l'utilisateur
	public static final int PSEUDO_VIDE_ERREUR=20000;
	public static final int NOM_VIDE_ERREUR=20001;
	public static final int PRENOM_VIDE_ERREUR=20002;
	public static final int EMAIL_VIDE_ERREUR=20003;
	public static final int RUE_VIDE_ERREUR=20004;
	public static final int CODEPOSTAL_VIDE_ERREUR=20005;
	public static final int VILLE_VIDE_ERREUR=20006;
	public static final int MDP_VIDE_ERREUR=20007;
	public static final int PAS_DE_CORRESPONDANCE_ERREUR=20008;
	public static final int PSEUDO_ALPHA_NUM_ERREUR=20009;
	public static final int NOM_ALPHA_ERREUR=20010;
	public static final int RUE_ALPHA_NUM_ESP_ERREUR=20011;
	public static final int PRENOM_ALPHA_ERREUR=20012;
	public static final int CODEPOSTAL_NUM_ERREUR=20013;
	public static final int VILLE_ALPHA_ERREUR=20014;
	public static final int PSEUDO_DOUBLON_ERREUR=20015;
	public static final int EMAIL_DOUBLON_ERREUR=20016;
	public static final int TELEPHONE_NUM_ERREUR=20017;
	public static final int ID_INEXISTANT_ERREUR=20018;
	public static final int MDP_ERREUR=20019;
	
	// Erreurs liées à l'article
	public static final int NOM_ARTICLE_VIDE_ERREUR=20100;
	public static final int DESCRIPTION_ARTICLE_VIDE_ERREUR=20101;
	public static final int DATE_DEBUT_ENCHERE_INFERIEURE_DATE_JOUR_ERREUR=20102;
	public static final int DATE_FIN_ENCHERE_INFERIEURE_EGALE_DATE_DEBUT_ERREUR=20103;
	public static final int PRIX_VENTE_INFERIEUR_EGAL_A_0_ERREUR=20104;
	public static final int PRIX_DE_VENTE_VIDE_ERREUR=20105;
//	public static final int CATEGORIE_ARTICLE_NON_AUTORISEE_ERREUR=20106;
//	public static final int CATEGORIE_ARTICLE_VIDE_ERREUR=20107;
//	public static final int PSEUDO_VENDEUR_INTROUVABLE_ERREUR=20108;
//	public static final int PSEUDO_VENDEUR_VIDE_ERREUR=20109;
//	public static final int NOM_ARTICLE_ALPHA_ERREUR=20110;
//	public static final int DESCRIPTION_ARTICLE_ALPHA_ERREUR=20111;
	public static final int ETAT_VENTE_ERREUR=20112;
}
