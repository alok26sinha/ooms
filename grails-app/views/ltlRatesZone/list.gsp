
<%@ page import="com.cimbidia.wm.core.rg.LtlRatesZone" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['ltlRatesZone']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'ltlRatesZone.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'ltlRatesZone.name.label', default: 'name')}" />
                        
                   	    
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'ltlRatesZone.description.label', default: 'Description')}" />
                        
                        	<g:sortableColumn property="carrier" title="${warehouse.message(code: 'ltlRatesZone.description.label', default: 'Carrier Company')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ltlRatesZoneInstanceList}" status="i" var="ltlRatesZoneInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ltlRatesZoneInstance.id}">${fieldValue(bean: ltlRatesZoneInstance, field: "id")}</g:link></td>
                      
                        
                            <td>${fieldValue(bean: ltlRatesZoneInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: ltlRatesZoneInstance, field: "description")}</td>
                        	
                        	 <td>${fieldValue(bean: ltlRatesZoneInstance, field: "carrier")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ltlRatesZoneInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
