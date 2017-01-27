
<%@ page import="com.cimbidia.scm.collab.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'message.label', default: 'Message')}" />
        <title><warehouse:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.companyId.label" default="Company Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "companyId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.context.label" default="Context" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "context")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${messageInstance?.date}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.message.label" default="Message" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "message")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.object.label" default="Object" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "object")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.objectId.label" default="Object Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "objectId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.receiver.label" default="Receiver" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "receiver")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="message.sender.label" default="Sender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageInstance, field: "sender")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${messageInstance?.id}" />
					                    <g:actionSubmit class="edit" action="edit" value="${warehouse.message(code: 'default.button.edit.label', default: 'Edit')}" />
					                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					                </g:form>
					            </div>
							</td>
						</tr>                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
