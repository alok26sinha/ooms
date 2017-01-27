
<%@ page import="com.cimbidia.scm.oms.InventorySupplyType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventorySupplyType.label', default: 'InventorySupplyType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventorySupplyType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventorySupplyType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventorySupplyType.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventorySupplyType.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventorySupplyType.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventorySupplyType.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'inventorySupplyType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="onhandSupply" title="${message(code: 'inventorySupplyType.onhandSupply.label', default: 'Onhand Supply')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventorySupplyTypeInstanceList}" status="i" var="inventorySupplyTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventorySupplyTypeInstance.id}">${fieldValue(bean: inventorySupplyTypeInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventorySupplyTypeInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventorySupplyTypeInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventorySupplyTypeInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventorySupplyTypeInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${inventorySupplyTypeInstance.onhandSupply}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventorySupplyTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
