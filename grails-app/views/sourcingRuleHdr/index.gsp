
<%@ page import="com.cimbidia.scm.oms.SourcingRuleHdr" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sourcingRuleHdr" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sourcingRuleHdr" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="sourcingRuleHdr.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="sourcingRuleHdr.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'sourcingRuleHdr.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="lastUpdatedDttm" title="${message(code: 'sourcingRuleHdr.lastUpdatedDttm.label', default: 'Last Updated Dttm')}" />
					
						<th><g:message code="sourcingRuleHdr.buyer.label" default="Buyer" /></th>
					
						<th><g:message code="sourcingRuleHdr.category.label" default="Category" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sourcingRuleHdrInstanceList}" status="i" var="sourcingRuleHdrInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sourcingRuleHdrInstance.id}">${fieldValue(bean: sourcingRuleHdrInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: sourcingRuleHdrInstance, field: "modifiedBy")}</td>
					
						<td><g:formatDate date="${sourcingRuleHdrInstance.createdDttm}" /></td>
					
						<td><g:formatDate date="${sourcingRuleHdrInstance.lastUpdatedDttm}" /></td>
					
						<td>${fieldValue(bean: sourcingRuleHdrInstance, field: "buyer")}</td>
					
						<td>${fieldValue(bean: sourcingRuleHdrInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sourcingRuleHdrInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
