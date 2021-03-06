
<%@ page import="com.cimbidia.scm.admin.UserGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'userGroup.label', default: 'UserGroup')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userGroupInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${userGroupInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="groups"><warehouse:message code="userGroup.groups.label" default="Groups" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: userGroupInstance, field: 'groups', 'errors')}">
	                                    <g:select name="groups.id" from="${com.cimbidia.scm.admin.Groups.list()}" optionKey="id" value="${userGroupInstance?.groups?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="user"><warehouse:message code="userGroup.user.label" default="User" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: userGroupInstance, field: 'user', 'errors')}">
	                                    <g:select name="user.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${userGroupInstance?.user?.id}"  />
	                                </td>
	                            </tr>
	                        
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
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
