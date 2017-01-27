<%@ page import="com.cimbidia.wm.order.Order" %>



<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="order.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${com.cimbidia.wm.order.OrderStatus?.values()}" value="${orderInstance?.status}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="order.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" value="${orderInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderNumber', 'error')} ">
	<label for="orderNumber">
		<g:message code="order.orderNumber.label" default="Order Number" />
		
	</label>
	<g:textArea name="orderNumber" cols="40" rows="5" value="${orderInstance?.orderNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="order.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${orderInstance?.origin?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'destination', 'error')} required">
	<label for="destination">
		<g:message code="order.destination.label" default="Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="destination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${orderInstance?.destination?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'recipient', 'error')} ">
	<label for="recipient">
		<g:message code="order.recipient.label" default="Recipient" />
		
	</label>
	<g:select name="recipient.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${orderInstance?.recipient?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderedBy', 'error')} required">
	<label for="orderedBy">
		<g:message code="order.orderedBy.label" default="Ordered By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="orderedBy.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${orderInstance?.orderedBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'dateOrdered', 'error')} ">
	<label for="dateOrdered">
		<g:message code="order.dateOrdered.label" default="Date Ordered" />
		
	</label>
	<g:datePicker name="dateOrdered" precision="minute" value="${orderInstance?.dateOrdered}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'shipmentType', 'error')} ">
	<label for="shipmentType">
		<g:message code="order.shipmentType.label" default="Shipment Type" />
		
	</label>
	<g:select name="shipmentType.id" from="${com.cimbidia.wm.shipment.ShipmentType.list()}" optionKey="id" value="${orderInstance?.shipmentType?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="order.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${com.cimbidia.wm.core.Comment.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.comments}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="order.documents.label" default="Documents" />
		
	</label>
	<g:select name="documents" from="${com.cimbidia.wm.core.Document.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.documents}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="order.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${com.cimbidia.wm.core.Event.list()}" multiple="yes" optionKey="id" size="5" value="${orderInstance?.events}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderDelivery', 'error')} ">
	<label for="orderDelivery">
		<g:message code="order.orderDelivery.label" default="Order Delivery" />
		
	</label>
	
<ul>
<g:each in="${orderInstance?.orderDelivery?}" var="o">
    <li><g:link controller="orderDelivery" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderDelivery" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderDelivery.label', default: 'OrderDelivery')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderItems', 'error')} ">
	<label for="orderItems">
		<g:message code="order.orderItems.label" default="Order Items" />
		
	</label>
	
<ul>
<g:each in="${orderInstance?.orderItems?}" var="o">
    <li><g:link controller="orderItem" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderItem" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderItem.label', default: 'OrderItem')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderItemsRTS', 'error')} ">
	<label for="orderItemsRTS">
		<g:message code="order.orderItemsRTS.label" default="Order Items RTS" />
		
	</label>
	
<ul>
<g:each in="${orderInstance?.orderItemsRTS?}" var="o">
    <li><g:link controller="orderItemRTS" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderItemRTS" action="create" params="['order.id': orderInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderItemRTS.label', default: 'OrderItemRTS')])}</g:link>

</div>
<div class="dialog">
  <table>
      <tbody>

		<tr class="prop">
		   <td valign="top" class="name">
		      <label for="orderItems"><g:message code="contact.orderItems.label" default="OrderItems List" /></label>
		   </td>
		   <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'orderItems', 'errors')}">
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		       <g:render template="orderItems" model="['orderInstance':orderInstance]" />
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		   </td>
		</tr>

    </tbody>
  </table>
</div>

