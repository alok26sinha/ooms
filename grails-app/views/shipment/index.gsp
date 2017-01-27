
<%@ page import="com.cimbidia.wm.shipment.Shipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shipment.label', default: 'Shipment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shipment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shipment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'shipment.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="shipmentNumber" title="${message(code: 'shipment.shipmentNumber.label', default: 'Shipment Number')}" />
					
						<th><g:message code="shipment.origin.label" default="Origin" /></th>
					
						<th><g:message code="shipment.destination.label" default="Destination" /></th>
					
						<g:sortableColumn property="expectedShippingDate" title="${message(code: 'shipment.expectedShippingDate.label', default: 'Expected Shipping Date')}" />
					
						<g:sortableColumn property="expectedDeliveryDate" title="${message(code: 'shipment.expectedDeliveryDate.label', default: 'Expected Delivery Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shipmentInstanceList}" status="i" var="shipmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shipmentInstance.id}">${fieldValue(bean: shipmentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: shipmentInstance, field: "shipmentNumber")}</td>
					
						<td>${fieldValue(bean: shipmentInstance, field: "origin")}</td>
					
						<td>${fieldValue(bean: shipmentInstance, field: "destination")}</td>
					
						<td><g:formatDate date="${shipmentInstance.expectedShippingDate}" /></td>
					
						<td><g:formatDate date="${shipmentInstance.expectedDeliveryDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shipmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
