
<%@ page import="com.cimbidia.wm.core.rg.RatingLane" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ratingLane.label', default: 'RatingLane')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ratingLane" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ratingLane" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="ratingLane.company.label" default="Company" /></th>
					
						<th><g:message code="ratingLane.businessUnit.label" default="Business Unit" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'ratingLane.status.label', default: 'Status')}" />
					
						<th><g:message code="ratingLane.origin.label" default="Origin" /></th>
					
						<th><g:message code="ratingLane.originShipVia.label" default="Origin Ship Via" /></th>
					
						<th><g:message code="ratingLane.destination.label" default="Destination" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ratingLaneInstanceList}" status="i" var="ratingLaneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ratingLaneInstance.id}">${fieldValue(bean: ratingLaneInstance, field: "company")}</g:link></td>
					
						<td>${fieldValue(bean: ratingLaneInstance, field: "businessUnit")}</td>
					
						<td>${fieldValue(bean: ratingLaneInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: ratingLaneInstance, field: "origin")}</td>
					
						<td>${fieldValue(bean: ratingLaneInstance, field: "originShipVia")}</td>
					
						<td>${fieldValue(bean: ratingLaneInstance, field: "destination")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ratingLaneInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
