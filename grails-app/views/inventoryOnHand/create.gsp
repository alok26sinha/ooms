
<%@ page import="com.cimbidia.scm.oms.InventoryOnHand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryOnHand.label', default: 'InventoryOnHand')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryOnHandInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryOnHandInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="itemLocation"><warehouse:message code="inventoryOnHand.itemLocation.label" default="Item Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'itemLocation', 'errors')}">
	                                    <g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryOnHandInstance?.itemLocation?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="inventoryIdentifier"><warehouse:message code="inventoryOnHand.inventoryIdentifier.label" default="Inventory Identifier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'inventoryIdentifier', 'errors')}">
	                                    <g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryOnHandInstance?.inventoryIdentifier?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="company"><warehouse:message code="inventoryOnHand.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryOnHandInstance?.company?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="allocQty"><warehouse:message code="inventoryOnHand.allocQty.label" default="Alloc Qty" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'allocQty', 'errors')}">
	                                    <g:textField name="allocQty" value="${fieldValue(bean: inventoryOnHandInstance, field: 'allocQty')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="averageCost"><warehouse:message code="inventoryOnHand.averageCost.label" default="Average Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'averageCost', 'errors')}">
	                                    <g:textField name="averageCost" value="${fieldValue(bean: inventoryOnHandInstance, field: 'averageCost')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="costCurrency"><warehouse:message code="inventoryOnHand.costCurrency.label" default="Cost Currency" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'costCurrency', 'errors')}">
	                                    <g:textField name="costCurrency" value="${inventoryOnHandInstance?.costCurrency}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="endDate"><warehouse:message code="inventoryOnHand.endDate.label" default="End Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'endDate', 'errors')}">
	                                    <g:jqueryDatePicker name="endDate" precision="minute" value="${inventoryOnHandInstance?.endDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="quantity"><warehouse:message code="inventoryOnHand.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${fieldValue(bean: inventoryOnHandInstance, field: 'quantity')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="startDate"><warehouse:message code="inventoryOnHand.startDate.label" default="Start Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'startDate', 'errors')}">
	                                    <g:jqueryDatePicker name="startDate" precision="minute" value="${inventoryOnHandInstance?.startDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="unitCost"><warehouse:message code="inventoryOnHand.unitCost.label" default="Unit Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryOnHandInstance, field: 'unitCost', 'errors')}">
	                                    <g:textField name="unitCost" value="${fieldValue(bean: inventoryOnHandInstance, field: 'unitCost')}" />
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
