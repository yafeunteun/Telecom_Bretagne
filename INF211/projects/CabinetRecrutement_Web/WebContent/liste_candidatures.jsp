<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator
			.getInstance().getRemoteInterface("ServiceCandidature");
	List<Candidature> candidatures = serviceCandidature
			.listeDesCandidatures();
%>

<%@include file="index.jsp"%>

<div class="container main-container">

	<div class="row">
		<h3 class="col-sm-offset-4">Liste des candidatures</h3>
		<br />
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table">
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
					for (Candidature candidature : candidatures) {
				%>
				<tr>
					<td>ENT_<%=candidature.getId()%></td>
					<td><a
						href="infos_candidature.jsp?id=<%=candidature.getId()%>"><%=candidature.getNom()%></a></td>
					<td><%=candidature.getNom()%>Nom</td>
					<td><%=candidature.getPrenom()%>Pr�nom</td>
					<td><%=candidature.getDateNaissance().toString()%>Date de
						naissance</td>
					<td><%=candidature.getAdresseEmail()%>Adresse mail</td>
					<td><%=candidature.getAdressePostale()%>Adresse postale</td>
					<td><%=candidature.getCv()%>CV</td>
					<td><%=candidature.getDateDepot().toString()%>Date d�p�t</td>
					<td><%=candidature.getNiveauQualificationBean().toString()%>Niveau
						de qualification</td>
					<td><%=candidature.getSecteurActivites().toString()%>Secteur
						d'activit�</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>

</div>

<%@include file="footer.jsp"%>