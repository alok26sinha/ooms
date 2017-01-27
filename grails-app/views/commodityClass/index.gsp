
<%@ page import="com.cimbidia.wm.core.rg.CommodityClass" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commodityClass.label', default: 'CommodityClass')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-commodityClass" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-commodityClass" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdDttm" title="${message(code: 'commodityClass.createdDttm.label', default: 'Created Dttm')}" />
					
						
						<g:sortableColumn property="name" title="${message(code: 'commodityClass.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'commodityClass.description.label', default: 'Description')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commodityClassInstanceList}" status="i" var="commodityClassInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commodityClassInstance.id}">${fieldValue(bean: commodityClassInstance, field: "createdDttm")}</g:link></td>
					
						
						<td>${fieldValue(bean: commodityClassInstance, field: "name")}</td>
					
					
						<td>${fieldValue(bean: commodityClassInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commodityClassInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
