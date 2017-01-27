
<%@ page import="com.cimbidia.scm.oms.SourcingRuleDtl" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['sourcingRuleDtl']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'sourcingRuleDtl.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="sourcingRuleDtl.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="sourcingRuleDtl.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'sourcingRuleDtl.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="lastUpdatedDttm" title="${warehouse.message(code: 'sourcingRuleDtl.lastUpdatedDttm.label', default: 'Last Updated Dttm')}" />
                        
                            <th><warehouse:message code="sourcingRuleDtl.fromLocation.label" default="From Location" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sourcingRuleDtlInstanceList}" status="i" var="sourcingRuleDtlInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${sourcingRuleDtlInstance.id}">${fieldValue(bean: sourcingRuleDtlInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sourcingRuleDtlInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: sourcingRuleDtlInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${sourcingRuleDtlInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${sourcingRuleDtlInstance.lastUpdatedDttm}" /></td>
                        
                            <td>${fieldValue(bean: sourcingRuleDtlInstance, field: "fromLocation")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sourcingRuleDtlInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
