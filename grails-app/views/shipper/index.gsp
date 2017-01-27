
<%@ page import="com.cimbidia.wm.shipment.Shipper" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shipper.label', default: 'Shipper')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shipper" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shipper" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'shipper.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'shipper.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="trackingUrl" title="${message(code: 'shipper.trackingUrl.label', default: 'Tracking Url')}" />
					
						<g:sortableColumn property="trackingFormat" title="${message(code: 'shipper.trackingFormat.label', default: 'Tracking Format')}" />
					
						<g:sortableColumn property="parameterName" title="${message(code: 'shipper.parameterName.label', default: 'Parameter Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'shipper.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shipperInstanceList}" status="i" var="shipperInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shipperInstance.id}">${fieldValue(bean: shipperInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: shipperInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: shipperInstance, field: "trackingUrl")}</td>
					
						<td>${fieldValue(bean: shipperInstance, field: "trackingFormat")}</td>
					
						<td>${fieldValue(bean: shipperInstance, field: "parameterName")}</td>
					
						<td><g:formatDate date="${shipperInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shipperInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
