<g:if test="${orderInstance?.id }">
	<span id="order-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			<i class="fa fa-arrow-down"></i>
		</button>
		<g:if test="${orderInstance?.isReceived() }">
			<g:render template="actionsReceived" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:if>
		<g:elseif test="${orderInstance?.isPlaced() }">
			<g:render template="actionsPlaced" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:elseif>
		<g:elseif test="${orderInstance?.isPending() }">
			<g:render template="actionsPending" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:elseif>
		<g:else>
			<div class="actions" style="min-width: 200px;">
				<div class="action-menu-item">
					<warehouse:message code="default.unknownState.label"/>
				</div>
			</div>
		</g:else>
	</span>
</g:if>
