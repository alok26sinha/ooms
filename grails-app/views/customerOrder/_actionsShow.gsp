<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
		
		
		<div class="action-menu-item">
			<g:link action="edit" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.edit.label', default: 'Edit')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="releasePO" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.Release.label', default: 'Release')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
		

	</div>
</span>