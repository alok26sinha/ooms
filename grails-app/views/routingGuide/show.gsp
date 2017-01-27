

<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide')}" />
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
                            <td valign="top" class="name"><warehouse:message code="routingGuide.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${routingGuideInstance?.company?.id}">${routingGuideInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.businessUnit.label" default="Business Unit" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${routingGuideInstance?.businessUnit?.id}">${routingGuideInstance?.businessUnit?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.origin.label" default="Origin" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${routingGuideInstance?.origin?.id}">${routingGuideInstance?.origin?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.destination.label" default="Destination" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${routingGuideInstance?.destination?.id}">${routingGuideInstance?.destination?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.fromAddress.label" default="From Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${routingGuideInstance?.fromAddress?.id}">${routingGuideInstance?.fromAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.toAddress.label" default="To Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${routingGuideInstance?.toAddress?.id}">${routingGuideInstance?.toAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.effectiveStartDate.label" default="Effective Start Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${routingGuideInstance?.effectiveStartDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.effectiveEndDate.label" default="Effective End Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${routingGuideInstance?.effectiveEndDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.mot.label" default="Mot" /></td>
                            
                            <td valign="top" class="value"><g:link controller="mot" action="show" id="${routingGuideInstance?.mot?.id}">${routingGuideInstance?.mot?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.equipment.label" default="Equipment" /></td>
                            
                            <td valign="top" class="value"><g:link controller="equipment" action="show" id="${routingGuideInstance?.equipment?.id}">${routingGuideInstance?.equipment?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.productClass.label" default="Product Class" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.productClass?.id}">${routingGuideInstance?.productClass?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.tempCtrl.label" default="Temp Ctrl" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.tempCtrl?.id}">${routingGuideInstance?.tempCtrl?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.billTo.label" default="Bill To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${routingGuideInstance?.billTo?.id}">${routingGuideInstance?.billTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.carrier.label" default="Carrier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${routingGuideInstance?.carrier?.id}">${routingGuideInstance?.carrier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.carrierPriority.label" default="Carrier Priority" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "carrierPriority")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.commitmentFrequency.label" default="Commitment Frequency" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.commitmentFrequency?.id}">${routingGuideInstance?.commitmentFrequency?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.commitmentValue.label" default="Commitment Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "commitmentValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.capacityFrequency.label" default="Capacity Frequency" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.capacityFrequency?.id}">${routingGuideInstance?.capacityFrequency?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.capacityValue.label" default="Capacity Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "capacityValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.surgeCapacityFrequency.label" default="Surge Capacity Frequency" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.surgeCapacityFrequency?.id}">${routingGuideInstance?.surgeCapacityFrequency?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.surgeCapacityValue.label" default="Surge Capacity Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "surgeCapacityValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${routingGuideInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${routingGuideInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${routingGuideInstance?.createdBy?.id}">${routingGuideInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.updatedBy.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${routingGuideInstance?.updatedBy?.id}">${routingGuideInstance?.updatedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.billingMethod.label" default="Billing Method" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.billingMethod?.id}">${routingGuideInstance?.billingMethod?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.rgStatus.label" default="Rg Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: routingGuideInstance, field: "rgStatus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="routingGuide.serviceLevel.label" default="Service Level" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${routingGuideInstance?.serviceLevel?.id}">${routingGuideInstance?.serviceLevel?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${routingGuideInstance?.id}" />
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
