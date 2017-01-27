

<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['routingGuide']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                            <th><warehouse:message code="routingGuide.laneId.label" default="Lane ID" /></th>
                            <th><warehouse:message code="routingGuide.origin.label" default="Origin" /></th>
                   	    
                            <th><warehouse:message code="routingGuide.destination.label" default="Destination" /></th>
                   	    
                            <th><warehouse:message code="routingGuide.effectiveStartDate.label" default="Effective Start Date" /></th>
                            
                            <th><warehouse:message code="routingGuide.effectiveEndDate.label" default="Effective End Date" /></th>
                            
                      %{--      <g:sortableColumn property="carrierPriority" title="${warehouse.message(code: 'routingGuide.carrierPriority.label', default: 'Carrier Priority')}"/>
             
                            <th><warehouse:message code="routingGuide.commitmentFrequency.label" default="Commitment Frequency" /></th>
                              
                            <g:sortableColumn property="commitmentValue" title="${warehouse.message(code: 'routingGuide.commitmentValue.label', default: 'Commitment Value')}"/>
                   	    --}%
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${routingGuideInstanceList}" status="i" var="routingGuideInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${routingGuideInstance.id}">${fieldValue(bean: routingGuideInstance, field: "id")}</g:link></td>
                            
                            <td>${fieldValue(bean: routingGuideInstance, field: "origin")}</td>
                        
                            <td>${fieldValue(bean: routingGuideInstance, field: "destination")}</td>
                        
                            <td>${routingGuideInstance.effectiveStartDate}</td>
 
                           <td>${routingGuideInstance.effectiveEndDate}</td>
                           
                     %{--      <td>${fieldValue(bean: routingGuideInstance, field: "carrierPriority")}</td>
                           
                            <td>${fieldValue(bean: routingGuideInstance, field: "commitmentFrequency.name")}</td>
                           
                           <td>${fieldValue(bean: routingGuideInstance, field: "commitmentValue")}</td> --}%
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${routingGuideInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
