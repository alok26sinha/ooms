
<%@ page import="com.cimbidia.wm.core.UnitOfMeasure" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'unitOfMeasure.label', default: 'UnitOfMeasure')}" />
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
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: unitOfMeasureInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: unitOfMeasureInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: unitOfMeasureInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: unitOfMeasureInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.uomClass.label" default="Uom Class" /></td>
                            
                           <td valign="top" class="value">${fieldValue(bean: unitOfMeasureInstance, field: "inheritOnOrder")}</td>
                           
                        </tr>
                    
                    	 <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.inheritOnOrder.label" default="Inherit On Order" /></td>
                            
                            <td valign="top" class="value"><g:link controller="order" action="show" id="${unitOfMeasureInstance?.uomClass?.id}">${unitOfMeasureInstance?.uomClass?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${unitOfMeasureInstance?.createdBy?.id}">${unitOfMeasureInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.updatedBy.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${unitOfMeasureInstance?.updatedBy?.id}">${unitOfMeasureInstance?.updatedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${unitOfMeasureInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="unitOfMeasure.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${unitOfMeasureInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${unitOfMeasureInstance?.id}" />
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
