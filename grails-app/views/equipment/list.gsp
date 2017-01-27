
<%@ page import="com.cimbidia.wm.core.Equipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'equipment.label', default: 'Equipment')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['equipment']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'equipment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'equipment.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="code" title="${warehouse.message(code: 'equipment.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'equipment.description.label', default: 'Description')}" />
                        
                            <th><warehouse:message code="equipment.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="equipment.updatedBy.label" default="Updated By" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${equipmentInstanceList}" status="i" var="equipmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "updatedBy")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${equipmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
