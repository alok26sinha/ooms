
<%@ page import="com.cimbidia.scm.shipment.ShipmentAccessorial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shipmentAccessorial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shipmentAccessorial" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="shipmentAccessorial.accessorial.label" default="Accessorial" /></th>
					
						<g:sortableColumn property="rate" title="${message(code: 'shipmentAccessorial.rate.label', default: 'Rate')}" />
					
						<th><g:message code="shipmentAccessorial.shipment.label" default="Shipment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shipmentAccessorialInstanceList}" status="i" var="shipmentAccessorialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shipmentAccessorialInstance.id}">${fieldValue(bean: shipmentAccessorialInstance, field: "accessorial")}</g:link></td>
					
						<td>${fieldValue(bean: shipmentAccessorialInstance, field: "rate")}</td>
					
						<td>${fieldValue(bean: shipmentAccessorialInstance, field: "shipment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shipmentAccessorialInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>