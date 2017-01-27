
<%@ page import="com.cimbidia.scm.oms.InventoryIdentifier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier')}" />
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
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryIdentifierInstance?.createdBy?.id}">${inventoryIdentifierInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${inventoryIdentifierInstance?.modifiedBy?.id}">${inventoryIdentifierInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryIdentifierInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryIdentifierInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.batchNo.label" default="Batch No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "batchNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.countryOfOrigin.label" default="Country Of Origin" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "countryOfOrigin")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.itemLocation.label" default="Item Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="itemLocation" action="show" id="${inventoryIdentifierInstance?.itemLocation?.id}">${inventoryIdentifierInstance?.itemLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotAttribute1.label" default="Lot Attribute1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "lotAttribute1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotAttribute2.label" default="Lot Attribute2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "lotAttribute2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotAttribute3.label" default="Lot Attribute3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "lotAttribute3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotKeyReference.label" default="Lot Key Reference" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "lotKeyReference")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotManufactureDate.label" default="Lot Manufacture Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${inventoryIdentifierInstance?.lotManufactureDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.lotNumber.label" default="Lot Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "lotNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.revisionNo.label" default="Revision No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "revisionNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="inventoryIdentifier.tagNumber.label" default="Tag Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: inventoryIdentifierInstance, field: "tagNumber")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${inventoryIdentifierInstance?.id}" />
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
