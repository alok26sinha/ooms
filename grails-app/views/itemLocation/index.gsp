
<%@ page import="com.cimbidia.scm.oms.ItemLocation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemLocation.label', default: 'ItemLocation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemLocation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="itemLocation.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="itemLocation.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'itemLocation.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'itemLocation.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="itemLocation.company.label" default="Company" /></th>
					
						<g:sortableColumn property="isActive" title="${message(code: 'itemLocation.isActive.label', default: 'Is Active')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemLocationInstanceList}" status="i" var="itemLocationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemLocationInstance.id}">${fieldValue(bean: itemLocationInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${itemLocationInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${itemLocationInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "company")}</td>
					
						<td><g:formatBoolean boolean="${itemLocationInstance.isActive}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemLocationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
