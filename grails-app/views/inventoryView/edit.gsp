
<%@ page import="com.cimbidia.scm.oms.InventoryView" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryView.label', default: 'InventoryView')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${inventoryViewInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${inventoryViewInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${inventoryViewInstance?.id}" />
	                <g:hiddenField name="version" value="${inventoryViewInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryDemandList"><warehouse:message code="inventoryView.inventoryDemandList.label" default="Inventory Demand List" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryViewInstance, field: 'inventoryDemandList', 'errors')}">
	                                    <g:select name="inventoryDemandList" from="${com.cimbidia.scm.oms.InventoryDemand.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventoryDemandList}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryOnHandList"><warehouse:message code="inventoryView.inventoryOnHandList.label" default="Inventory On Hand List" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryViewInstance, field: 'inventoryOnHandList', 'errors')}">
	                                    <g:select name="inventoryOnHandList" from="${com.cimbidia.scm.oms.InventoryOnHand.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventoryOnHandList}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventorySupplyList"><warehouse:message code="inventoryView.inventorySupplyList.label" default="Inventory Supply List" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: inventoryViewInstance, field: 'inventorySupplyList', 'errors')}">
	                                    <g:select name="inventorySupplyList" from="${com.cimbidia.scm.oms.InventorySupply.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventorySupplyList}" />
	                                </td>
	                            </tr>
	                        	                        
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						                </div>
		    						</td>                    	
	                        	</tr>	                        
	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
