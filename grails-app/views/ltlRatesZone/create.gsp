
<%@ page import="com.cimbidia.wm.core.rg.LtlRatesZone" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ltlRatesZoneInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${ltlRatesZoneInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="name"><warehouse:message code="ltlRatesZone.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ltlRatesZoneInstance, field: 'name', 'errors')}">
	                                    <g:textField name="name" value="${ltlRatesZoneInstance?.name}" />
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="description"><warehouse:message code="ltlRatesZone.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ltlRatesZoneInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${ltlRatesZoneInstance?.description}" />
	                                </td>
	                            </tr>
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="carrier"><warehouse:message code="ltlRatesZone.carrier.label" default="Carrier Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ltlRatesZoneInstance, field: 'description', 'carrier')}">
	                                    <g:textField name="carrier" value="${ltlRatesZoneInstance?.carrier}" />
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
