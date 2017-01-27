
<%@ page import="com.cimbidia.scm.oms.InventoryDemand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryDemand.label', default: 'InventoryDemand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryDemand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryDemand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventoryDemand.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventoryDemand.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventoryDemand.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventoryDemand.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="inventoryDemand.inventoryDemandType.label" default="Inventory Demand Type" /></th>
					
						<th><g:message code="inventoryDemand.itemLocation.label" default="Item Location" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryDemandInstanceList}" status="i" var="inventoryDemandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryDemandInstance.id}">${fieldValue(bean: inventoryDemandInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryDemandInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventoryDemandInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventoryDemandInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryDemandInstance, field: "inventoryDemandType")}</td>
					
						<td>${fieldValue(bean: inventoryDemandInstance, field: "itemLocation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryDemandInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
