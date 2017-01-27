
<%@ page import="com.cimbidia.wm.booking.BookingForecast" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast')}" />
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
                    
                      %{-- <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookingForecastInstance, field: "id")}</td>
                            
                        </tr> --}%
                        
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.shipFrom.label" default="Ship From" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${bookingForecastInstance?.shipFrom?.id}">${bookingForecastInstance?.shipFrom?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.shipTo.label" default="Ship To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${bookingForecastInstance?.shipTo?.id}">${bookingForecastInstance?.shipTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.originPort.label" default="Origin Port" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${bookingForecastInstance?.originPort?.id}">${bookingForecastInstance?.originPort?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.destinationPort.label" default="Destination Port" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${bookingForecastInstance?.destinationPort?.id}">${bookingForecastInstance?.destinationPort?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.region.label" default="Region" /></td>
                            
                            <td valign="top" class="value">${bookingForecastInstance?.region?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.forecastDate.label" default="Forecast Date" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${bookingForecastInstance?.forecastDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.productClass.label" default="Product Class" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${bookingForecastInstance?.productClass?.id}">${bookingForecastInstance?.productClass?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.equipmentType.label" default="Equipment Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="equipment" action="show" id="${bookingForecastInstance?.equipmentType?.id}">${bookingForecastInstance?.equipmentType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="bookingForecast.numberOfEquipments.label" default="Number Of Equipments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookingForecastInstance, field: "numberOfEquipments")}</td>
                            
                        </tr>
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${bookingForecastInstance?.id}" />
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
