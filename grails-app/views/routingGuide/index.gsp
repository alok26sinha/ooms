
<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'routingGuide.label', default: 'RoutingGuide')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-routingGuide" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-routingGuide" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="routingGuide.company.label" default="Company" /></th>
					
						<th><g:message code="routingGuide.businessUnit.label" default="Business Unit" /></th>
					
						<th><g:message code="routingGuide.origin.label" default="Origin" /></th>
					
						<th><g:message code="routingGuide.destination.label" default="Destination" /></th>
					
						<th><g:message code="routingGuide.fromAddress.label" default="From Address" /></th>
					
						<th><g:message code="routingGuide.toAddress.label" default="To Address" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${routingGuideInstanceList}" status="i" var="routingGuideInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${routingGuideInstance.id}">${fieldValue(bean: routingGuideInstance, field: "company")}</g:link></td>
					
						<td>${fieldValue(bean: routingGuideInstance, field: "businessUnit")}</td>
					
						<td>${fieldValue(bean: routingGuideInstance, field: "origin")}</td>
					
						<td>${fieldValue(bean: routingGuideInstance, field: "destination")}</td>
					
						<td>${fieldValue(bean: routingGuideInstance, field: "fromAddress")}</td>
					
						<td>${fieldValue(bean: routingGuideInstance, field: "toAddress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${routingGuideInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
