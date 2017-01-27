
<%@ page import="com.cimbidia.scm.oms.FulfillmentType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fulfillmentType.label', default: 'FulfillmentType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fulfillmentType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fulfillmentType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'fulfillmentType.description.label', default: 'Description')}" />
					
						<th><g:message code="fulfillmentType.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="fulfillmentType.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'fulfillmentType.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="lastUpdatedDttm" title="${message(code: 'fulfillmentType.lastUpdatedDttm.label', default: 'Last Updated Dttm')}" />
					
						<th><g:message code="fulfillmentType.company.label" default="Company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fulfillmentTypeInstanceList}" status="i" var="fulfillmentTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fulfillmentTypeInstance.id}">${fieldValue(bean: fulfillmentTypeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: fulfillmentTypeInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: fulfillmentTypeInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${fulfillmentTypeInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${fulfillmentTypeInstance.lastUpdatedDttm}" /></td>
					
						<td>${fieldValue(bean: fulfillmentTypeInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fulfillmentTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
