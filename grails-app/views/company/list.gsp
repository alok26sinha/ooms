
<%@ page import="com.cimbidia.scm.admin.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'company.label', default: 'Company')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['company']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'company.id.label', default: 'Id')}" />
                        
                                                
                            <g:sortableColumn property="companyName" title="${warehouse.message(code: 'company.companyName.label', default: 'Company Name')}" />
                        
                            <g:sortableColumn property="contactAddress1" title="${warehouse.message(code: 'company.contactAddress1.label', default: 'Contact Address1')}" />
                        
                            <g:sortableColumn property="contactAddress2" title="${warehouse.message(code: 'company.contactAddress2.label', default: 'Contact Address2')}" />
                        
                            <g:sortableColumn property="contactCountry" title="${warehouse.message(code: 'company.contactCountry.label', default: 'Contact Country')}" />
                        	<g:sortableColumn property="contactCountry" title="${warehouse.message(code: 'company.parent.label', default: 'Parent Company')}" />
                        	<g:sortableColumn property="contactCountry" title="${warehouse.message(code: 'company.type.label', default: 'Company Type')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: companyInstance, field: "companyName")}</td>
                        
                           
                            <td>${fieldValue(bean: companyInstance, field: "contactAddress1")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "contactAddress2")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "contactCountry")}</td>
                             <td>${fieldValue(bean: companyInstance, field: "parentCompanyId")}</td>
                              <td>${fieldValue(bean: companyInstance, field: "type.name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${companyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
