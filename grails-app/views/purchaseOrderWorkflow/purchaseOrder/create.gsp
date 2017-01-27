
<%@ page import="com.cimbidia.wm.order.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'order.label', default: 'Order')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
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
            <g:form action="save" method="post" >
            	<fieldset>
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
		      <label for="orderItems"><g:message code="order.orderItems.label" default="Order Items" /></label>
		   </td>
		   <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItems', 'errors')}">
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		       <g:render template="orderItems" model="['orderInstance':orderInstance]" />
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		   </td>
		</tr> 	
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
						                </div>                        	
		                        	</td>
		                        </tr>
		                        
	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
          <!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    <g:render template='orderItem' model="['orderItem':null,'i':'_clone','hidden':true]"/>
    <!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    </body>
</html>
