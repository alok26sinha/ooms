<%@ page import="com.cimbidia.scm.oms.InventorySupplyType" %>



<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventorySupplyType.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventorySupplyTypeInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventorySupplyType.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventorySupplyTypeInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventorySupplyType.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventorySupplyTypeInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventorySupplyType.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventorySupplyTypeInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="inventorySupplyType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${inventorySupplyTypeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'onhandSupply', 'error')} ">
	<label for="onhandSupply">
		<g:message code="inventorySupplyType.onhandSupply.label" default="Onhand Supply" />
		
	</label>
	<g:checkBox name="onhandSupply" value="${inventorySupplyTypeInstance?.onhandSupply}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyTypeInstance, field: 'supplyType', 'error')} ">
	<label for="supplyType">
		<g:message code="inventorySupplyType.supplyType.label" default="Supply Type" />
		
	</label>
	<g:textField name="supplyType" value="${inventorySupplyTypeInstance?.supplyType}" />
</div>

