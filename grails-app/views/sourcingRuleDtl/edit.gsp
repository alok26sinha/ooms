
<%@ page import="com.cimbidia.scm.oms.SourcingRuleDtl" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
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
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${sourcingRuleDtlInstance?.id}" />
	                <g:hiddenField name="version" value="${sourcingRuleDtlInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="createdBy"><warehouse:message code="sourcingRuleDtl.createdBy.label" default="Created By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'createdBy', 'errors')}">
	                                    <g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.createdBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="modifiedBy"><warehouse:message code="sourcingRuleDtl.modifiedBy.label" default="Modified By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'modifiedBy', 'errors')}">
	                                    <g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.modifiedBy?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="createdDttm"><warehouse:message code="sourcingRuleDtl.createdDttm.label" default="Created Dttm" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'createdDttm', 'errors')}">
	                                    <g:jqueryDatePicker name="createdDttm" precision="minute" value="${sourcingRuleDtlInstance?.createdDttm}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lastUpdatedDttm"><warehouse:message code="sourcingRuleDtl.lastUpdatedDttm.label" default="Last Updated Dttm" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'lastUpdatedDttm', 'errors')}">
	                                    <g:jqueryDatePicker name="lastUpdatedDttm" precision="minute" value="${sourcingRuleDtlInstance?.lastUpdatedDttm}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
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
	                                  <label for="fulfillmentType"><warehouse:message code="sourcingRuleDtl.fulfillmentType.label" default="Fulfillment Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'fulfillmentType', 'errors')}">
	                                    <g:textField name="fulfillmentType" value="${sourcingRuleDtlInstance?.fulfillmentType}" />
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
	                                <td valign="top" class="name">
	                                  <label for="sourcingRuleHdr"><warehouse:message code="sourcingRuleDtl.sourcingRuleHdr.label" default="Sourcing Rule Hdr" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleDtlInstance, field: 'sourcingRuleHdr', 'errors')}">
	                                    <g:textField name="sourcingRuleHdr" value="${sourcingRuleDtlInstance?.sourcingRuleHdr}" />
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
