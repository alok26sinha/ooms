<%@ page import="com.cimbidia.wm.shipment.Shipment" %>



<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="shipment.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" value="${shipmentInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'shipmentNumber', 'error')} ">
	<label for="shipmentNumber">
		<g:message code="shipment.shipmentNumber.label" default="Shipment Number" />
		
	</label>
	<g:textArea name="shipmentNumber" cols="40" rows="5" value="${shipmentInstance?.shipmentNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="shipment.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'destination', 'error')} required">
	<label for="destination">
		<g:message code="shipment.destination.label" default="Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="destination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.destination?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'expectedShippingDate', 'error')} required">
	<label for="expectedShippingDate">
		<g:message code="shipment.expectedShippingDate.label" default="Expected Shipping Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expectedShippingDate" precision="minute" value="${shipmentInstance?.expectedShippingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'expectedDeliveryDate', 'error')} ">
	<label for="expectedDeliveryDate">
		<g:message code="shipment.expectedDeliveryDate.label" default="Expected Delivery Date" />
		
	</label>
	<g:datePicker name="expectedDeliveryDate" precision="minute" value="${shipmentInstance?.expectedDeliveryDate}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'shipmentType', 'error')} required">
	<label for="shipmentType">
		<g:message code="shipment.shipmentType.label" default="Shipment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="shipmentType.id" from="${com.cimbidia.wm.shipment.ShipmentType.list()}" optionKey="id" value="${shipmentInstance?.shipmentType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'shipmentMethod', 'error')} ">
	<label for="shipmentMethod">
		<g:message code="shipment.shipmentMethod.label" default="Shipment Method" />
		
	</label>
	<g:select name="shipmentMethod.id" from="${com.cimbidia.wm.shipment.ShipmentMethod.list()}" optionKey="id" value="${shipmentInstance?.shipmentMethod?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'receipt', 'error')} ">
	<label for="receipt">
		<g:message code="shipment.receipt.label" default="Receipt" />
		
	</label>
	<g:select name="receipt.id" from="${com.cimbidia.wm.receiving.Receipt.list()}" optionKey="id" value="${shipmentInstance?.receipt?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'additionalInformation', 'error')} ">
	<label for="additionalInformation">
		<g:message code="shipment.additionalInformation.label" default="Additional Information" />
		
	</label>
	<g:textArea name="additionalInformation" cols="40" rows="5" value="${shipmentInstance?.additionalInformation}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'carrier', 'error')} ">
	<label for="carrier">
		<g:message code="shipment.carrier.label" default="Carrier" />
		
	</label>
	<g:select name="carrier.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${shipmentInstance?.carrier?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'recipient', 'error')} ">
	<label for="recipient">
		<g:message code="shipment.recipient.label" default="Recipient" />
		
	</label>
	<g:select name="recipient.id" from="${com.cimbidia.wm.core.Person.list()}" optionKey="id" value="${shipmentInstance?.recipient?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'donor', 'error')} ">
	<label for="donor">
		<g:message code="shipment.donor.label" default="Donor" />
		
	</label>
	<g:select name="donor.id" from="${com.cimbidia.wm.donation.Donor.list()}" optionKey="id" value="${shipmentInstance?.donor?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'statedValue', 'error')} ">
	<label for="statedValue">
		<g:message code="shipment.statedValue.label" default="Stated Value" />
		
	</label>
	<g:textField name="statedValue" value="${fieldValue(bean: shipmentInstance, field: 'statedValue')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'totalValue', 'error')} ">
	<label for="totalValue">
		<g:message code="shipment.totalValue.label" default="Total Value" />
		
	</label>
	<g:textField name="totalValue" value="${fieldValue(bean: shipmentInstance, field: 'totalValue')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="shipment.weight.label" default="Weight" />
		
	</label>
	<g:textField name="weight" value="${fieldValue(bean: shipmentInstance, field: 'weight')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'weightUnits', 'error')} ">
	<label for="weightUnits">
		<g:message code="shipment.weightUnits.label" default="Weight Units" />
		
	</label>
	<g:textField name="weightUnits" value="${shipmentInstance?.weightUnits}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'referenceNumbers', 'error')} ">
	<label for="referenceNumbers">
		<g:message code="shipment.referenceNumbers.label" default="Reference Numbers" />
		
	</label>
	<g:select name="referenceNumbers" from="${com.cimbidia.wm.shipment.ReferenceNumber.list()}" multiple="yes" optionKey="id" size="5" value="${shipmentInstance?.referenceNumbers}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="shipment.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${com.cimbidia.wm.core.Event.list()}" multiple="yes" optionKey="id" size="5" value="${shipmentInstance?.events}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'carrierStatusCode', 'error')} required">
	<label for="carrierStatusCode">
		<g:message code="shipment.carrierStatusCode.label" default="Carrier Status Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="carrierStatusCode" from="${com.cimbidia.wm.shipment.CarrierStatusCode?.values()}" value="${shipmentInstance?.carrierStatusCode}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="shipment.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${com.cimbidia.wm.core.Comment.list()}" multiple="yes" optionKey="id" size="5" value="${shipmentInstance?.comments}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'containers', 'error')} ">
	<label for="containers">
		<g:message code="shipment.containers.label" default="Containers" />
		
	</label>
	
<ul>
<g:each in="${shipmentInstance?.containers?}" var="c">
    <li><g:link controller="container" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="container" action="create" params="['shipment.id': shipmentInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'container.label', default: 'Container')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="shipment.documents.label" default="Documents" />
		
	</label>
	<g:select name="documents" from="${com.cimbidia.wm.core.Document.list()}" multiple="yes" optionKey="id" size="5" value="${shipmentInstance?.documents}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'incomingTransactions', 'error')} ">
	<label for="incomingTransactions">
		<g:message code="shipment.incomingTransactions.label" default="Incoming Transactions" />
		
	</label>
	
<ul>
<g:each in="${shipmentInstance?.incomingTransactions?}" var="i">
    <li><g:link controller="transaction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="transaction" action="create" params="['shipment.id': shipmentInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'transaction.label', default: 'Transaction')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'orderDeliveryShipments', 'error')} ">
	<label for="orderDeliveryShipments">
		<g:message code="shipment.orderDeliveryShipments.label" default="Order Delivery Shipments" />
		
	</label>
	
<ul>
<g:each in="${shipmentInstance?.orderDeliveryShipments?}" var="o">
    <li><g:link controller="orderDeliveryShipment" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="orderDeliveryShipment" action="create" params="['shipment.id': shipmentInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'orderDeliveryShipment.label', default: 'OrderDeliveryShipment')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'outgoingTransactions', 'error')} ">
	<label for="outgoingTransactions">
		<g:message code="shipment.outgoingTransactions.label" default="Outgoing Transactions" />
		
	</label>
	
<ul>
<g:each in="${shipmentInstance?.outgoingTransactions?}" var="o">
    <li><g:link controller="transaction" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="transaction" action="create" params="['shipment.id': shipmentInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'transaction.label', default: 'Transaction')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: shipmentInstance, field: 'shipmentItems', 'error')} ">
	<label for="shipmentItems">
		<g:message code="shipment.shipmentItems.label" default="Shipment Items" />
		
	</label>
	
<ul>
<g:each in="${shipmentInstance?.shipmentItems?}" var="s">
    <li><g:link controller="shipmentItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="shipmentItem" action="create" params="['shipment.id': shipmentInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'shipmentItem.label', default: 'ShipmentItem')])}</g:link>

</div>

