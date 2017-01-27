<%@ page import="com.cimbidia.wm.shipment.Shipper" %>



<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="shipper.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" value="${shipperInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="shipper.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" value="${shipperInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'trackingUrl', 'error')} ">
	<label for="trackingUrl">
		<g:message code="shipper.trackingUrl.label" default="Tracking Url" />
		
	</label>
	<g:textArea name="trackingUrl" cols="40" rows="5" value="${shipperInstance?.trackingUrl}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'trackingFormat', 'error')} ">
	<label for="trackingFormat">
		<g:message code="shipper.trackingFormat.label" default="Tracking Format" />
		
	</label>
	<g:textArea name="trackingFormat" cols="40" rows="5" value="${shipperInstance?.trackingFormat}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'parameterName', 'error')} ">
	<label for="parameterName">
		<g:message code="shipper.parameterName.label" default="Parameter Name" />
		
	</label>
	<g:textArea name="parameterName" cols="40" rows="5" value="${shipperInstance?.parameterName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="shipper.users.label" default="Users" />
		
	</label>
	
<ul>
<g:each in="${shipperInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="user" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'user.label', default: 'User')])}</g:link>

</div>

%{-- <div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'carrierMots', 'error')} ">
	<label for="carrierMots">
		<g:message code="shipper.carrierMots.label" default="Carrier Mots" />
		
	</label>
	
<ul>
<g:each in="${shipperInstance?.carrierMots?}" var="c">
    <li><g:link controller="carrierMot" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="carrierMot" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'carrierMot.label', default: 'CarrierMot')])}</g:link>

</div> --}%

<div class="fieldcontain ${hasErrors(bean: shipperInstance, field: 'shipperServices', 'error')} ">
	<label for="shipperServices">
		<g:message code="shipper.shipperServices.label" default="Shipper Services" />
		
	</label>
	
<ul>
<g:each in="${shipperInstance?.shipperServices?}" var="s">
    <li><g:link controller="shipperService" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="shipperService" action="create" params="['shipper.id': shipperInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'shipperService.label', default: 'ShipperService')])}</g:link>

</div>

