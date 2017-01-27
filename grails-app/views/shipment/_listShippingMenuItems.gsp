
<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
		
	<div class="actions" style="min-width: 200px;">
	<div class="action-menu-item" id="show">
	<g:link controller="shipment" action="showDetails" id="shipIdShow">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.showDetails.label"/></g:link>
</div>

<div class="action-menu-item" id="edit">
			<g:link controller="shipment" action="edit" id="shipIdEdit">
				<img src="${createLinkTo(dir:'images/icons/silk',file:'pencil.png')}" class="middle" />&nbsp;
				<g:if test="${request.request.requestURL.toString().contains('createShipment')}"><warehouse:message code="shipping.editShipment.label"/></g:if>
				<g:else><warehouse:message code="shipping.editShipment.label"/></g:else>
			</g:link>
</div>
<div class="action-menu-item" id="tendered">
	<g:link controller="shipment" action="tenderedShipment" id="tenderedIds">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.tenderShip.label"/></g:link>
</div>
<div class="action-menu-item" id="accepted">
	<g:link controller="shipment" action="acceptedShipment" id="acceptedIds">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.acceptShip.label"/></g:link>
</div>
<div class="action-menu-item" id="rejected">
	<g:link controller="shipment" action="rejectedShipment" id="rejectedIds">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.rejectShip.label"/></g:link>
</div>
<div class="action-menu-item" id="resetShipId">
			<g:link controller="shipment" action="resetResourceSelectionShipment" id="resetResourceSelection">
			<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}" alt="Show Shipment" style="vertical-align: middle" />
				Reset Resource Selection
			</g:link>
		</div>
</div>
</span>