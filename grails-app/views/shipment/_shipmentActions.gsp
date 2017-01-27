<span id="shipment-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
		
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.accept.label', default: 'accept')}</g:link>
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.reject.label', default: 'reject')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="list">${warehouse.message(code: 'default.button.rejectwithcom.label', default: 'reject with comments')}</g:link>		
		</div>
		
	</div>
</span>