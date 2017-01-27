<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" >
		
		
		
		<g:if test="${session?.company.type.code.equals("2") }">
		<div class="action-menu-item">
			<g:link action="acceptPO" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.accept.label', default: 'Accept')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="rejectPO" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.reject.label', default: 'Reject')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="counterPO" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.counter.label', default: 'Counter')}</g:link>		
		</div>
		</g:if>
		<g:if test="${session?.company.type.code.equals("1") }">
		<div class="action-menu-item">
			<g:link action="edit" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.edit.label', default: 'Edit')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="releasePO" id="${orderInstance?.id}">${warehouse.message(code: 'default.button.Release.label', default: 'Release')}</g:link>		
		</div>
		</g:if>
		<div class="action-menu-item">
			<g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
		

	</div>
</span>