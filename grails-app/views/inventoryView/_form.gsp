<%@ page import="com.cimbidia.scm.oms.InventoryView" %>



<div class="fieldcontain ${hasErrors(bean: inventoryViewInstance, field: 'inventoryDemandList', 'error')} ">
	<label for="inventoryDemandList">
		<g:message code="inventoryView.inventoryDemandList.label" default="Inventory Demand List" />
		
	</label>
	<g:select name="inventoryDemandList" from="${com.cimbidia.scm.oms.InventoryDemand.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventoryDemandList}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryViewInstance, field: 'inventoryOnHandList', 'error')} ">
	<label for="inventoryOnHandList">
		<g:message code="inventoryView.inventoryOnHandList.label" default="Inventory On Hand List" />
		
	</label>
	<g:select name="inventoryOnHandList" from="${com.cimbidia.scm.oms.InventoryOnHand.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventoryOnHandList}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryViewInstance, field: 'inventorySupplyList', 'error')} ">
	<label for="inventorySupplyList">
		<g:message code="inventoryView.inventorySupplyList.label" default="Inventory Supply List" />
		
	</label>
	<g:select name="inventorySupplyList" from="${com.cimbidia.scm.oms.InventorySupply.list()}" multiple="yes" optionKey="id" size="5" value="${inventoryViewInstance?.inventorySupplyList}" />
</div>

