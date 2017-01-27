
<%@ page import="com.cimbidia.scm.oms.InventoryFuture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryFuture.label', default: 'InventoryFuture')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryFutureInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryFutureInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventoryFutureInstance?.id}" />
	                <g:hiddenField name="version" value="${inventoryFutureInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                          
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="itemLocation"><warehouse:message code="inventoryFuture.itemLocation.label" default="Item Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'itemLocation', 'errors')}">
	                                    <g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryFutureInstance?.itemLocation?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryIdentifier"><warehouse:message code="inventoryFuture.inventoryIdentifier.label" default="Inventory Identifier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'inventoryIdentifier', 'errors')}">
	                                    <g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryFutureInstance?.inventoryIdentifier?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="company"><warehouse:message code="inventoryFuture.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryFutureInstance?.company?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="allocQty"><warehouse:message code="inventoryFuture.allocQty.label" default="Alloc Qty" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'allocQty', 'errors')}">
	                                    <g:textField name="allocQty" value="${fieldValue(bean: inventoryFutureInstance, field: 'allocQty')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="averageCost"><warehouse:message code="inventoryFuture.averageCost.label" default="Average Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'averageCost', 'errors')}">
	                                    <g:textField name="averageCost" value="${fieldValue(bean: inventoryFutureInstance, field: 'averageCost')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="costCurrency"><warehouse:message code="inventoryFuture.costCurrency.label" default="Cost Currency" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'costCurrency', 'errors')}">
	                                    <g:textField name="costCurrency" value="${inventoryFutureInstance?.costCurrency}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="endDate"><warehouse:message code="inventoryFuture.endDate.label" default="End Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'endDate', 'errors')}">
	                                    <g:jqueryDatePicker name="endDate" precision="minute" value="${inventoryFutureInstance?.endDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="objectDtlId"><warehouse:message code="inventoryFuture.objectDtlId.label" default="Object Dtl Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'objectDtlId', 'errors')}">
	                                    <g:textField name="objectDtlId" value="${inventoryFutureInstance?.objectDtlId}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="objectId"><warehouse:message code="inventoryFuture.objectId.label" default="Object Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'objectId', 'errors')}">
	                                    <g:textField name="objectId" value="${inventoryFutureInstance?.objectId}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="objectType"><warehouse:message code="inventoryFuture.objectType.label" default="Object Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'objectType', 'errors')}">
	                                    <g:textField name="objectType" value="${inventoryFutureInstance?.objectType}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="quantity"><warehouse:message code="inventoryFuture.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${fieldValue(bean: inventoryFutureInstance, field: 'quantity')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="startDate"><warehouse:message code="inventoryFuture.startDate.label" default="Start Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'startDate', 'errors')}">
	                                    <g:jqueryDatePicker name="startDate" precision="minute" value="${inventoryFutureInstance?.startDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="unitCost"><warehouse:message code="inventoryFuture.unitCost.label" default="Unit Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryFutureInstance, field: 'unitCost', 'errors')}">
	                                    <g:textField name="unitCost" value="${fieldValue(bean: inventoryFutureInstance, field: 'unitCost')}" />
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
