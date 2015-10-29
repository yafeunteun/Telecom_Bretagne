<%@page import="java.text.SimpleDateFormat"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                java.util.List"%>

<%
	// R�cup�ration du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance()
			.getRemoteInterface("ServiceOffreEmploi");

	List<OffreEmploi> offresEmploi = serviceOffreEmploi.listeDesOffresEmploi();
%>

<%@include file="header.jsp"%>

<div class="container main-container">

	<div class="row above-table-row">
		<span class="col-md-11 above-table-title">Liste des offres
			d'emploi</span> <span class="col-md-1"><a
			href="ajout_offre_emploi.jsp" class="btn btn-default">Ajouter</a></span>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<tr>
					<th>Num�ro</th>
					<th>Date de D�p�t</th>
					<th>Entreprise</th>
					<th>Titre</th>
					<th>Niveau Qualification</th>
				</tr>
				<%
					for (OffreEmploi offreEmploi : offresEmploi) {
				%>
				<tr>
					<td><%=offreEmploi.getId()%></td>
					<td><%=new SimpleDateFormat("dd MMM yyyy").format(offreEmploi.getDateDepot())%></td>
					<td><a
						href="infos_entreprise.jsp?id=<%=offreEmploi.getEntrepriseBean().getId()%>"><%=offreEmploi.getEntrepriseBean().getNom()%></a></td>
					<td><a
						href="infos_offre_emploi.jsp?id=<%=offreEmploi.getId()%>"><%=offreEmploi.getTitre()%></a></td>
					<td><%=offreEmploi.getNiveauQualificationBean().getIntitule()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>

</div>

<%@include file="footer.jsp"%>
