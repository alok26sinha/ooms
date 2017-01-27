
<%@ page import="com.cimbidia.scm.oms.InventoryDemandType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryDemandType.label', default: 'InventoryDemandType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryDemandType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryDemandType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="allocatedDemand" title="${message(code: 'inventoryDemandType.allocatedDemand.label', default: 'Allocated Demand')}" />
					
						<g:sortableColumn property="committedDemand" title="${message(code: 'inventoryDemandType.committedDemand.label', default: 'Committed Demand')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'inventoryDemandType.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventoryDemandType.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="demandType" title="${message(code: 'inventoryDemandType.demandType.label', default: 'Demand Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'inventoryDemandType.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryDemandTypeInstanceList}" status="i" var="inventoryDemandTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryDemandTypeInstance.id}">${fieldValue(bean: inventoryDemandTypeInstance, field: "allocatedDemand")}</g:link></td>
					
						<td><g:formatBoolean boolean="${inventoryDemandTypeInstance.committedDemand}" /></td>
					
						<td>${fieldValue(bean: inventoryDemandTypeInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${inventoryDemandTypeInstance.createdDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryDemandTypeInstance, field: "demandType")}</td>
					
						<td>${fieldValue(bean: inventoryDemandTypeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryDemandTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
