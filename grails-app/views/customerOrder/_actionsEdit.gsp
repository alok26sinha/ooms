<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
		
		
		<div class="action-menu-item">
			<a href="#" onclick="$(this).closest('form').submit()">${warehouse.message(code: 'default.button.update.label', default: 'Update')}</a>		
		</div>
		<g:if test="${customerOrderInstance?.status?.toString().encodeAsHTML().equals("ACKNOWLEDGED")}">
		<div class="action-menu-item">
			<g:link controller="customerOrder" action="createTOFromCO" id="${customerOrderInstance?.id?.encodeAsHTML()}">${warehouse.message(code: 'co.button.commit.label', default: 'Commit')}</g:link>		
		</div>
		</g:if>
		 <g:if test="${customerOrderInstance?.status?.toString().encodeAsHTML().equals("NEW")}">
		<div class="action-menu-item">
			<g:link controller="customerOrder" action="acknowledgeCO" id="${customerOrderInstance?.id?.encodeAsHTML()}">${warehouse.message(code: 'co.button.ack.label', default: 'Acknowledge')}</g:link>		
		</div>
		</g:if>
		<div class="action-menu-item">
			<g:link action="show">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>		
		</div>
	</div>
</span>