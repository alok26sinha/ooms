
<%@ page import="com.cimbidia.scm.oms.AllocationTemplate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['allocationTemplate']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'allocationTemplate.id.label', default: 'Id')}" />
                        
                              <th><warehouse:message code="allocationTemplate.createdBy.label" default="Created By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'allocationTemplate.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <th><warehouse:message code="allocationTemplate.customer.label" default="Customer" /></th>
                   	    
                            <g:sortableColumn property="dueDate" title="${warehouse.message(code: 'allocationTemplate.dueDate.label', default: 'Due Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${allocationTemplateInstanceList}" status="i" var="allocationTemplateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${allocationTemplateInstance.id}">${fieldValue(bean: allocationTemplateInstance, field: "id")}</g:link></td>
                        
                           
                            <td>${fieldValue(bean: allocationTemplateInstance, field: "createdBy")}</td>
                        
                            <td><format:date obj="${allocationTemplateInstance.createdDttm}" /></td>
                        
                            <td>${fieldValue(bean: allocationTemplateInstance, field: "customer")}</td>
                        
                            <td><format:date obj="${allocationTemplateInstance.dueDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${allocationTemplateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
