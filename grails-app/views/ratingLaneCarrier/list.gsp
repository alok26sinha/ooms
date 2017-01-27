
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneCarrier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['ratingLaneCarrier']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'ratingLaneCarrier.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="ratingLaneCarrier.carrier.label" default="Carrier" /></th>
                   	    
                            <th><warehouse:message code="ratingLaneCarrier.mot.label" default="Mot" /></th>
                   	    
                            <th><warehouse:message code="ratingLaneCarrier.equipment.label" default="Equipment" /></th>
                   	    
                            <th><warehouse:message code="ratingLaneCarrier.tempCtrl.label" default="Temp Ctrl" /></th>
                   	    
                            <th><warehouse:message code="ratingLaneCarrier.serviceLevel.label" default="Service Level" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingLaneCarrierInstanceList}" status="i" var="ratingLaneCarrierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ratingLaneCarrierInstance.id}">${fieldValue(bean: ratingLaneCarrierInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ratingLaneCarrierInstance, field: "carrier")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneCarrierInstance, field: "mot")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneCarrierInstance, field: "equipment")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneCarrierInstance, field: "tempCtrl")}</td>
                        
                            <td>${fieldValue(bean: ratingLaneCarrierInstance, field: "serviceLevel")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ratingLaneCarrierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
