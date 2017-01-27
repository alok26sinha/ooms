
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneCarrier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ratingLaneCarrier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ratingLaneCarrier" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="ratingLaneCarrier.carrier.label" default="Carrier" /></th>
					
						<th><g:message code="ratingLaneCarrier.mot.label" default="Mot" /></th>
					
						<th><g:message code="ratingLaneCarrier.equipment.label" default="Equipment" /></th>
					
						<th><g:message code="ratingLaneCarrier.tempCtrl.label" default="Temp Ctrl" /></th>
					
						<th><g:message code="ratingLaneCarrier.serviceLevel.label" default="Service Level" /></th>
					
						<th><g:message code="ratingLaneCarrier.secondaryCarrier.label" default="Secondary Carrier" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ratingLaneCarrierInstanceList}" status="i" var="ratingLaneCarrierInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ratingLaneCarrierInstance.id}">${fieldValue(bean: ratingLaneCarrierInstance, field: "carrier")}</g:link></td>
					
						<td>${fieldValue(bean: ratingLaneCarrierInstance, field: "mot")}</td>
					
						<td>${fieldValue(bean: ratingLaneCarrierInstance, field: "equipment")}</td>
					
						<td>${fieldValue(bean: ratingLaneCarrierInstance, field: "tempCtrl")}</td>
					
						<td>${fieldValue(bean: ratingLaneCarrierInstance, field: "serviceLevel")}</td>
					
						<td>${fieldValue(bean: ratingLaneCarrierInstance, field: "secondaryCarrier")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ratingLaneCarrierInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
