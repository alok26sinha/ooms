
<%@ page import="com.cimbidia.scm.oms.InvAvailSafetyFactor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${invAvailSafetyFactorInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${invAvailSafetyFactorInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="company"><warehouse:message code="invAvailSafetyFactor.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.company?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="invertorySupplyType"><warehouse:message code="invAvailSafetyFactor.invertorySupplyType.label" default="Invertory Supply Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'invertorySupplyType', 'errors')}">
	                                    <g:select name="invertorySupplyType.id" from="${com.cimbidia.scm.oms.InventorySupplyType.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.invertorySupplyType?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="safetyFactor"><warehouse:message code="invAvailSafetyFactor.safetyFactor.label" default="Safety Factor" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'safetyFactor', 'errors')}">
	                                    <g:textField name="safetyFactor" value="${fieldValue(bean: invAvailSafetyFactorInstance, field: 'safetyFactor')}" />
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
