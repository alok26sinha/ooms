<%@ page import="com.cimbidia.scm.shipment.ShipmentAccessorial" %>



<div class="fieldcontain ${hasErrors(bean: shipmentAccessorialInstance, field: 'accessorial', 'error')} required">
	<label for="accessorial">
		<g:message code="shipmentAccessorial.accessorial.label" default="Accessorial" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="accessorial.id" from="${com.cimbidia.wm.core.rg.Accessorial.list()}" optionKey="id" value="${shipmentAccessorialInstance?.accessorial?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentAccessorialInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="shipmentAccessorial.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rate" value="${fieldValue(bean: shipmentAccessorialInstance, field: 'rate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipmentAccessorialInstance, field: 'shipment', 'error')} required">
	<label for="shipment">
		<g:message code="shipmentAccessorial.shipment.label" default="Shipment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="shipment.id" from="${com.cimbidia.wm.shipment.Shipment.list()}" optionKey="id" value="${shipmentAccessorialInstance?.shipment?.id}"  />
</div>

