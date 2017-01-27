
<%@ page import="com.cimbidia.scm.oms.Inventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventory.label', default: 'Inventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventory.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventory.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventory.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventory.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<g:sortableColumn property="allocQty" title="${message(code: 'inventory.allocQty.label', default: 'Alloc Qty')}" />
					
						<th><g:message code="inventory.company.label" default="Company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryInstanceList}" status="i" var="inventoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryInstance.id}">${fieldValue(bean: inventoryInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventoryInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventoryInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryInstance, field: "allocQty")}</td>
					
						<td>${fieldValue(bean: inventoryInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
