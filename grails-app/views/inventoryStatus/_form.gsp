<%@ page import="com.cimbidia.scm.oms.InventoryStatus" %>



<div class="fieldcontain ${hasErrors(bean: inventoryStatusInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="inventoryStatus.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${inventoryStatusInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryStatusInstance, field: 'inventoryStatus', 'error')} ">
	<label for="inventoryStatus">
		<g:message code="inventoryStatus.inventoryStatus.label" default="Inventory Status" />
		
	</label>
	<g:textField name="inventoryStatus" value="${inventoryStatusInstance?.inventoryStatus}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryStatusInstance, field: 'supplyType', 'error')} ">
	<label for="supplyType">
		<g:message code="inventoryStatus.supplyType.label" default="Supply Type" />
		
	</label>
	<g:textField name="supplyType" value="${inventoryStatusInstance?.supplyType}" />
</div>

