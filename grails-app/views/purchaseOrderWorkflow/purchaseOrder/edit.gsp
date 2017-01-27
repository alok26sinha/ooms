
<%@ page import="com.cimbidia.wm.order.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'order.label', default: 'Order')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${orderInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${orderInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${orderInstance?.id}" />
	                <g:hiddenField name="version" value="${orderInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="status"><warehouse:message code="order.status.label" default="Status" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'status', 'errors')}">
	                                    <g:select name="status" from="${com.cimbidia.wm.order.OrderStatus?.values()}" value="${orderInstance?.status}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="order.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'description', 'errors')}">
	                                    <g:textArea name="description" cols="40" rows="5" value="${orderInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderNumber"><warehouse:message code="order.orderNumber.label" default="Order Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderNumber', 'errors')}">
	                                    <g:textArea name="orderNumber" cols="40" rows="5" value="${orderInstance?.orderNumber}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="origin"><warehouse:message code="order.origin.label" default="Origin" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'origin', 'errors')}">
	                                    <g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${orderInstance?.origin?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="destination"><warehouse:message code="order.destination.label" default="Destination" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'destination', 'errors')}">
	                                    <g:select name="destination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${orderInstance?.destination?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="recipient"><warehouse:message code="order.recipient.label" default="Recipient" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'recipient', 'errors')}">
	                                    <g:select name="recipient.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${orderInstance?.recipient?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderedBy"><warehouse:message code="order.orderedBy.label" default="Ordered By" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderedBy', 'errors')}">
	                                    <g:select name="orderedBy.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${orderInstance?.orderedBy?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="dateOrdered"><warehouse:message code="order.dateOrdered.label" default="Date Ordered" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'dateOrdered', 'errors')}">
	                                    <g:datePicker name="dateOrdered" precision="minute" value="${orderInstance?.dateOrdered}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="dateCreated"><warehouse:message code="order.dateCreated.label" default="Date Created" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'dateCreated', 'errors')}">
	                                    <g:datePicker name="dateCreated" precision="minute" value="${orderInstance?.dateCreated}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lastUpdated"><warehouse:message code="order.lastUpdated.label" default="Last Updated" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'lastUpdated', 'errors')}">
	                                    <g:datePicker name="lastUpdated" precision="minute" value="${orderInstance?.lastUpdated}" noSelection="['': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="shipmentType"><warehouse:message code="order.shipmentType.label" default="Shipment Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipmentType', 'errors')}">
	                                    <g:select name="shipmentType.id" from="${com.cimbidia.wm.shipment.ShipmentType.list()}" optionKey="id" value="${orderInstance?.shipmentType?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="comments"><warehouse:message code="order.comments.label" default="Comments" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'comments', 'errors')}">
	                                    <g:select name="comments" from="${com.cimbidia.wm.core.Comment.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.comments}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="documents"><warehouse:message code="order.documents.label" default="Documents" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'documents', 'errors')}">
	                                    <g:select name="documents" from="${com.cimbidia.wm.core.Document.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.documents}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="events"><warehouse:message code="order.events.label" default="Events" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'events', 'errors')}">
	                                    <g:select name="events" from="${com.cimbidia.wm.core.Event.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.events}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderDelivery"><warehouse:message code="order.orderDelivery.label" default="Order Delivery" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderDelivery', 'errors')}">
	                                    
<ul>
<g:each in="${orderInstance?.orderDelivery?}" var="o">
    <li><g:link controller="orderDelivery" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderDelivery" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderDelivery.label', default: 'OrderDelivery')])}</g:link>

	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderItems"><warehouse:message code="order.orderItems.label" default="Order Items" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItems', 'errors')}">
	                                    
<ul>
<g:each in="${orderInstance?.orderItems?}" var="o">
    <li><g:link controller="orderItem" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderItem" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderItem.label', default: 'OrderItem')])}</g:link>

	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderItemsRTS"><warehouse:message code="order.orderItemsRTS.label" default="Order Items RTS" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItemsRTS', 'errors')}">
	                                    
<ul>
<g:each in="${orderInstance?.orderItemsRTS?}" var="o">
    <li><g:link controller="orderItemRTS" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderItemRTS" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderItemRTS.label', default: 'OrderItemRTS')])}</g:link>

	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderItemList"><warehouse:message code="order.orderItemList.label" default="Order Item List" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItemList', 'errors')}">
	                                    
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
