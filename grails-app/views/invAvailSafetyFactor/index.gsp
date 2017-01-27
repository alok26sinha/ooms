
<%@ page import="com.cimbidia.scm.oms.InvAvailSafetyFactor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-invAvailSafetyFactor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-invAvailSafetyFactor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="invAvailSafetyFactor.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="invAvailSafetyFactor.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'invAvailSafetyFactor.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'invAvailSafetyFactor.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="invAvailSafetyFactor.company.label" default="Company" /></th>
					
						<th><g:message code="invAvailSafetyFactor.invertorySupplyType.label" default="Invertory Supply Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invAvailSafetyFactorInstanceList}" status="i" var="invAvailSafetyFactorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${invAvailSafetyFactorInstance.id}">${fieldValue(bean: invAvailSafetyFactorInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${invAvailSafetyFactorInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${invAvailSafetyFactorInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "company")}</td>
					
						<td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "invertorySupplyType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invAvailSafetyFactorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
