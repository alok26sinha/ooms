
<%@ page import="com.cimbidia.scm.admin.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-company" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="companyId" title="${message(code: 'company.companyId.label', default: 'Company Id')}" />
					
						<g:sortableColumn property="companyName" title="${message(code: 'company.companyName.label', default: 'Company Name')}" />
					
						<g:sortableColumn property="contactAddress1" title="${message(code: 'company.contactAddress1.label', default: 'Contact Address1')}" />
					
						<g:sortableColumn property="contactAddress2" title="${message(code: 'company.contactAddress2.label', default: 'Contact Address2')}" />
					
						<g:sortableColumn property="contactCountry" title="${message(code: 'company.contactCountry.label', default: 'Contact Country')}" />
					
						<g:sortableColumn property="contactEmail" title="${message(code: 'company.contactEmail.label', default: 'Contact Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "companyId")}</g:link></td>
					
						<td>${fieldValue(bean: companyInstance, field: "companyName")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "contactAddress1")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "contactAddress2")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "contactCountry")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "contactEmail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
