<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" >
		
		
		<div class="action-menu-item">
			<a href="#" onclick="$(this).closest('form').submit()">${warehouse.message(code: 'default.button.create.label', default: 'Create')}</a>		
		</div>
		
		<div class="action-menu-item">
			<g:link action="create">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
		

	</div>
</span>