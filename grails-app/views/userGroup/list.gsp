
<%@ page import="com.cimbidia.scm.admin.UserGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'userGroup.label', default: 'UserGroup')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['userGroup']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'userGroup.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="userGroup.groups.label" default="Groups" /></th>
                   	    
                            <th><warehouse:message code="userGroup.user.label" default="User" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userGroupInstanceList}" status="i" var="userGroupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${userGroupInstance.id}">${fieldValue(bean: userGroupInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: userGroupInstance, field: "groups")}</td>
                        
                            <td>${fieldValue(bean: userGroupInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userGroupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
