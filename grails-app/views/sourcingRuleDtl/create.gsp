
<%@ page import="com.cimbidia.scm.oms.SourcingRuleDtl" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sourcingRuleDtlInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${sourcingRuleDtlInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="fromLocation"><warehouse:message code="sourcingRuleDtl.fromLocation.label" default="From Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'fromLocation', 'errors')}">
	                                    <g:select name="fromLocation.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.fromLocation?.id}"  />
	                                </td>
	                            </tr>
	                        
	                          
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="priority"><warehouse:message code="sourcingRuleDtl.priority.label" default="Priority" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'priority', 'errors')}">
	                                    <g:textField name="priority" value="${fieldValue(bean: sourcingRuleDtlInstance, field: 'priority')}" />
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
