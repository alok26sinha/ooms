
<%@ page import="com.cimbidia.scm.oms.InventoryFuture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryFuture.label', default: 'InventoryFuture')}" />
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
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryFutureInstance?.createdBy?.id}">${inventoryFutureInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryFutureInstance?.modifiedBy?.id}">${inventoryFutureInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryFutureInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryFutureInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.itemLocation.label" default="Item Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="itemLocation" action="show" id="${inventoryFutureInstance?.itemLocation?.id}">${inventoryFutureInstance?.itemLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.inventoryIdentifier.label" default="Inventory Identifier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="inventoryIdentifier" action="show" id="${inventoryFutureInstance?.inventoryIdentifier?.id}">${inventoryFutureInstance?.inventoryIdentifier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${inventoryFutureInstance?.company?.id}">${inventoryFutureInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.allocQty.label" default="Alloc Qty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "allocQty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.averageCost.label" default="Average Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "averageCost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.costCurrency.label" default="Cost Currency" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "costCurrency")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryFutureInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.objectDtlId.label" default="Object Dtl Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "objectDtlId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.objectId.label" default="Object Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "objectId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.objectType.label" default="Object Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "objectType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryFutureInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryFuture.unitCost.label" default="Unit Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryFutureInstance, field: "unitCost")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${inventoryFutureInstance?.id}" />
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
