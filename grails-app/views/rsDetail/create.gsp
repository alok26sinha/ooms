
<%@ page import="com.cimbidia.scm.rs.RsDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'rsDetail.label', default: 'RsDetail')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${rsDetailInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${rsDetailInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table style="borde:1;">
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="autoTender"><warehouse:message code="rsDetail.autoTender.label" default="Auto Tender" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: rsDetailInstance, field: 'autoTender', 'errors')}">
	                                    <g:checkBox name="autoTender" style="width:50px;" value="${rsDetailInstance?.autoTender}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="cycleType"><warehouse:message code="rsDetail.cycleType.label" default="Cycle Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: rsDetailInstance, field: 'cycleType', 'errors')}">
	                                    <g:select name="cycleType" style="width:140px;" from="${['core', 'selector']}" value="${rsDetailInstance?.cycleType}"  />
	                                
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="level"><warehouse:message code="rsDetail.level.label" default="Level" /></label>
	                                </td>
	                                <td valign="top" class="value style="width:50px;" ${hasErrors(bean: rsDetailInstance, field: 'level', 'errors')}">
	                                    <g:textField name="level" value="${fieldValue(bean: rsDetailInstance, field: 'level')}" />
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
