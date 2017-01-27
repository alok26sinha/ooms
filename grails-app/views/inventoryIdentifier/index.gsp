
<%@ page import="com.cimbidia.scm.oms.InventoryIdentifier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inventoryIdentifier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inventoryIdentifier" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="inventoryIdentifier.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="inventoryIdentifier.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'inventoryIdentifier.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'inventoryIdentifier.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<g:sortableColumn property="batchNo" title="${message(code: 'inventoryIdentifier.batchNo.label', default: 'Batch No')}" />
					
						<g:sortableColumn property="countryOfOrigin" title="${message(code: 'inventoryIdentifier.countryOfOrigin.label', default: 'Country Of Origin')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inventoryIdentifierInstanceList}" status="i" var="inventoryIdentifierInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inventoryIdentifierInstance.id}">${fieldValue(bean: inventoryIdentifierInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: inventoryIdentifierInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${inventoryIdentifierInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${inventoryIdentifierInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: inventoryIdentifierInstance, field: "batchNo")}</td>
					
						<td>${fieldValue(bean: inventoryIdentifierInstance, field: "countryOfOrigin")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inventoryIdentifierInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
