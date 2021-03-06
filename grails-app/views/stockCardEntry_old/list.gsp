
<%@ page import="com.cimbidia.wm.inventory.StockCardItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${warehouse.message(code: 'stockCardEntry.label', default: 'StockCardEntry')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><warehouse:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><warehouse:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'stockCardEntry.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="quantityOutgoing" title="${warehouse.message(code: 'stockCardEntry.quantityOutgoing.label', default: 'Quantity Outgoing')}" />
                        
                            <th><warehouse:message code="stockCardEntry.stockCard.label" default="Stock Card" /></th>
                   	    
                            <g:sortableColumn property="remainingBalance" title="${warehouse.message(code: 'stockCardEntry.remainingBalance.label', default: 'Remaining Balance')}" />
                        
                            <g:sortableColumn property="quantityIncoming" title="${warehouse.message(code: 'stockCardEntry.quantityIncoming.label', default: 'Quantity Incoming')}" />
                        
                            <g:sortableColumn property="startingBalance" title="${warehouse.message(code: 'stockCardEntry.startingBalance.label', default: 'Starting Balance')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stockCardEntryInstanceList}" status="i" var="stockCardEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stockCardEntryInstance.id}">${fieldValue(bean: stockCardEntryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: stockCardEntryInstance, field: "quantityOutgoing")}</td>
                        
                            <td>${fieldValue(bean: stockCardEntryInstance, field: "stockCard")}</td>
                        
                            <td>${fieldValue(bean: stockCardEntryInstance, field: "remainingBalance")}</td>
                        
                            <td>${fieldValue(bean: stockCardEntryInstance, field: "quantityIncoming")}</td>
                        
                            <td>${fieldValue(bean: stockCardEntryInstance, field: "startingBalance")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${stockCardEntryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
