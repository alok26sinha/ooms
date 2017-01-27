
<%@ page import="com.cimbidia.scm.asn.Asn" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'asn.label', default: 'Asn')}" />
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
                            <td valign="top" class="name"><warehouse:message code="asn.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.price.label" default="Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "price")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.masterBOL.label" default="Master BOL" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "masterBOL")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.trailerId.label" default="Trailer Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "trailerId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.tractorId.label" default="Tractor Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "tractorId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.sealNumber.label" default="Seal Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "sealNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.tempCtrl.label" default="Temp Ctrl" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "tempCtrl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.isPerish.label" default="Is Perish" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "isPerish")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.expectedShippingDate.label" default="Expected Shipping Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.expectedShippingDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.expectedDeliveryDate.label" default="Expected Delivery Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.expectedDeliveryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.equipment.label" default="Equipment" /></td>
                            
                            <td valign="top" class="value"><g:link controller="equipment" action="show" id="${asnInstance?.equipment?.id}">${asnInstance?.equipment?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.carrierPrice.label" default="Carrier Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "carrierPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.asnNo.label" default="Asn No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "asnNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.shipDestination.label" default="Ship Destination" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${asnInstance?.shipDestination?.id}">${asnInstance?.shipDestination?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.origin.label" default="Origin" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${asnInstance?.origin?.id}">${asnInstance?.origin?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.additionalInformation.label" default="Additional Information" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "additionalInformation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.carrierCompany.label" default="Carrier Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${asnInstance?.carrierCompany?.id}">${asnInstance?.carrierCompany?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.billTo.label" default="Bill To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${asnInstance?.billTo?.id}">${asnInstance?.billTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.businessUnit.label" default="Business Unit" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${asnInstance?.businessUnit?.id}">${asnInstance?.businessUnit?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.companyId.label" default="Company Id" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${asnInstance?.companyId?.id}">${asnInstance?.companyId?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.volume.label" default="Volume" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "volume")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.dimWeight.label" default="Dim Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "dimWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.pc.label" default="Pc" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${asnInstance?.pc?.id}">${asnInstance?.pc?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.deliveryEnd.label" default="Delivery End" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.deliveryEnd}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.deliveryStart.label" default="Delivery Start" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.deliveryStart}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.pickupEnd.label" default="Pickup End" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.pickupEnd}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.pickupStart.label" default="Pickup Start" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.pickupStart}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${asnInstance?.createdBy?.id}">${asnInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.fromAddress.label" default="From Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${asnInstance?.fromAddress?.id}">${asnInstance?.fromAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.incoTerm.label" default="Inco Term" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${asnInstance?.incoTerm?.id}">${asnInstance?.incoTerm?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${asnInstance?.modifiedBy?.id}">${asnInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.modifiedDttm.label" default="Modified Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${asnInstance?.modifiedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.mot.label" default="Mot" /></td>
                            
                            <td valign="top" class="value"><g:link controller="mot" action="show" id="${asnInstance?.mot?.id}">${asnInstance?.mot?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.priorityNumber.label" default="Priority Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "priorityNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.receipt.label" default="Receipt" /></td>
                            
                            <td valign="top" class="value"><g:link controller="receipt" action="show" id="${asnInstance?.receipt?.id}">${asnInstance?.receipt?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.shipStatus.label" default="Ship Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "shipStatus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.toAddress.label" default="To Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${asnInstance?.toAddress?.id}">${asnInstance?.toAddress?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.transResp.label" default="Trans Resp" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${asnInstance?.transResp?.id}">${asnInstance?.transResp?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.transportationOrders.label" default="Transportation Orders" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${asnInstance.transportationOrders}" var="t">
                                    <li><g:link controller="transportationOrder" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="asn.shipmentSizes.label" default="Shipment Sizes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: asnInstance, field: "shipmentSizes")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${asnInstance?.id}" />
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
