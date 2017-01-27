
<%@ page import="com.cimbidia.scm.oms.InventoryFuture" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryFuture.label', default: 'InventoryFuture')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryFuture" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryFuture" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventoryFuture.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventoryFuture.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventoryFuture.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventoryFuture.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="inventoryFuture.itemLocation.label" default="Item Location" /></th>
					
						<th><g:message code="inventoryFuture.inventoryIdentifier.label" default="Inventory Identifier" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryFutureInstanceList}" status="i" var="inventoryFutureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryFutureInstance.id}">${fieldValue(bean: inventoryFutureInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryFutureInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventoryFutureInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventoryFutureInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryFutureInstance, field: "itemLocation")}</td>
					
						<td>${fieldValue(bean: inventoryFutureInstance, field: "inventoryIdentifier")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryFutureInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
