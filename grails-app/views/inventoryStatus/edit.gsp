
<%@ page import="com.cimbidia.scm.oms.InventoryStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryStatusInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryStatusInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventoryStatusInstance?.id}" />
	                <g:hiddenField name="version" value="${inventoryStatusInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="inventoryStatus.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryStatusInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${inventoryStatusInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryStatus"><warehouse:message code="inventoryStatus.inventoryStatus.label" default="Inventory Status" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryStatusInstance, field: 'inventoryStatus', 'errors')}">
	                                    <g:textField name="inventoryStatus" value="${inventoryStatusInstance?.inventoryStatus}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="supplyType"><warehouse:message code="inventoryStatus.supplyType.label" default="Supply Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryStatusInstance, field: 'supplyType', 'errors')}">
	                                    <g:textField name="supplyType" value="${inventoryStatusInstance?.supplyType}" />
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
