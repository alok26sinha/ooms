
<%@ page import="com.cimbidia.scm.oms.FulfillmentType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.addFulfillmentType.label" args="['fulfillmentType']" default="Add Fulfillment Type"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="fulfillmentType" title="${warehouse.message(code: 'fulfillmentType.name.label', default: 'Fulfullment Type Name')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'fulfillmentType.description.label', default: 'Description')}" />
                        
                                  
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fulfillmentTypeInstanceList}" status="i" var="fulfillmentTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${fulfillmentTypeInstance.id}">${fieldValue(bean: fulfillmentTypeInstance, field: "fulfillmentType")}</g:link></td>
                        
                            <td>${fieldValue(bean: fulfillmentTypeInstance, field: "description")}</td>
                        
                           
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${fulfillmentTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
