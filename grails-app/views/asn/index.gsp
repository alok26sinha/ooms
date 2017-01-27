
<%@ page import="com.cimbidia.scm.asn.Asn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asn.label', default: 'Asn')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asn" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="price" title="${message(code: 'asn.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="masterBOL" title="${message(code: 'asn.masterBOL.label', default: 'Master BOL')}" />
					
						<g:sortableColumn property="trailerId" title="${message(code: 'asn.trailerId.label', default: 'Trailer Id')}" />
					
						<g:sortableColumn property="tractorId" title="${message(code: 'asn.tractorId.label', default: 'Tractor Id')}" />
					
						<g:sortableColumn property="sealNumber" title="${message(code: 'asn.sealNumber.label', default: 'Seal Number')}" />
					
						<g:sortableColumn property="tempCtrl" title="${message(code: 'asn.tempCtrl.label', default: 'Temp Ctrl')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asnInstanceList}" status="i" var="asnInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asnInstance.id}">${fieldValue(bean: asnInstance, field: "price")}</g:link></td>
					
						<td>${fieldValue(bean: asnInstance, field: "masterBOL")}</td>
					
						<td>${fieldValue(bean: asnInstance, field: "trailerId")}</td>
					
						<td>${fieldValue(bean: asnInstance, field: "tractorId")}</td>
					
						<td>${fieldValue(bean: asnInstance, field: "sealNumber")}</td>
					
						<td>${fieldValue(bean: asnInstance, field: "tempCtrl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asnInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
