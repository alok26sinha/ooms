
<%@ page import="com.cimbidia.scm.collab.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'message.label', default: 'Message')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${messageInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="companyId"><warehouse:message code="message.companyId.label" default="Company Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'companyId', 'errors')}">
	                                    <g:textField name="companyId" value="${fieldValue(bean: session, field: 'companyId')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="context"><warehouse:message code="message.context.label" default="Context" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'context', 'errors')}">
	                                    <g:textField name="context" value="Purchase Order" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="date"><warehouse:message code="message.date.label" default="Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'date', 'errors')}">
	                                    <g:datePicker name="date" precision="minute" value="${new Date()}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="message"><warehouse:message code="message.message.label" default="Message" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'message', 'errors')}">
	                                    <g:textField name="message" value="${messageInstance?.message}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="object"><warehouse:message code="message.object.label" default="Object" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'object', 'errors')}">
	                                    <g:textField name="object" value="order" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="objectId"><warehouse:message code="message.objectId.label" default="Object Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'objectId', 'errors')}">
	                                    <g:textField name="objectId" value="${messageInstance?.objectId}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="receiver"><warehouse:message code="message.receiver.label" default="Receiver" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'receiver', 'errors')}">
	                                    <g:textField name="receiver" value="${messageInstance?.receiver}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="sender"><warehouse:message code="message.sender.label" default="Sender" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'sender', 'errors')}">
	                                    <g:textField name="sender" value="${messageInstance?.sender}" />
	                                </td>
	                            </tr>
	                        
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="send" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Send')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
						                </div>                        	
		                        	</td>
		                        </tr>
		                        
	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
