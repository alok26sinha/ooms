
<%@ page import="com.cimbidia.wm.inventory.TransactionEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'transactionEntry.label', default: 'TransactionEntry')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${transactionEntryInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${transactionEntryInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${transactionEntryInstance?.id}" />
	                <g:hiddenField name="version" value="${transactionEntryInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="inventoryItem"><warehouse:message code="transactionEntry.inventoryItem.label" default="Inventory Item" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntryInstance, field: 'inventoryItem', 'errors')}">
	                                    <g:select name="inventoryItem.id" from="${com.cimbidia.wm.inventory.InventoryItem.list()}" optionKey="id" value="${transactionEntryInstance?.inventoryItem?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="quantity"><warehouse:message code="transactionEntry.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntryInstance, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${transactionEntryInstance?.quantity }" size="10" class="text"/>	                                    
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="comments"><warehouse:message code="transactionEntry.comments.label" default="Comments" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntryInstance, field: 'comments', 'errors')}">
	                                    <g:textArea name="comments" cols="40" rows="5" value="${transactionEntryInstance?.comments}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="transaction"><warehouse:message code="transactionEntry.transaction.label" default="Transaction" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntryInstance, field: 'transaction', 'errors')}">
	                                    <g:select name="transaction.id" from="${com.cimbidia.wm.inventory.Transaction.list()}" optionKey="id" value="${transactionEntryInstance?.transaction?.id}"  />
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
