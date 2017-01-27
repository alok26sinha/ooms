
<%@ page import="com.cimbidia.scm.shipment.ShipmentAccessorial" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentAccessorialInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipmentAccessorialInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${shipmentAccessorialInstance?.id}" />
	                <g:hiddenField name="version" value="${shipmentAccessorialInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="accessorial"><warehouse:message code="shipmentAccessorial.accessorial.label" default="Accessorial" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipmentAccessorialInstance, field: 'accessorial', 'errors')}">
	                                    <g:select name="accessorial.id" from="${com.cimbidia.wm.core.rg.Accessorial.list()}" optionKey="id" value="${shipmentAccessorialInstance?.accessorial?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="rate"><warehouse:message code="shipmentAccessorial.rate.label" default="Rate" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipmentAccessorialInstance, field: 'rate', 'errors')}">
	                                    <g:textField name="rate" value="${fieldValue(bean: shipmentAccessorialInstance, field: 'rate')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="shipment"><warehouse:message code="shipmentAccessorial.shipment.label" default="Shipment" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipmentAccessorialInstance, field: 'shipment', 'errors')}">
	                                    <g:select name="shipment.id" from="${com.cimbidia.wm.shipment.Shipment.list()}" optionKey="id" value="${shipmentAccessorialInstance?.shipment?.id}"  />
	                                </td>
	                            </tr>
	                        	                        
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
