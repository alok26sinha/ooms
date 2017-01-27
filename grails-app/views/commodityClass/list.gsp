
<%@ page import="com.cimbidia.wm.core.rg.CommodityClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'commodityClass.label', default: 'CommodityClass')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['commodityClass']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'commodityClass.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'commodityClass.modifiedDttm.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'commodityClass.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commodityClassInstanceList}" status="i" var="commodityClassInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${commodityClassInstance.id}">${fieldValue(bean: commodityClassInstance, field: "id")}</g:link></td>
                        
                            
                        
                            <td>${fieldValue(bean: commodityClassInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: commodityClassInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${commodityClassInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
