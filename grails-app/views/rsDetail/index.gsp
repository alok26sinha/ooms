
<%@ page import="com.cimbidia.scm.rs.RsDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rsDetail.label', default: 'RsDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-rsDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-rsDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="autoTender" title="${message(code: 'rsDetail.autoTender.label', default: 'Auto Tender')}" />
					
						<g:sortableColumn property="cycleType" title="${message(code: 'rsDetail.cycleType.label', default: 'Cycle Type')}" />
					
						<g:sortableColumn property="level" title="${message(code: 'rsDetail.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="parentId" title="${message(code: 'rsDetail.parentId.label', default: 'Parent Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rsDetailInstanceList}" status="i" var="rsDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rsDetailInstance.id}">${fieldValue(bean: rsDetailInstance, field: "autoTender")}</g:link></td>
					
						<td>${fieldValue(bean: rsDetailInstance, field: "cycleType")}</td>
					
						<td>${fieldValue(bean: rsDetailInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: rsDetailInstance, field: "parentId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${rsDetailInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
