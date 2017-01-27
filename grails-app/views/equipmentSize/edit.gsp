
<%@ page import="com.cimbidia.wm.core.EquipmentSize" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipmentSizeInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${equipmentSizeInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${equipmentSizeInstance?.id}" />
	                <g:hiddenField name="version" value="${equipmentSizeInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="equipment"><warehouse:message code="equipmentSize.equipment.label" default="Equipment" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentSizeInstance, field: 'equipment', 'errors')}">
	                                    <g:select name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${equipmentSizeInstance?.equipment?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="uom"><warehouse:message code="equipmentSize.uom.label" default="Uom" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentSizeInstance, field: 'uom', 'errors')}">
	                                    <g:select name="uom.id" from="${com.cimbidia.wm.core.UnitOfMeasure.list()}" optionKey="id" value="${equipmentSizeInstance?.uom?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="value"><warehouse:message code="equipmentSize.value.label" default="Value" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentSizeInstance, field: 'value', 'errors')}">
	                                    <g:textField name="value" value="${fieldValue(bean: equipmentSizeInstance, field: 'value')}" />
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
