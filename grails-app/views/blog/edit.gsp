
<%@ page import="com.cimbidia.wm.core.Blog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'blog.label', default: 'Blog')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${blogInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${blogInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${blogInstance?.id}" />
	                <g:hiddenField name="version" value="${blogInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><warehouse:message code="blog.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'name', 'errors')}">
	                                    <g:textArea name="name" cols="40" rows="5" value="${blogInstance?.name}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="owner"><warehouse:message code="blog.owner.label" default="Owner" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'owner', 'errors')}">
	                                    <g:select name="owner.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${blogInstance?.owner?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="followers"><warehouse:message code="blog.followers.label" default="Followers" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'followers', 'errors')}">
	                                    <g:select name="followers" from="${com.cimbidia.wm.core.User.list()}" multiple="yes" optionKey="id" size="5" value="${blogInstance?.followers}" />
	                                </td>
	                            </tr>
	                        
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
