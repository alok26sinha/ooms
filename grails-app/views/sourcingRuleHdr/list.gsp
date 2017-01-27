
<%@ page import="com.cimbidia.scm.oms.SourcingRuleHdr" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.addrule.label" default="Add Sourcing Rule" args="['sourcingRuleHdr']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        	<g:sortableColumn property="fulfillmentType" title="${warehouse.message(code: 'sourcingRuleHdr.fulfillmentType.label', default: 'Fulfillment Type')}" />
                            <g:sortableColumn property="product" title="${warehouse.message(code: 'sourcingRuleHdr.product.label', default: 'Product')}" />
                            <g:sortableColumn property="toLocation" title="${warehouse.message(code: 'sourcingRuleHdr.toLocation.label', default: 'To Location')}" />
                            <th><warehouse:message code="sourcingRuleHdr.customer.label" default="Customer" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sourcingRuleHdrInstanceList}" status="i" var="sourcingRuleHdrInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${sourcingRuleHdrInstance.id}">${fieldValue(bean: sourcingRuleHdrInstance, field: "fulfillmentType")}</g:link></td>
                        
                            <td>${fieldValue(bean: sourcingRuleHdrInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: sourcingRuleHdrInstance, field: "toLocation")}</td>
                        
                                                  
                            <td>${fieldValue(bean: sourcingRuleHdrInstance, field: "customer")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sourcingRuleHdrInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
