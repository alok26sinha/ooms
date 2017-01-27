
<%@ page import="com.cimbidia.scm.oms.InventorySupplyType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventorySupplyTypeInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventorySupplyTypeInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="description"><warehouse:message code="inventorySupplyType.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyTypeInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${inventorySupplyTypeInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="onhandSupply"><warehouse:message code="inventorySupplyType.onhandSupply.label" default="Onhand Supply" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyTypeInstance, field: 'onhandSupply', 'errors')}">
	                                    <g:checkBox name="onhandSupply" value="${inventorySupplyTypeInstance?.onhandSupply}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="supplyType"><warehouse:message code="inventorySupplyType.supplyType.label" default="Supply Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyTypeInstance, field: 'supplyType', 'errors')}">
	                                    <g:textField name="supplyType" value="${inventorySupplyTypeInstance?.supplyType}" />
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
