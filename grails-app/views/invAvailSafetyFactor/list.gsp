
<%@ page import="com.cimbidia.scm.oms.InvAvailSafetyFactor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['invAvailSafetyFactor']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'invAvailSafetyFactor.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="invAvailSafetyFactor.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="invAvailSafetyFactor.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'invAvailSafetyFactor.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'invAvailSafetyFactor.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <th><warehouse:message code="invAvailSafetyFactor.company.label" default="Company" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invAvailSafetyFactorInstanceList}" status="i" var="invAvailSafetyFactorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${invAvailSafetyFactorInstance.id}">${fieldValue(bean: invAvailSafetyFactorInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${invAvailSafetyFactorInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${invAvailSafetyFactorInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: invAvailSafetyFactorInstance, field: "company")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invAvailSafetyFactorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
