
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneLtlRates" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['ratingLaneLtlRates']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'ratingLaneLtlRates.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="ltlClass" title="${warehouse.message(code: 'ratingLaneLtlRates.ltlClass.label', default: 'Ltl Class')}" />
                            
                            <g:sortableColumn property="rate" title="${warehouse.message(code: 'ratingLaneLtlRates.rate.label', default: 'Rate')}" />
                        
                            <th><warehouse:message code="ratingLaneLtlRates.ratingLaneCarrier.label" default="Rating Lane Carrier" /></th>
                            
                            
                            <g:sortableColumn property="fromZone" title="${warehouse.message(code: 'ratingLaneLtlRates.rate.label', default: 'Source Zone')}" />
                            
                            <g:sortableColumn property="toZone" title="${warehouse.message(code: 'ratingLaneLtlRates.rate.label', default: ' Destination Zone')}" />
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingLaneLtlRatesInstanceList}" status="i" var="ratingLaneLtlRatesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ratingLaneLtlRatesInstance.id}">${fieldValue(bean: ratingLaneLtlRatesInstance, field: "id")}</g:link></td>
                        
                        	<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "ltlClass")}</td>
                        	
                        	<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "rate")}</td>
                        	
                        	<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "ratingLaneCarrier")}</td>
                        	
                        	<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "fromZone")}</td>
                        	
                        	<td>${fieldValue(bean: ratingLaneLtlRatesInstance, field: "toZone")}</td>
                        	
                          
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ratingLaneLtlRatesInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
