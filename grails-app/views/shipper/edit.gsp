
<%@ page import="com.cimbidia.wm.shipment.Shipper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipper.label', default: 'Shipper')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
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
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${shipperInstance?.id}" />
	                <g:hiddenField name="version" value="${shipperInstance?.version}" />
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
	                                <td valign="top" class="name">
	                                  <label for="users"><warehouse:message code="shipper.users.label" default="Users" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'users', 'errors')}">
	                                    
<ul>
<g:each in="${shipperInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="user" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'user.label', default: 'User')])}</g:link>

	                                </td>
	                            </tr>
	                        
	                      %{--      <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="carrierMots"><warehouse:message code="shipper.carrierMots.label" default="Carrier Mots" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'carrierMots', 'errors')}">
	                                    
<ul>
<g:each in="${shipperInstance?.carrierMots?}" var="c">
    <li><g:link controller="carrierMot" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="carrierMot" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'carrierMot.label', default: 'CarrierMot')])}</g:link>

	                                </td>
	                            </tr> --}%
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="shipperServices"><warehouse:message code="shipper.shipperServices.label" default="Shipper Services" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: shipperInstance, field: 'shipperServices', 'errors')}">
	                                    
<ul>
<g:each in="${shipperInstance?.shipperServices?}" var="s">
    <li><g:link controller="shipperService" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="shipperService" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'shipperService.label', default: 'ShipperService')])}</g:link>

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
