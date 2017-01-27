

<%@ page import="com.cimbidia.wm.core.rg.RatingLane" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLane.label', default: 'RatingLane')}" />
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
                            <td valign="top" class="name"><warehouse:message code="ratingLane.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${ratingLaneInstance?.company?.id}">${ratingLaneInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.businessUnit.label" default="Business Unit" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${ratingLaneInstance?.businessUnit?.id}">${ratingLaneInstance?.businessUnit?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.origin.label" default="Origin" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${ratingLaneInstance?.origin?.id}">${ratingLaneInstance?.origin?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.originShipVia.label" default="Origin Ship Via" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${ratingLaneInstance?.originShipVia?.id}">${ratingLaneInstance?.originShipVia?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.destination.label" default="Destination" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${ratingLaneInstance?.destination?.id}">${ratingLaneInstance?.destination?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.destinationShipVia.label" default="Destination Ship Via" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${ratingLaneInstance?.destinationShipVia?.id}">${ratingLaneInstance?.destinationShipVia?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromCity.label" default="From City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromCounty.label" default="From County" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromCounty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromStateOrProvince.label" default="From State Or Province" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromStateOrProvince")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromPostalCode.label" default="From Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromPostalCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromCountry.label" default="From Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toCity.label" default="To City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toCounty.label" default="To County" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toCounty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toStateOrProvince.label" default="To State Or Province" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toStateOrProvince")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toPostalCode.label" default="To Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toPostalCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toCountry.label" default="To Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.effectiveStartDate.label" default="Effective Start Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${ratingLaneInstance?.effectiveStartDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.effectiveEndDate.label" default="Effective End Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${ratingLaneInstance?.effectiveEndDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.weightage.label" default="Weightage" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "weightage")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${ratingLaneInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${ratingLaneInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${ratingLaneInstance?.createdBy?.id}">${ratingLaneInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.updatedBy.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${ratingLaneInstance?.updatedBy?.id}">${ratingLaneInstance?.updatedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fromType.label" default="From Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fromType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.maxCommodity.label" default="Max Commodity" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneInstance?.maxCommodity?.id}">${ratingLaneInstance?.maxCommodity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.minCommodity.label" default="Min Commodity" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneInstance?.minCommodity?.id}">${ratingLaneInstance?.minCommodity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.ratingLaneCarrierList.label" default="Rating Lane Carrier List" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${ratingLaneInstance.ratingLaneCarrierList}" var="r">
                                    <li><g:link controller="ratingLaneCarrier" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.toType.label" default="To Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "toType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fullFromAddress.label" default="Full From Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fullFromAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLane.fullToAddress.label" default="Full To Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneInstance, field: "fullToAddress")}</td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${ratingLaneInstance?.id}" />
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
