
<%@ page import="com.cimbidia.scm.oms.InventoryIdentifier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryIdentifierInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryIdentifierInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventoryIdentifierInstance?.id}" />
	                <g:hiddenField name="version" value="${inventoryIdentifierInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="batchNo"><warehouse:message code="inventoryIdentifier.batchNo.label" default="Batch No" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'batchNo', 'errors')}">
	                                    <g:textField name="batchNo" value="${inventoryIdentifierInstance?.batchNo}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="countryOfOrigin"><warehouse:message code="inventoryIdentifier.countryOfOrigin.label" default="Country Of Origin" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'countryOfOrigin', 'errors')}">
	                                    <g:textField name="countryOfOrigin" value="${inventoryIdentifierInstance?.countryOfOrigin}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="itemLocation"><warehouse:message code="inventoryIdentifier.itemLocation.label" default="Item Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'itemLocation', 'errors')}">
	                                    <g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryIdentifierInstance?.itemLocation?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotAttribute1"><warehouse:message code="inventoryIdentifier.lotAttribute1.label" default="Lot Attribute1" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute1', 'errors')}">
	                                    <g:textField name="lotAttribute1" value="${inventoryIdentifierInstance?.lotAttribute1}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotAttribute2"><warehouse:message code="inventoryIdentifier.lotAttribute2.label" default="Lot Attribute2" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute2', 'errors')}">
	                                    <g:textField name="lotAttribute2" value="${inventoryIdentifierInstance?.lotAttribute2}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotAttribute3"><warehouse:message code="inventoryIdentifier.lotAttribute3.label" default="Lot Attribute3" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute3', 'errors')}">
	                                    <g:textField name="lotAttribute3" value="${inventoryIdentifierInstance?.lotAttribute3}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotKeyReference"><warehouse:message code="inventoryIdentifier.lotKeyReference.label" default="Lot Key Reference" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotKeyReference', 'errors')}">
	                                    <g:textField name="lotKeyReference" value="${inventoryIdentifierInstance?.lotKeyReference}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotManufactureDate"><warehouse:message code="inventoryIdentifier.lotManufactureDate.label" default="Lot Manufacture Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotManufactureDate', 'errors')}">
	                                    <g:jqueryDatePicker name="lotManufactureDate" precision="minute" value="${inventoryIdentifierInstance?.lotManufactureDate}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lotNumber"><warehouse:message code="inventoryIdentifier.lotNumber.label" default="Lot Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotNumber', 'errors')}">
	                                    <g:textField name="lotNumber" value="${inventoryIdentifierInstance?.lotNumber}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="revisionNo"><warehouse:message code="inventoryIdentifier.revisionNo.label" default="Revision No" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'revisionNo', 'errors')}">
	                                    <g:textField name="revisionNo" value="${inventoryIdentifierInstance?.revisionNo}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="tagNumber"><warehouse:message code="inventoryIdentifier.tagNumber.label" default="Tag Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryIdentifierInstance, field: 'tagNumber', 'errors')}">
	                                    <g:textField name="tagNumber" value="${inventoryIdentifierInstance?.tagNumber}" />
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
