
<%@ page import="com.cimbidia.scm.oms.AllocationTemplate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate')}" />
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
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationTemplateInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${allocationTemplateInstance?.company?.id}">${allocationTemplateInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${allocationTemplateInstance?.createdBy?.id}">${allocationTemplateInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${allocationTemplateInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.customer.label" default="Customer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${allocationTemplateInstance?.customer?.id}">${allocationTemplateInstance?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.dueDate.label" default="Due Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${allocationTemplateInstance?.dueDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${allocationTemplateInstance?.modifiedBy?.id}">${allocationTemplateInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${allocationTemplateInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.orderNumber.label" default="Order Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationTemplateInstance, field: "orderNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.rule.label" default="Rule" /></td>
                            
                            <td valign="top" class="value"><g:link controller="allocationRule" action="show" id="${allocationTemplateInstance?.rule?.id}">${allocationTemplateInstance?.rule?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.shipTo.label" default="Ship To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${allocationTemplateInstance?.shipTo?.id}">${allocationTemplateInstance?.shipTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationTemplate.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${allocationTemplateInstance?.status?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${allocationTemplateInstance?.id}" />
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
