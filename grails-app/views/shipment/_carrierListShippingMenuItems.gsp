<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
		
	<div class="actions" style="min-width: 200px;">

<div class="action-menu-item" id="acceptedCarriers">
	<g:link controller="shipment" action="acceptedCarrierShipment" id="acceptedCarrierIds">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.acceptShip.label"/></g:link>
</div>
<div class="action-menu-item" id="rejectedCarriers">
	<g:link controller="shipment" action="rejectedCarrierShipment" id="rejectedCarrierIds">
	<img src="${createLinkTo(dir:'images/icons/silk',file:'zoom.png')}"
		alt="Show Shipment" style="vertical-align: middle" />&nbsp;<warehouse:message code="shipping.rejectShip.label"/></g:link>
</div>
 </div>
 </span>