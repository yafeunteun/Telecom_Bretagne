<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceIndexation"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                java.util.List"%>

<%@include file="../header.jsp"%>

<%
	Candidature candidature = null;
	boolean isUpdate = false;

	if (isCandidat) {
		IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator
				.getInstance().getRemoteInterface("ServiceCandidature");
		candidature = serviceCandidature.getCandidature(userId);
		isUpdate = true;
	}
	
	// Liste des entreprises
	IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator
			.getInstance().getRemoteInterface("ServiceEntreprise");
	List<Entreprise> entreprises = serviceEntreprise
			.listeDesEntreprises();

	// Liste des secteurs d'activit� et des niveaux de qualification
	IServiceIndexation serviceIndexation = (IServiceIndexation) ServicesLocator
			.getInstance().getRemoteInterface("ServiceIndexation");
	List<SecteurActivite> secteursActivite = serviceIndexation
			.listeDesSecteursActivite();
	List<NiveauQualification> niveauxQualification = serviceIndexation
			.listeDesNiveauxQualification();
%>

<div class="container main-container">
	<div class="row">
		<div class="col-md-offset-1 col-md-8">

			<h3 class="col-sm-offset-4"><%=isUpdate ? "Mise � jour " : "Ajout "%>
				d'une candidature
			</h3>
			<br />

			<form class="form-horizontal" method='post'
				action='<%=AssetsLocator.urlForServlet("AjoutCandidature") %>'>
				<%
					if (isUpdate) {
				%>
				<input type='hidden' value="<%=userId%>" name='id'>
				<%
					}
				%>

				<div class="form-group">
					<label for="inputNom" class="col-sm-4 control-label">Nom</label>
					<div class="col-sm-8">
						<input class="form-control" type='text' name='nom' id="inputNom"
							value="<%=isUpdate ? candidature.getNom() : ""%>" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputPrenom" class="col-sm-4 control-label">Prenom</label>
					<div class="col-sm-8">
						<input class="form-control" type='text' name='prenom'
							id="inputPrenom"
							value="<%=isUpdate ? candidature.getPrenom() : ""%>" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputDateNaissance" class="col-sm-4 control-label">Date
						de Naissance</label>
					<div class="col-sm-8">
						<input class="form-control" type='date' name='dateNaissance'
							id="inputDateNaissance"
							value="<%=isUpdate ? Utils.date2String(candidature.getDateNaissance()) : ""%>" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputCourriel" class="col-sm-4 control-label">Courriel</label>
					<div class="col-sm-8">
						<input class="form-control" type='email' name='courriel'
							id="inputCourriel"
							value="<%=isUpdate ? candidature.getAdresseEmail() : ""%>" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputAdressePostale" class="col-sm-4 control-label">Adresse
						Postale</label>
					<div class="col-sm-8">
						<textarea class="form-control" name='adressePostale'
							id="inputAdressePostale"><%=isUpdate ? candidature.getAdressePostale() : ""%></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="inputCV" class="col-sm-4 control-label">CV</label>
					<div class="col-sm-8">
						<textarea class="form-control" name='cv' id="inputCV"><%=isUpdate ? candidature.getCv() : ""%></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="inputNiveauQualification"
						class="col-sm-4 control-label">Niveau de Qualification</label>
					<div class="col-sm-8">
						<select class="form-control" name="niveauQualification"
							id="inputNiveauQualification">
							<%
								for (NiveauQualification niveauQualification : niveauxQualification) {
							%>
							<option
								<%if (isUpdate
						&& candidature.getNiveauQualificationBean().getId()
								.equals(niveauQualification.getId())) {%>
								selected="selected" <%}%> value=<%=niveauQualification.getId()%>><%=niveauQualification.getIntitule()%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputSecteursActivite" class="col-sm-4 control-label">Secteurs
						d'Activit�</label>
					<div class="col-sm-8">
						<%							
							for (SecteurActivite secteurActivite : secteursActivite) {
								boolean checked = false;
								if (isUpdate) {
									for (SecteurActivite s : candidature.getSecteurActivites()) {
										if (s.getId().equals(secteurActivite.getId())) {
											checked = true;
										}
									}
								}
						%>
						<label class="checkbox-inline"> <input <%= checked ? "checked='checked'" : "" %>
							type="checkbox" name="secteursActivite"
							value="<%=secteurActivite.getId()%>"> <%=secteurActivite.getIntitule()%>
						</label>
						<%
							}
						%>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-default">Envoyer</button>
						<% if (isUpdate) { %>
						<a
							href="<%=AssetsLocator.urlForServlet("SupprimerCandidature") %>?id=<%=userId%>"
							class="btn btn-danger">Supprimer </a>
						<% } %>
					</div>
				</div>
			</form>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<%@include file="../footer.jsp"%>