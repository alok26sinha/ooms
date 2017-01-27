<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
		
		
		<div class="action-menu-item">
			<a href="#" onclick="$(this).closest('form').submit()">${warehouse.message(code: 'default.button.update.label', default: 'Update')}</a>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.Release.label', default: 'Release')}</g:link>		
		</div>
		<%--<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.voidrts.label', default: 'Void RTS')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.createto.label', default: 'Create TO')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.addto.label', default: 'Add to TO')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.buildlpn.label', default: 'Build LPN')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.createasn.label', default: 'Create ASN')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.acceptapo.label', default: 'Accept PO')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.rejectpo.label', default: 'Reject PO')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.counterpo.label', default: 'Counter PO')}</g:link>		
		</div>
		--%><div class="action-menu-item">
			<g:link action="">${warehouse.message(code: 'default.button.recall.label', default: 'Recall PO')}</g:link>		
		</div>
		<div class="action-menu-item">
			<g:link action="show">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
		
		

	</div>
</span>