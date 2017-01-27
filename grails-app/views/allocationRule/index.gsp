
<%@ page import="com.cimbidia.scm.oms.AllocationRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allocationRule.label', default: 'AllocationRule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-allocationRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-allocationRule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="allocationRule.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="allocationRule.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'allocationRule.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="lastUpdatedDttm" title="${message(code: 'allocationRule.lastUpdatedDttm.label', default: 'Last Updated Dttm')}" />
					
						<g:sortableColumn property="applyFutureSafeteyFactor" title="${message(code: 'allocationRule.applyFutureSafeteyFactor.label', default: 'Apply Future Safetey Factor')}" />
					
						<g:sortableColumn property="applyOnHandSafetyFactor" title="${message(code: 'allocationRule.applyOnHandSafetyFactor.label', default: 'Apply On Hand Safety Factor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allocationRuleInstanceList}" status="i" var="allocationRuleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allocationRuleInstance.id}">${fieldValue(bean: allocationRuleInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: allocationRuleInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${allocationRuleInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${allocationRuleInstance.lastUpdatedDttm}" /></td>
					
						<td><g:formatBoolean boolean="${allocationRuleInstance.applyFutureSafeteyFactor}" /></td>
					
						<td><g:formatBoolean boolean="${allocationRuleInstance.applyOnHandSafetyFactor}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allocationRuleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
