
<%@ page import="com.cimbidia.wm.core.UnitOfMeasure" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'unitOfMeasure.label', default: 'UnitOfMeasure')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['unitOfMeasure']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'unitOfMeasure.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'unitOfMeasure.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="code" title="${warehouse.message(code: 'unitOfMeasure.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'unitOfMeasure.description.label', default: 'Description')}" />
                        
                            <th><warehouse:message code="unitOfMeasure.uomClass.label" default="Uom Class" /></th>
                   	    
                   	    	<g:sortableColumn property="inheritOnOrder" title="${warehouse.message(code: 'unitOfMeasure.inheritOnOrder.label', default: 'inheritOnOrder')}" />
                   	    	
                            <th><warehouse:message code="unitOfMeasure.createdBy.label" default="Created By" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${unitOfMeasureInstanceList}" status="i" var="unitOfMeasureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${unitOfMeasureInstance.id}">${fieldValue(bean: unitOfMeasureInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: unitOfMeasureInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: unitOfMeasureInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: unitOfMeasureInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: unitOfMeasureInstance, field: "uomClass")}</td>
                            
                             <td>${fieldValue(bean: unitOfMeasureInstance, field: "inheritOnOrder")}</td>
                        
                            <td>${fieldValue(bean: unitOfMeasureInstance, field: "createdBy")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${unitOfMeasureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
