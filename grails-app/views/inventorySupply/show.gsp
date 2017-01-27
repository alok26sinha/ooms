
<%@ page import="com.cimbidia.scm.oms.InventorySupply" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply')}" />
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
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventorySupplyInstance?.createdBy?.id}">${inventorySupplyInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventorySupplyInstance?.modifiedBy?.id}">${inventorySupplyInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.inventorySupplyType.label" default="Inventory Supply Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="inventorySupplyType" action="show" id="${inventorySupplyInstance?.inventorySupplyType?.id}">${inventorySupplyInstance?.inventorySupplyType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.itemLocation.label" default="Item Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="itemLocation" action="show" id="${inventorySupplyInstance?.itemLocation?.id}">${inventorySupplyInstance?.itemLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${inventorySupplyInstance?.company?.id}">${inventorySupplyInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.inventoryIdentifier.label" default="Inventory Identifier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="inventoryIdentifier" action="show" id="${inventorySupplyInstance?.inventoryIdentifier?.id}">${inventorySupplyInstance?.inventoryIdentifier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.supplyReferenceType.label" default="Supply Reference Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyInstance, field: "supplyReferenceType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupply.supplyReferences.label" default="Supply References" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyInstance, field: "supplyReferences")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${inventorySupplyInstance?.id}" />
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
