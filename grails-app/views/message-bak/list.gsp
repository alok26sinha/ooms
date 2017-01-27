
<%@ page import="com.cimbidia.scm.collab.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'message.label', default: 'Message')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
				<div>            	
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['message']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                           
                        
                            <g:sortableColumn property="sender" title="${warehouse.message(code: 'message.sender.label', default: 'Sender')}" />
                        	<g:sortableColumn property="receiver" title="${warehouse.message(code: 'message.receiver.label', default: 'Receiver')}" />
                                                   
                            <g:sortableColumn property="date" title="${warehouse.message(code: 'message.date.label', default: 'Date')}" />
                        
                            <g:sortableColumn property="message" title="${warehouse.message(code: 'message.message.label', default: 'Message')}" />
                        
                            <g:sortableColumn property="object" title="${warehouse.message(code: 'message.object.label', default: 'Object')}" />
                        	 <g:sortableColumn property="objectId" title="${warehouse.message(code: 'message.objectId.label', default: 'Object Id')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                        	<td>${fieldValue(bean: messageInstance, field: "sender")}</td>
                            <td>${fieldValue(bean: messageInstance, field: "receiver")}</td><%--
                        
                            <td>${fieldValue(bean: messageInstance, field: "context")}</td>
                        
                            --%><td><format:date obj="${messageInstance.date}" /></td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "message")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "object")}</td>
                            <td><g:link  controller="${messageInstance.object}" action="${messageInstance.context}" id="${messageInstance.objectId}">${fieldValue(bean: messageInstance, field: "objectId")}</g:link></td>
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
