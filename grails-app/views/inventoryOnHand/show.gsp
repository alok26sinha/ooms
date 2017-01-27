
<%@ page import="com.cimbidia.scm.oms.InventoryOnHand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryOnHand.label', default: 'InventoryOnHand')}" />
        <title><warehouse:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryOnHandInstance?.createdBy?.id}">${inventoryOnHandInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryOnHandInstance?.modifiedBy?.id}">${inventoryOnHandInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryOnHandInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryOnHandInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.itemLocation.label" default="Item Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="itemLocation" action="show" id="${inventoryOnHandInstance?.itemLocation?.id}">${inventoryOnHandInstance?.itemLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.inventoryIdentifier.label" default="Inventory Identifier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="inventoryIdentifier" action="show" id="${inventoryOnHandInstance?.inventoryIdentifier?.id}">${inventoryOnHandInstance?.inventoryIdentifier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${inventoryOnHandInstance?.company?.id}">${inventoryOnHandInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.allocQty.label" default="Alloc Qty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "allocQty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.averageCost.label" default="Average Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "averageCost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.costCurrency.label" default="Cost Currency" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "costCurrency")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryOnHandInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryOnHandInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryOnHand.unitCost.label" default="Unit Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryOnHandInstance, field: "unitCost")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${inventoryOnHandInstance?.id}" />
					                    <g:actionSubmit class="edit" action="edit" value="${warehouse.message(code: 'default.button.edit.label', default: 'Edit')}" />
					                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					                </g:form>
					            </div>
							</td>
						</tr>                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
