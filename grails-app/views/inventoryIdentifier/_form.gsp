<%@ page import="com.cimbidia.scm.oms.InventoryIdentifier" %>



<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventoryIdentifier.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryIdentifierInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventoryIdentifier.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryIdentifierInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventoryIdentifier.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryIdentifierInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventoryIdentifier.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryIdentifierInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'batchNo', 'error')} ">
	<label for="batchNo">
		<g:message code="inventoryIdentifier.batchNo.label" default="Batch No" />
		
	</label>
	<g:textField name="batchNo" value="${inventoryIdentifierInstance?.batchNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'countryOfOrigin', 'error')} ">
	<label for="countryOfOrigin">
		<g:message code="inventoryIdentifier.countryOfOrigin.label" default="Country Of Origin" />
		
	</label>
	<g:textField name="countryOfOrigin" value="${inventoryIdentifierInstance?.countryOfOrigin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'itemLocation', 'error')} required">
	<label for="itemLocation">
		<g:message code="inventoryIdentifier.itemLocation.label" default="Item Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryIdentifierInstance?.itemLocation?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute1', 'error')} ">
	<label for="lotAttribute1">
		<g:message code="inventoryIdentifier.lotAttribute1.label" default="Lot Attribute1" />
		
	</label>
	<g:textField name="lotAttribute1" value="${inventoryIdentifierInstance?.lotAttribute1}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute2', 'error')} ">
	<label for="lotAttribute2">
		<g:message code="inventoryIdentifier.lotAttribute2.label" default="Lot Attribute2" />
		
	</label>
	<g:textField name="lotAttribute2" value="${inventoryIdentifierInstance?.lotAttribute2}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotAttribute3', 'error')} ">
	<label for="lotAttribute3">
		<g:message code="inventoryIdentifier.lotAttribute3.label" default="Lot Attribute3" />
		
	</label>
	<g:textField name="lotAttribute3" value="${inventoryIdentifierInstance?.lotAttribute3}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotKeyReference', 'error')} ">
	<label for="lotKeyReference">
		<g:message code="inventoryIdentifier.lotKeyReference.label" default="Lot Key Reference" />
		
	</label>
	<g:textField name="lotKeyReference" value="${inventoryIdentifierInstance?.lotKeyReference}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotManufactureDate', 'error')} required">
	<label for="lotManufactureDate">
		<g:message code="inventoryIdentifier.lotManufactureDate.label" default="Lot Manufacture Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="lotManufactureDate" precision="minute" value="${inventoryIdentifierInstance?.lotManufactureDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'lotNumber', 'error')} ">
	<label for="lotNumber">
		<g:message code="inventoryIdentifier.lotNumber.label" default="Lot Number" />
		
	</label>
	<g:textField name="lotNumber" value="${inventoryIdentifierInstance?.lotNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'revisionNo', 'error')} ">
	<label for="revisionNo">
		<g:message code="inventoryIdentifier.revisionNo.label" default="Revision No" />
		
	</label>
	<g:textField name="revisionNo" value="${inventoryIdentifierInstance?.revisionNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryIdentifierInstance, field: 'tagNumber', 'error')} ">
	<label for="tagNumber">
		<g:message code="inventoryIdentifier.tagNumber.label" default="Tag Number" />
		
	</label>
	<g:textField name="tagNumber" value="${inventoryIdentifierInstance?.tagNumber}" />
</div>

