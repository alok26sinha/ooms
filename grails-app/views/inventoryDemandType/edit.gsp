
<%@ page import="com.cimbidia.scm.oms.InventoryDemandType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryDemandTypeInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryDemandTypeInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventoryDemandTypeInstance?.id}" />
	                <g:hiddenField name="version" value="${inventoryDemandTypeInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="allocatedDemand"><warehouse:message code="inventoryDemandType.allocatedDemand.label" default="Allocated Demand" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandTypeInstance, field: 'allocatedDemand', 'errors')}">
	                                    <g:checkBox name="allocatedDemand" value="${inventoryDemandTypeInstance?.allocatedDemand}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="committedDemand"><warehouse:message code="inventoryDemandType.committedDemand.label" default="Committed Demand" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandTypeInstance, field: 'committedDemand', 'errors')}">
	                                    <g:checkBox name="committedDemand" value="${inventoryDemandTypeInstance?.committedDemand}" />
	                                </td>
	                            </tr>
	                        
	                         
	                        
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="demandType"><warehouse:message code="inventoryDemandType.demandType.label" default="Demand Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandTypeInstance, field: 'demandType', 'errors')}">
	                                    <g:textField name="demandType" value="${inventoryDemandTypeInstance?.demandType}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="inventoryDemandType.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandTypeInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${inventoryDemandTypeInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                          
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="promisedDemand"><warehouse:message code="inventoryDemandType.promisedDemand.label" default="Promised Demand" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandTypeInstance, field: 'promisedDemand', 'errors')}">
	                                    <g:checkBox name="promisedDemand" value="${inventoryDemandTypeInstance?.promisedDemand}" />
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
