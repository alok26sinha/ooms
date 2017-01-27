
<%@ page import="com.cimbidia.scm.admin.Groups" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'groups.label', default: 'Groups')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['groups']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'groups.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'groups.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'groups.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groupsInstanceList}" status="i" var="groupsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${groupsInstance.id}">${fieldValue(bean: groupsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: groupsInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: groupsInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${groupsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
