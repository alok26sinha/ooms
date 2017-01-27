
<%@ page import="com.cimbidia.scm.oms.SourcingRuleDtl" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl')}" />
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
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleDtlInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${sourcingRuleDtlInstance?.createdBy?.id}">${sourcingRuleDtlInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${sourcingRuleDtlInstance?.modifiedBy?.id}">${sourcingRuleDtlInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${sourcingRuleDtlInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.lastUpdatedDttm.label" default="Last Updated Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${sourcingRuleDtlInstance?.lastUpdatedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.fromLocation.label" default="From Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${sourcingRuleDtlInstance?.fromLocation?.id}">${sourcingRuleDtlInstance?.fromLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.fulfillmentType.label" default="Fulfillment Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleDtlInstance, field: "fulfillmentType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.priority.label" default="Priority" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleDtlInstance, field: "priority")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleDtl.sourcingRuleHdr.label" default="Sourcing Rule Hdr" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleDtlInstance, field: "sourcingRuleHdr")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${sourcingRuleDtlInstance?.id}" />
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
