
<%@ page import="com.cimbidia.wm.core.rg.CommodityClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'commodityClass.label', default: 'CommodityClass')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commodityClassInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${commodityClassInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${commodityClassInstance?.id}" />
	                <g:hiddenField name="version" value="${commodityClassInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                        	<tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><warehouse:message code="commodityClass.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: commodityClassInstance, field: 'name', 'errors')}">
	                                    <g:textField name="name" value="${commodityClassInstance?.name}" />
	                                </td>
	                            </tr>
	                            
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="commodityClass.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: commodityClassInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${commodityClassInstance?.description}" />
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
