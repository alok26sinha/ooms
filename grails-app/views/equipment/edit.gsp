
<%@ page import="com.cimbidia.wm.core.Equipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'equipment.label', default: 'Equipment')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipmentInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${equipmentInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${equipmentInstance?.id}" />
	                <g:hiddenField name="version" value="${equipmentInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><warehouse:message code="equipment.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'name', 'errors')}">
	                                    <g:textArea name="name" cols="40" rows="5" value="${equipmentInstance?.name}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="code"><warehouse:message code="equipment.code.label" default="Code" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'code', 'errors')}">
	                                    <g:textArea name="code" cols="40" rows="5" value="${equipmentInstance?.code}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="equipment.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'description', 'errors')}">
	                                    <g:textArea name="description" cols="40" rows="5" value="${equipmentInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="createdBy"><warehouse:message code="equipment.createdBy.label" default="Created By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'createdBy', 'errors')}">
	                                    <g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${equipmentInstance?.createdBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="updatedBy"><warehouse:message code="equipment.updatedBy.label" default="Updated By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'updatedBy', 'errors')}">
	                                    <g:select name="updatedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${equipmentInstance?.updatedBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="dateCreated"><warehouse:message code="equipment.dateCreated.label" default="Date Created" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'dateCreated', 'errors')}">
	                                    <g:datePicker name="dateCreated" precision="minute" value="${equipmentInstance?.dateCreated}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lastUpdated"><warehouse:message code="equipment.lastUpdated.label" default="Last Updated" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'lastUpdated', 'errors')}">
	                                    <g:datePicker name="lastUpdated" precision="minute" value="${equipmentInstance?.lastUpdated}"  />
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
