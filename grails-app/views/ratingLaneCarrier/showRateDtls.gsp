

<%@ page import="com.cimbidia.wm.core.rg.RatingLaneCarrier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')}" />
        <title><warehouse:message code="default.costDtls.label" args="[entityName]" default="Cost Details"/></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
		<link rel="stylesheet" href="/cimbidiaSCM/css/cimbidia.css" type="text/css" media="all">
		<link rel="stylesheet" href="/cimbidiaSCM/css/style.css" type="text/css" media="all">
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                	<thead>
                		<th>
                			<warehouse:message code="ratingLaneCarrier.typeOfCharge.label" default="Type Of Rate" />
                		</th>
                		<th>
                			<warehouse:message code="ratingLaneCarrier.rateType.label" default="Rate Type" />
                		</th>
                		<th>
                			<warehouse:message code="ratingLaneCarrier.rateUnit.label" default="Rate Unit" />
                		</th>
                		<th>
                			<warehouse:message code="ratingLaneCarrier.rate.label" default="Rate" />
                		</th>
                		%{--<th>
                			<warehouse:message code="ratingLaneCarrier.calculatedCost.label" default="Calculated Cost" />
                		</th>--}%
                	</thead>
                    <tbody>
                    
                        <tr class="prop">
                        	<td><warehouse:message code="ratingLaneCarrier.carrierLane.label" default="Lane Rate" /></td>
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneCarrierInstance?.rateType?.id}">${ratingLaneCarrierInstance?.rateType?.description?.encodeAsHTML()}</g:link></td>
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneCarrierInstance?.rateUnit?.id}">${ratingLaneCarrierInstance?.rateUnit?.description}</g:link></td>
                   			<td valign="top" class="value">${fieldValue(bean: ratingLaneCarrierInstance, field: "rate")}</td>
                   			%{--<td valign="top" class="value">${fieldValue(bean: ratingLaneCarrierInstance, field: "cost")}</td>--}%
                        </tr>
                        <g:if test="${ratingLaneCarrierInstance?.ratingLaneAccessorialList?.size() > 0}">	          					
		                    <g:each var="ratingLaneAccessorial" in="${ratingLaneCarrierInstance?.ratingLaneAccessorialList}" status="status">
			               		<tr>
			               			<td valign="top" class="value">${ratingLaneAccessorial.accessorial?.description}</td>
			                        <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneAccessorial.accessorial?.accessorialType?.id}">${ratingLaneAccessorial.accessorial?.accessorialType?.description.encodeAsHTML()}</g:link></td>
			                        <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneAccessorial.accessorial?.uom?.id}">${ratingLaneAccessorial.accessorial?.uom?.description.encodeAsHTML()}</g:link></td>
			               			<td valign="top" class="value">${fieldValue(bean: ratingLaneAccessorial, field: "rate")}</td>
			               			%{--<td valign="top" class="value">${ratingLaneAccessorial.cost}</td>--}%
								</tr>
						 	</g:each>
						</g:if>
                   		<div>
                   			<tr>
                   				<td colspan="4" id="horizontalLine"/>
                   			</tr>
                   		</div>
                        <tr class="prop">
                            <td colspan="3" valign="top" class="name"><warehouse:message code="ratingLaneCarrier.totalCost.label" default="Total Cost" /></td>
                            <td valign="top" class="value">${totalCost}</td>
                        </tr>
                        <div>
                   			<tr>
                   				<td colspan="4" id="horizontalLine"/>
                   			</tr>
                   		</div>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${ratingLaneCarrierInstance?.id}" />
					                    <g:actionSubmit class="close" action="close" value="${warehouse.message(code: 'default.button.close.label', default: 'Close')}" />
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
