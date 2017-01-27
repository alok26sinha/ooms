
<%@ page import="com.cimbidia.scm.oms.AllocationRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationRule.label', default: 'AllocationRule')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
				<div>            	
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><warehouse:message code="default.adds.label" defargs="['allocationRule']"  default="Add Allocation Rule"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'allocationRule.description.label', default: 'Description')}" />
                        
                            
                            <g:sortableColumn property="considerFutureInventory" title="${warehouse.message(code: 'allocationRule.optimizationType.label', default: 'Future Inventory')}" />
                        	<g:sortableColumn property="optimizationType" title="${warehouse.message(code: 'allocationRule.optimizationType.label', default: 'Optimization Type')}" />
                        
                            <g:sortableColumn property="cancelOrderOnFail" title="${warehouse.message(code: 'allocationRule.cancelOrderOnFail.label', default: 'Cancel Order On Fail')}" />
                        
                            <g:sortableColumn property="applyOnHandSafetyFactor" title="${warehouse.message(code: 'allocationRule.applyOnHandSafetyFactor.label', default: 'Apply OH Safetey Factor')}" />
                        	<g:sortableColumn property="applyFutureSafetyFactor" title="${warehouse.message(code: 'allocationRule.applyFutureSafetyFactor.label', default: 'Apply Future Safetey Factor')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${allocationRuleInstanceList}" status="i" var="allocationRuleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${allocationRuleInstance.id}">${fieldValue(bean: allocationRuleInstance, field: "description")}</g:link></td>
                        	
                        	<td>${fieldValue(bean: allocationRuleInstance, field: "considerFutureInventory")}</td>
                            <td>${fieldValue(bean: allocationRuleInstance, field: "optimizationType")}</td>
                        
                            <td>${fieldValue(bean: allocationRuleInstance, field: "cancelOrderOnFail")}</td>
                                                                           
                            <td><g:formatBoolean boolean="${allocationRuleInstance.applyOnHandSafetyFactor}" /></td>
                            <td><g:formatBoolean boolean="${allocationRuleInstance.applyFutureSafetyFactor}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${allocationRuleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
