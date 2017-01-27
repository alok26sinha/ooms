
<%@ page import="com.cimbidia.scm.oms.AllocationRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationRule.label', default: 'AllocationRule')}" />
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
                            <td valign="top" class="name"><warehouse:message code="allocationRule.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationRuleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${allocationRuleInstance?.createdBy?.id}">${allocationRuleInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${allocationRuleInstance?.modifiedBy?.id}">${allocationRuleInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${allocationRuleInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.lastUpdatedDttm.label" default="Last Updated Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${allocationRuleInstance?.lastUpdatedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.applyFutureSafeteyFactor.label" default="Apply Future Safetey Factor" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.applyFutureSafeteyFactor}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.applyOnHandSafetyFactor.label" default="Apply On Hand Safety Factor" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.applyOnHandSafetyFactor}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.cancelOrderOnFail.label" default="Cancel Order On Fail" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.cancelOrderOnFail}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${allocationRuleInstance?.company?.id}">${allocationRuleInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.considerFutureInventory.label" default="Consider Future Inventory" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.considerFutureInventory}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationRuleInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.lineShipComplete.label" default="Line Ship Complete" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.lineShipComplete}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.lineShipSingleLocation.label" default="Line Ship Single Location" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.lineShipSingleLocation}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.optimizationType.label" default="Optimization Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationRuleInstance, field: "optimizationType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.shipComplete.label" default="Ship Complete" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.shipComplete}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.shipSingleLocation.label" default="Ship Single Location" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${allocationRuleInstance?.shipSingleLocation}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.weightToDistance.label" default="Weight To Distance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationRuleInstance, field: "weightToDistance")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="allocationRule.weightToLocation.label" default="Weight To Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: allocationRuleInstance, field: "weightToLocation")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${allocationRuleInstance?.id}" />
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
