
<%@ page import="com.cimbidia.scm.oms.AllocationTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allocationTemplate.label', default: 'AllocationTemplate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-allocationTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-allocationTemplate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="allocationTemplate.company.label" default="Company" /></th>
					
						<th><g:message code="allocationTemplate.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'allocationTemplate.createdDttm.label', default: 'Created Dttm')}" />
					
						<th><g:message code="allocationTemplate.customer.label" default="Customer" /></th>
					
						<g:sortableColumn property="dueDate" title="${message(code: 'allocationTemplate.dueDate.label', default: 'Due Date')}" />
					
						<th><g:message code="allocationTemplate.modifiedBy.label" default="Modified By" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allocationTemplateInstanceList}" status="i" var="allocationTemplateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allocationTemplateInstance.id}">${fieldValue(bean: allocationTemplateInstance, field: "company")}</g:link></td>
					
						<td>${fieldValue(bean: allocationTemplateInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${allocationTemplateInstance.createdDttm}" /></td>
					
						<td>${fieldValue(bean: allocationTemplateInstance, field: "customer")}</td>
					
						<td><g:formatDate date="${allocationTemplateInstance.dueDate}" /></td>
					
						<td>${fieldValue(bean: allocationTemplateInstance, field: "modifiedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allocationTemplateInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
