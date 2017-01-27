
<%@ page import="com.cimbidia.scm.oms.InventoryOnHand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryOnHand.label', default: 'InventoryOnHand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryOnHand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryOnHand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventoryOnHand.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventoryOnHand.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventoryOnHand.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventoryOnHand.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="inventoryOnHand.itemLocation.label" default="Item Location" /></th>
					
						<th><g:message code="inventoryOnHand.inventoryIdentifier.label" default="Inventory Identifier" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryOnHandInstanceList}" status="i" var="inventoryOnHandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryOnHandInstance.id}">${fieldValue(bean: inventoryOnHandInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryOnHandInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventoryOnHandInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventoryOnHandInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryOnHandInstance, field: "itemLocation")}</td>
					
						<td>${fieldValue(bean: inventoryOnHandInstance, field: "inventoryIdentifier")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryOnHandInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
