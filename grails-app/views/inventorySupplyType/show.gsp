
<%@ page import="com.cimbidia.scm.oms.InventorySupplyType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType')}" />
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
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyTypeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventorySupplyTypeInstance?.createdBy?.id}">${inventorySupplyTypeInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventorySupplyTypeInstance?.modifiedBy?.id}">${inventorySupplyTypeInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyTypeInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventorySupplyTypeInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyTypeInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.onhandSupply.label" default="Onhand Supply" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${inventorySupplyTypeInstance?.onhandSupply}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventorySupplyType.supplyType.label" default="Supply Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventorySupplyTypeInstance, field: "supplyType")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${inventorySupplyTypeInstance?.id}" />
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
