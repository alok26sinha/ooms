<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
		<div class="actions" style="min-width: 200px;">
		<div class="action-menu-item" id="showOrder">
		<g:link controller="customerOrder" action="show" id="showOrderId">
		<warehouse:message code="shipping.showDetails.label"/></g:link>
		</div>

		<div class="action-menu-item" id="editOrder">
			<g:link controller="customerOrder" action="edit" id="editOrderId">
				<warehouse:message code="order.editOrder.label"/>
			</g:link>
			</div>
		
		
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.Release.label', default: 'Release')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.createrts.label', default: 'Create RTS')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.voidrts.label', default: 'Void RTS')}</g:link>		
		</div>
		
		
	
	
		<div class="action-menu-item">
			<g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
		

	</div>
</span>