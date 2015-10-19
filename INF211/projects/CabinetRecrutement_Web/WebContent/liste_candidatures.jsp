<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
  // R�cup�ration du service (bean session)
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
// Appel de la fonctionnalit� d�sir�e aupr�s du service
	List<Candidature> candidatures = serviceCandidature.listeDesCandidatures();
%>

<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cabinet de recrutement : liste des candidatures r�f�renc�es</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
  </head>

  <body>
  
		<h2>Liste des candidatures r�f�renc�es :</h2>

		<table id="affichage">
		  <tr>
		    <th>Identifiant</th>
		    <th>Nom</th>
		    <th>Pr�nom</th>
		    <th>Date de naissance</th>
		    <th>Adresse mail</th>
		    <th>Adresse postale (ville)</th>
		    <th>CV</th>
		    <th>Date dep�t</th>
		    <th>Niveau qualification</th>
		    <th>Secteur d'activit�s</th>
		  </tr>
		  <%
		  for(Candidature candidature : candidatures)
		  {
		    %>
		    <tr>
		     <td>ENT_<%=candidature.getId()%></td>
		    <td><a href="infos_candidature.jsp?id=<%=candidature.getId()%>"><%=candidature.getNom()%></a></td> 
		    <td><%=candidature.getNom()%>Nom</td>
		    <td><%=candidature.getPrenom()%>Pr�nom</td>
		    <td><%=candidature.getDateNaissance().toString()%>Date de naissance</td>
		    <td><%=candidature.getAdresseEmail()%>Adresse mail</td>
		    <td><%=candidature.getAdressePostale()%>Adresse postale</td>
		    <td><%=candidature.getCv()%>CV</td>
		    <td><%=candidature.getDateDepot().toString()%>Date d�p�t</td>
		    <td><%=candidature.getNiveauQualificationBean().toString()%>Niveau de qualification</td>
		    <td><%=candidature.getSecteurActivites().toString()%>Secteur d'activit�</td>
		    
<%-- 		     <td><%=entreprise.getAdressePostale()%></td> --%>
<%-- 		     <td><a href="ajout_entreprises.jsp?id=<%=entreprise.getId()%>">Modifier</a>/<a href="SupprimerEntrepriseServlet?id=<%=entreprise.getId()%>">Supprimer</a></td> --%>
 		    </tr> 
		    <%
		  }
		  %>
		</table>

    <a href="index.jsp">Retour au menu</a>

  </body>
  
</html>
