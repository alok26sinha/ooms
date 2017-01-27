
<%@ page import="com.cimbidia.scm.oms.Inventory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventory.label', default: 'Inventory')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryInstance}" as="list" />
	            </div>
            </g:hasErrors>
            
   		<div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Edit Inventory"/></label>

		</div>
            <g:form action="update" method="post" >
            <input type="hidden" name='id' value="${inventoryInstance?.id?.encodeAsHTML()}"/>
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                                                        
	                                                
	                        
	                            
	                        
	                           
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="product"><warehouse:message code="inventory.product.label" default="Product" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'product', 'errors')}">
	                                    <g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${inventoryInstance?.product?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="location"><warehouse:message code="inventory.location.label" default="Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'location', 'errors')}">
	                                    <g:select name="location.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${inventoryInstance?.location?.id}"  />
	                                </td>
	                            </tr>
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="inventoryStatus"><warehouse:message code="inventory.inventoryStatus.label" default="Inventory Status" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'inventoryStatus', 'errors')}">
	                                    <g:select name="inventoryStatus.id" from="${com.cimbidia.scm.oms.InventoryStatus.list()}" optionKey="id" value="${inventoryInstance?.inventoryStatus}"  />
	                                </td>
	                            </tr>
	                           
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="quantity"><warehouse:message code="inventory.totalquantity.label" default="Total Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${fieldValue(bean: inventoryInstance, field: 'quantity')}" />
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="quantity"><warehouse:message code="inventory.safetystock.label" default="Safety Stock" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'safetyStock', 'errors')}">
	                                    <g:textField name="safetyStock" value="${fieldValue(bean: inventoryInstance, field: 'safetyStock')}" />
	                                </td>
	                            </tr>
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="allocQty"><warehouse:message code="inventory.allocQty.label" default="Allocated Qty" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryInstance, field: 'allocQty', 'errors')}">
	                                    <g:textField name="allocQty" value="${fieldValue(bean: inventoryInstance, field: 'allocQty')}" />
	                                </td>
	                            </tr>
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="save" class="save" value="${warehouse.message(code: 'default.button.save.label', default: 'Save')}" />
						                   
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
