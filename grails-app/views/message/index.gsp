
<%@ page import="com.cimbidia.scm.collab.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-message" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="message" title="${message(code: 'message.message.label', default: 'Message')}" />
					
						<g:sortableColumn property="object" title="${message(code: 'message.object.label', default: 'Object')}" />
					
						<g:sortableColumn property="context" title="${message(code: 'message.context.label', default: 'Context')}" />
					
						<g:sortableColumn property="objectId" title="${message(code: 'message.objectId.label', default: 'Object Id')}" />
					
						<th><g:message code="message.sender.label" default="Sender" /></th>
					
						<g:sortableColumn property="companyId" title="${message(code: 'message.companyId.label', default: 'Company Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${messageInstanceList}" status="i" var="messageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "message")}</g:link></td>
					
						<td>${fieldValue(bean: messageInstance, field: "object")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "context")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "objectId")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "sender")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "companyId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${messageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
