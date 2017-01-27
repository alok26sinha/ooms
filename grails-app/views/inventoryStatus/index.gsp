
<%@ page import="com.cimbidia.scm.oms.InventoryStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryStatus.label', default: 'InventoryStatus')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryStatus" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'inventoryStatus.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="inventoryStatus" title="${message(code: 'inventoryStatus.inventoryStatus.label', default: 'Inventory Status')}" />
					
						<g:sortableColumn property="supplyType" title="${message(code: 'inventoryStatus.supplyType.label', default: 'Supply Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryStatusInstanceList}" status="i" var="inventoryStatusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryStatusInstance.id}">${fieldValue(bean: inventoryStatusInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryStatusInstance, field: "inventoryStatus")}</td>
					
						<td>${fieldValue(bean: inventoryStatusInstance, field: "supplyType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryStatusInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
