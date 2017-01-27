
<%@ page import="com.cimbidia.wm.shipment.Shipper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipper.label', default: 'Shipper')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipperInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipperInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="name"><warehouse:message code="shipper.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'name', 'errors')}">
	                                    <g:textArea name="name" cols="40" rows="5" value="${shipperInstance?.name}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="description"><warehouse:message code="shipper.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'description', 'errors')}">
	                                    <g:textArea name="description" cols="40" rows="5" value="${shipperInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="trackingUrl"><warehouse:message code="shipper.trackingUrl.label" default="Tracking Url" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'trackingUrl', 'errors')}">
	                                    <g:textArea name="trackingUrl" cols="40" rows="5" value="${shipperInstance?.trackingUrl}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="trackingFormat"><warehouse:message code="shipper.trackingFormat.label" default="Tracking Format" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'trackingFormat', 'errors')}">
	                                    <g:textArea name="trackingFormat" cols="40" rows="5" value="${shipperInstance?.trackingFormat}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="parameterName"><warehouse:message code="shipper.parameterName.label" default="Parameter Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'parameterName', 'errors')}">
	                                    <g:textArea name="parameterName" cols="40" rows="5" value="${shipperInstance?.parameterName}" />
	                                </td>
	                            </tr>
	                        
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
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
