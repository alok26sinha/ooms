
<%@ page import="com.cimbidia.wm.core.Blog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'blog.label', default: 'Blog')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['blog']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'blog.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'blog.name.label', default: 'Name')}" />
                        
                            <th><warehouse:message code="blog.owner.label" default="Owner" /></th>
                   	    
                            <g:sortableColumn property="dateCreated" title="${warehouse.message(code: 'blog.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${warehouse.message(code: 'blog.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${blogInstanceList}" status="i" var="blogInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${blogInstance.id}">${fieldValue(bean: blogInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: blogInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: blogInstance, field: "owner")}</td>
                        
                            <td><format:date obj="${blogInstance.dateCreated}" /></td>
                        
                            <td><format:date obj="${blogInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${blogInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
