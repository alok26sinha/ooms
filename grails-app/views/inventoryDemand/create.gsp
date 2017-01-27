
<%@ page import="com.cimbidia.scm.oms.InventoryDemand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryDemandInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryDemandInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="inventoryDemandType"><warehouse:message code="inventoryDemand.inventoryDemandType.label" default="Inventory Demand Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'inventoryDemandType', 'errors')}">
	                                    <g:select name="inventoryDemandType.id" from="${com.cimbidia.scm.oms.InventoryDemandType.list()}" optionKey="id" value="${inventoryDemandInstance?.inventoryDemandType?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="itemLocation"><warehouse:message code="inventoryDemand.itemLocation.label" default="Item Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'itemLocation', 'errors')}">
	                                    <g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryDemandInstance?.itemLocation?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="inventoryIdentifier"><warehouse:message code="inventoryDemand.inventoryIdentifier.label" default="Inventory Identifier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'inventoryIdentifier', 'errors')}">
	                                    <g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryDemandInstance?.inventoryIdentifier?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="company"><warehouse:message code="inventoryDemand.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryDemandInstance?.company?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="demandCancelDate"><warehouse:message code="inventoryDemand.demandCancelDate.label" default="Demand Cancel Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'demandCancelDate', 'errors')}">
	                                    <g:jqueryDatePicker name="demandCancelDate" precision="minute" value="${inventoryDemandInstance?.demandCancelDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="demandReferences"><warehouse:message code="inventoryDemand.demandReferences.label" default="Demand References" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'demandReferences', 'errors')}">
	                                    <g:textField name="demandReferences" value="${inventoryDemandInstance?.demandReferences}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="demandReferencesType"><warehouse:message code="inventoryDemand.demandReferencesType.label" default="Demand References Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'demandReferencesType', 'errors')}">
	                                    <g:textField name="demandReferencesType" value="${inventoryDemandInstance?.demandReferencesType}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="demandShipDate"><warehouse:message code="inventoryDemand.demandShipDate.label" default="Demand Ship Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'demandShipDate', 'errors')}">
	                                    <g:jqueryDatePicker name="demandShipDate" precision="minute" value="${inventoryDemandInstance?.demandShipDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="quantity"><warehouse:message code="inventoryDemand.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryDemandInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${fieldValue(bean: inventoryDemandInstance, field: 'quantity')}" />
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
