
<%@ page import="com.cimbidia.scm.oms.ItemLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'itemLocation.label', default: 'ItemLocation')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['itemLocation']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'itemLocation.id.label', default: 'Id')}" />
                        	
                        	<th><warehouse:message code="itemLocation.company.label" default="Company" /></th>
                        	
                        	<th><warehouse:message code="itemLocation.location.label" default="Location" /></th>
                        	
                        	<th><warehouse:message code="itemLocation.product.label" default="Product" /></th>
                        	
                        	<th><warehouse:message code="itemLocation.safetyStock.label" default="Safety Stock" /></th>
                        	
                        	<th><warehouse:message code="itemLocation.isActive.label" default="Active" /></th>
                        	
                        	
                            <th><warehouse:message code="itemLocation.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="itemLocation.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'itemLocation.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'itemLocation.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${itemLocationInstanceList}" status="i" var="itemLocationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${itemLocationInstance.id}">${fieldValue(bean: itemLocationInstance, field: "id")}</g:link></td>
                        	
                        	 <td>${fieldValue(bean: itemLocationInstance, field: "company")}</td>
                        	 <td>${fieldValue(bean: itemLocationInstance, field: "location")}</td>
                        	 <td>${fieldValue(bean: itemLocationInstance, field: "product")}</td>
                        	 <td>${fieldValue(bean: itemLocationInstance, field: "safetyStock")}</td>
                        	 <td>${fieldValue(bean: itemLocationInstance, field: "isActive")}</td>
                            <td>${fieldValue(bean: itemLocationInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: itemLocationInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${itemLocationInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${itemLocationInstance.modifiedDttm}" /></td>
                        
                           
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${itemLocationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
