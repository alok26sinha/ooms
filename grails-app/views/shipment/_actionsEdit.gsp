<span id="order-action-menu" class="action-menu">
	<button class="action-btn btn btn-default">
		Actions<i class="fa fa-arrow-down"></i>
	</button>

	<div class="actions" style="min-width: 200px;">

		<div class="action-menu-item">
			<a href="#" onclick="$(this).closest('form').submit()">
				${warehouse.message(code: 'default.button.update.label', default: 'Update')}
			</a>
		</div>

		<div class="action-menu-item" id="resetShipId">
			<g:link controller="shipment" action="resetResourceSelection"	id="${shipmentInstance?.id}">
				
				Reset Resource Selection
			</g:link>
		</div>
		<div class="action-menu-item" id="tendered">
			<g:link controller="shipment" action="tenderedShipment"	id="${shipmentInstance?.id}">
				<warehouse:message					code="shipping.tenderShip.label" />
			</g:link>
		</div>
		<div class="action-menu-item" id="accepted">
			<g:link controller="shipment" action="acceptedShipment"	id="${shipmentInstance?.id}">
				<warehouse:message
					code="shipping.acceptShip.label" />
			</g:link>
		</div>
		<div class="action-menu-item" id="rejected">
			<g:link controller="shipment" action="rejectedShipment"	id="${shipmentInstance?.id}">
				<warehouse:message
					code="shipping.rejectShip.label" />
			</g:link>
		</div>
	</div>
</span>