

<%@ page import="com.cimbidia.wm.core.rg.RatingLane" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLane.label', default: 'RatingLane')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['ratingLane']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'ratingLane.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="ratingLane.company.label" default="Company" /></th>
                   	    
                            <th><warehouse:message code="ratingLane.businessUnit.label" default="Business Unit" /></th>
                   	    
                            <g:sortableColumn property="status" title="${warehouse.message(code: 'ratingLane.status.label', default: 'Status')}" />
                        
                            <th><warehouse:message code="ratingLane.origin.label" default="Origin" /></th>
                   	    
                            <th><warehouse:message code="ratingLane.originShipVia.label" default="Origin Ship Via" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingLaneInstanceList}" status="i" var="ratingLaneInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ratingLaneInstance.id}">${fieldValue(bean: ratingLaneInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ratingLaneInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneInstance, field: "businessUnit")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneInstance, field: "origin")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneInstance, field: "originShipVia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ratingLaneInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
