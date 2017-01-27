
<%@ page import="com.cimbidia.wm.core.EquipmentSize" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['equipmentSize']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'equipmentSize.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="equipmentSize.equipment.label" default="Equipment" /></th>
                   	    
                            <th><warehouse:message code="equipmentSize.uom.label" default="Uom" /></th>
                   	    
                            <g:sortableColumn property="value" title="${warehouse.message(code: 'equipmentSize.value.label', default: 'Value')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${equipmentSizeInstanceList}" status="i" var="equipmentSizeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${equipmentSizeInstance.id}">${fieldValue(bean: equipmentSizeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: equipmentSizeInstance, field: "equipment")}</td>
                        
                            <td>${fieldValue(bean: equipmentSizeInstance, field: "uom")}</td>
                        
                            <td>${fieldValue(bean: equipmentSizeInstance, field: "value")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${equipmentSizeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
