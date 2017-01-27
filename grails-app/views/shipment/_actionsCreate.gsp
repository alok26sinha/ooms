<span id="shipment-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
		
		<div class="action-menu-item">
			<a href="#" onclick="$(this).closest('form').submit()">${warehouse.message(code: 'default.button.create.label', default: 'create')}</a>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.Release.label', default: 'Release')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
	</div>
</span>