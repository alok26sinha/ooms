<%@ page import="com.cimbidia.scm.oms.InventoryOnHand" %>



<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventoryOnHand.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryOnHandInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventoryOnHand.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryOnHandInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventoryOnHand.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryOnHandInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventoryOnHand.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryOnHandInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'itemLocation', 'error')} required">
	<label for="itemLocation">
		<g:message code="inventoryOnHand.itemLocation.label" default="Item Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryOnHandInstance?.itemLocation?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'inventoryIdentifier', 'error')} required">
	<label for="inventoryIdentifier">
		<g:message code="inventoryOnHand.inventoryIdentifier.label" default="Inventory Identifier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryOnHandInstance?.inventoryIdentifier?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="inventoryOnHand.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryOnHandInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'allocQty', 'error')} required">
	<label for="allocQty">
		<g:message code="inventoryOnHand.allocQty.label" default="Alloc Qty" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="allocQty" value="${fieldValue(bean: inventoryOnHandInstance, field: 'allocQty')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'averageCost', 'error')} required">
	<label for="averageCost">
		<g:message code="inventoryOnHand.averageCost.label" default="Average Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="averageCost" value="${fieldValue(bean: inventoryOnHandInstance, field: 'averageCost')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'costCurrency', 'error')} ">
	<label for="costCurrency">
		<g:message code="inventoryOnHand.costCurrency.label" default="Cost Currency" />
		
	</label>
	<g:textField name="costCurrency" value="${inventoryOnHandInstance?.costCurrency}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="inventoryOnHand.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="endDate" precision="minute" value="${inventoryOnHandInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="inventoryOnHand.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: inventoryOnHandInstance, field: 'quantity')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="inventoryOnHand.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="startDate" precision="minute" value="${inventoryOnHandInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryOnHandInstance, field: 'unitCost', 'error')} required">
	<label for="unitCost">
		<g:message code="inventoryOnHand.unitCost.label" default="Unit Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unitCost" value="${fieldValue(bean: inventoryOnHandInstance, field: 'unitCost')}" />
</div>

