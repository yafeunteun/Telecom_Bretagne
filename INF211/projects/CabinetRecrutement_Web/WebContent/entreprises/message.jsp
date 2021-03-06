<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>
<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>
<%
	int idOffreEmploi = Integer.parseInt(request.getParameter("idOffreEmploi"));
	/* int idMessage = Integer.parseInt(request.getParameter("idMessage"));
	
	// TODO CHECK if idMessage and display instead */

	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance()
			.getRemoteInterface("ServiceOffreEmploi");
	OffreEmploi offreEmploi = serviceOffreEmploi.getOffreEmploi(idOffreEmploi);
%>

<%@include file="../header.jsp"%>

<div class="container main-container">
	<div class="row">
		<div class="col-md-offset-1 col-md-8">

			<h3 class="col-sm-offset-4">
				Message a
				<%=offreEmploi.getEntrepriseBean().getNom()%>
				pour
				<%=offreEmploi.getTitre()%>
			</h3>
			<br />

			<form class="form-horizontal" method='post'
				action='<%=AssetsLocator.urlForServlet("EnvoyerMessageOffreEmploi")%>'>
				<input type='hidden' value="<%=userId%>" name='idCandidature'>
				<input type='hidden' value="<%=idOffreEmploi%>" name='idOffreEmploi'>

				<div class="form-group">
					<label for="inputMessage" class="col-sm-4 control-label">Message</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="message" id="inputMessage"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-default">Envoyer</button>
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