
<%@ page import="com.cimbidia.wm.core.UnitOfMeasure" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'unitOfMeasure.label', default: 'UnitOfMeasure')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitOfMeasureInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${unitOfMeasureInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${unitOfMeasureInstance?.id}" />
	                <g:hiddenField name="version" value="${unitOfMeasureInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><warehouse:message code="unitOfMeasure.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'name', 'errors')}">
	                                    <g:textArea name="name" cols="40" rows="5" value="${unitOfMeasureInstance?.name}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="code"><warehouse:message code="unitOfMeasure.code.label" default="Code" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'code', 'errors')}">
	                                    <g:textArea name="code" cols="40" rows="5" value="${unitOfMeasureInstance?.code}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="unitOfMeasure.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'description', 'errors')}">
	                                    <g:textArea name="description" cols="40" rows="5" value="${unitOfMeasureInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="uomClass"><warehouse:message code="unitOfMeasure.uomClass.label" default="Uom Class" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'uomClass', 'errors')}">
	                                    <g:select name="uomClass.id" from="${com.cimbidia.wm.core.UnitOfMeasureClass.list()}" optionKey="id" value="${unitOfMeasureInstance?.uomClass?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                         <td valign="top" class="name">
	                                    <label for="inheritOnOrder"><warehouse:message code="unitOfMeasure.inheritOnOrder.label" default="Inherit on Order" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'inheritOnOrder', 'errors')}">
	                                   	<g:select name="inheritOnOrder" 
		           					   from="${com.cimbidia.wm.core.OrderSizes.list() }"
		           					   optionValue="${{format.metadata(obj:it)}}" value="${unitOfMeasureInstance?.inheritOnOrder}" 
		           					   noSelection="['':'none']"  />&nbsp;&nbsp;	
		           					   </td>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="createdBy"><warehouse:message code="unitOfMeasure.createdBy.label" default="Created By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'createdBy', 'errors')}">
	                                    <g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${unitOfMeasureInstance?.createdBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="updatedBy"><warehouse:message code="unitOfMeasure.updatedBy.label" default="Updated By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'updatedBy', 'errors')}">
	                                    <g:select name="updatedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${unitOfMeasureInstance?.updatedBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="dateCreated"><warehouse:message code="unitOfMeasure.dateCreated.label" default="Date Created" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'dateCreated', 'errors')}">
	                                    <g:datePicker name="dateCreated" precision="minute" value="${unitOfMeasureInstance?.dateCreated}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lastUpdated"><warehouse:message code="unitOfMeasure.lastUpdated.label" default="Last Updated" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: unitOfMeasureInstance, field: 'lastUpdated', 'errors')}">
	                                    <g:datePicker name="lastUpdated" precision="minute" value="${unitOfMeasureInstance?.lastUpdated}"  />
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
