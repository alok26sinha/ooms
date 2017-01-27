
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneLtlRates" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ratingLaneLtlRates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ratingLaneLtlRates" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'ratingLaneLtlRates.createdDttm.label', default: 'Created Dttm')}" />
					
						<g:sortableColumn property="modifiedDttm" title="${message(code: 'ratingLaneLtlRates.modifiedDttm.label', default: 'Modified Dttm')}" />
					
						<th><g:message code="ratingLaneLtlRates.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="ratingLaneLtlRates.modifiedBy.label" default="Modified By" /></th>
					
						<g:sortableColumn property="ltlClass" title="${message(code: 'ratingLaneLtlRates.ltlClass.label', default: 'Ltl Class')}" />
					
						<g:sortableColumn property="rate" title="${message(code: 'ratingLaneLtlRates.rate.label', default: 'Rate')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ratingLaneLtlRatesInstanceList}" status="i" var="ratingLaneLtlRatesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ratingLaneLtlRatesInstance.id}">${fieldValue(bean: ratingLaneLtlRatesInstance, field: "createdDttm")}</g:link></td>
					
						<td><g:formatDate date="${ratingLaneLtlRatesInstance.modifiedDttm}" /></td>
					
						<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "modifiedBy")}</td>
					
						<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "ltlClass")}</td>
					
						<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "rate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ratingLaneLtlRatesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
