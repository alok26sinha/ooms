
<%@ page import="com.cimbidia.scm.asn.Asn" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'asn.label', default: 'Asn')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['asn']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'asn.asnNo.label', default: 'Asn No')}" />
                        
                            <g:sortableColumn property="carrierCompany" title="${warehouse.message(code: 'asn.carrierCompany.label', default: 'carrierCompany')}" />
                        
                            <g:sortableColumn property="businessUnit" title="${warehouse.message(code: 'asn.businessUnit.label', default: 'Business unit')}" />
                        
                            <g:sortableColumn property="price" title="${warehouse.message(code: 'asn.price.label', default: 'price')}" />
                        
                            <g:sortableColumn property="origin" title="${warehouse.message(code: 'asn.origin.label', default: 'Origin')}" />
                        
                            <g:sortableColumn property="shipDestination" title="${warehouse.message(code: 'asn.destination.label', default: 'Destination')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${asnInstanceList}" status="i" var="asnInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${asnInstance.id}">${fieldValue(bean: asnInstance, field: "asnNo")}</g:link></td>
                        
                            <td>${fieldValue(bean: asnInstance, field: "carrierCompany")}</td>
                        
                            <td>${fieldValue(bean: asnInstance, field: "businessUnit")}</td>
                        
                            <td>${fieldValue(bean: asnInstance, field: "price")}</td>
                        
                            <td>${fieldValue(bean: asnInstance, field: "origin")}</td>
                        
                            <td>${fieldValue(bean: asnInstance, field: "shipDestination")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${asnInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
