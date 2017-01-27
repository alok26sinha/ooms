
<%@ page import="com.cimbidia.scm.oms.InventorySupply" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventorySupplyInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventorySupplyInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventorySupplyInstance?.id}" />
	                <g:hiddenField name="version" value="${inventorySupplyInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventorySupplyType"><warehouse:message code="inventorySupply.inventorySupplyType.label" default="Inventory Supply Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'inventorySupplyType', 'errors')}">
	                                    <g:select name="inventorySupplyType.id" from="${com.cimbidia.scm.oms.InventorySupplyType.list()}" optionKey="id" value="${inventorySupplyInstance?.inventorySupplyType?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="itemLocation"><warehouse:message code="inventorySupply.itemLocation.label" default="Item Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'itemLocation', 'errors')}">
	                                    <g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventorySupplyInstance?.itemLocation?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="company"><warehouse:message code="inventorySupply.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventorySupplyInstance?.company?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="endDate"><warehouse:message code="inventorySupply.endDate.label" default="End Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'endDate', 'errors')}">
	                                    <g:jqueryDatePicker name="endDate" precision="minute" value="${inventorySupplyInstance?.endDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryIdentifier"><warehouse:message code="inventorySupply.inventoryIdentifier.label" default="Inventory Identifier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'inventoryIdentifier', 'errors')}">
	                                    <g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventorySupplyInstance?.inventoryIdentifier?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="quantity"><warehouse:message code="inventorySupply.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${fieldValue(bean: inventorySupplyInstance, field: 'quantity')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="startDate"><warehouse:message code="inventorySupply.startDate.label" default="Start Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'startDate', 'errors')}">
	                                    <g:jqueryDatePicker name="startDate" precision="minute" value="${inventorySupplyInstance?.startDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="supplyReferenceType"><warehouse:message code="inventorySupply.supplyReferenceType.label" default="Supply Reference Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'supplyReferenceType', 'errors')}">
	                                    <g:textField name="supplyReferenceType" value="${inventorySupplyInstance?.supplyReferenceType}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="supplyReferences"><warehouse:message code="inventorySupply.supplyReferences.label" default="Supply References" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventorySupplyInstance, field: 'supplyReferences', 'errors')}">
	                                    <g:textField name="supplyReferences" value="${inventorySupplyInstance?.supplyReferences}" />
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
