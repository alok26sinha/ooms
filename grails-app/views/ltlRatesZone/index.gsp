
<%@ page import="com.cimbidia.wm.core.rg.LtlRatesZone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ltlRatesZone.label', default: 'LtlRatesZone')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ltlRatesZone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ltlRatesZone" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'ltlRatesZone.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="descrption" title="${message(code: 'ltlRatesZone.descrption.label', default: 'Descrption')}" />
					
						
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ltlRatesZoneInstanceList}" status="i" var="ltlRatesZoneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ltlRatesZoneInstance.id}">${fieldValue(bean: ltlRatesZoneInstance, field: "createdDttm")}</g:link></td>
					
						<td>${fieldValue(bean: ltlRatesZoneInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: ltlRatesZoneInstance, field: "description")}</td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ltlRatesZoneInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
