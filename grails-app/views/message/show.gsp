
<%@ page import="com.cimbidia.scm.collab.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-message" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list message">
			
				<g:if test="${messageInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="message.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${messageInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.object}">
				<li class="fieldcontain">
					<span id="object-label" class="property-label"><g:message code="message.object.label" default="Object" /></span>
					
						<span class="property-value" aria-labelledby="object-label"><g:fieldValue bean="${messageInstance}" field="object"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.context}">
				<li class="fieldcontain">
					<span id="context-label" class="property-label"><g:message code="message.context.label" default="Context" /></span>
					
						<span class="property-value" aria-labelledby="context-label"><g:fieldValue bean="${messageInstance}" field="context"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.objectId}">
				<li class="fieldcontain">
					<span id="objectId-label" class="property-label"><g:message code="message.objectId.label" default="Object Id" /></span>
					
						<span class="property-value" aria-labelledby="objectId-label"><g:fieldValue bean="${messageInstance}" field="objectId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.sender}">
				<li class="fieldcontain">
					<span id="sender-label" class="property-label"><g:message code="message.sender.label" default="Sender" /></span>
					
						<span class="property-value" aria-labelledby="sender-label"><g:link controller="user" action="show" id="${messageInstance?.sender?.id}">${messageInstance?.sender?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.companyId}">
				<li class="fieldcontain">
					<span id="companyId-label" class="property-label"><g:message code="message.companyId.label" default="Company Id" /></span>
					
						<span class="property-value" aria-labelledby="companyId-label"><g:fieldValue bean="${messageInstance}" field="companyId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="message.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${messageInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.receivers}">
				<li class="fieldcontain">
					<span id="receivers-label" class="property-label"><g:message code="message.receivers.label" default="Receivers" /></span>
					
						<g:each in="${messageInstance.receivers}" var="r">
						<span class="property-value" aria-labelledby="receivers-label"><g:link controller="user" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:messageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${messageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
