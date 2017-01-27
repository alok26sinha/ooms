<%@ page import="com.cimbidia.scm.oms.SourcingRuleHdr" %>



<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="sourcingRuleHdr.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="sourcingRuleHdr.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="sourcingRuleHdr.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${sourcingRuleHdrInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'lastUpdatedDttm', 'error')} ">
	<label for="lastUpdatedDttm">
		<g:message code="sourcingRuleHdr.lastUpdatedDttm.label" default="Last Updated Dttm" />
		
	</label>
	<g:jqueryDatePicker name="lastUpdatedDttm" precision="minute" value="${sourcingRuleHdrInstance?.lastUpdatedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'buyer', 'error')} required">
	<label for="buyer">
		<g:message code="sourcingRuleHdr.buyer.label" default="Buyer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="buyer.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.buyer?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="sourcingRuleHdr.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category.id" from="${com.cimbidia.wm.product.Category.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.category?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="sourcingRuleHdr.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'fulfillmentType', 'error')} required">
	<label for="fulfillmentType">
		<g:message code="sourcingRuleHdr.fulfillmentType.label" default="Fulfillment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fulfillmentType.id" from="${com.cimbidia.scm.oms.FulfillmentType.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.fulfillmentType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'locationType', 'error')} ">
	<label for="locationType">
		<g:message code="sourcingRuleHdr.locationType.label" default="Location Type" />
		
	</label>
	<g:textField name="locationType" value="${sourcingRuleHdrInstance?.locationType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="sourcingRuleHdr.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.product?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'productClass', 'error')} ">
	<label for="productClass">
		<g:message code="sourcingRuleHdr.productClass.label" default="Product Class" />
		
	</label>
	<g:textField name="productClass" value="${sourcingRuleHdrInstance?.productClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'substitutionAllowed', 'error')} ">
	<label for="substitutionAllowed">
		<g:message code="sourcingRuleHdr.substitutionAllowed.label" default="Substitution Allowed" />
		
	</label>
	<g:checkBox name="substitutionAllowed" value="${sourcingRuleHdrInstance?.substitutionAllowed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'toAddressGeoRegion', 'error')} ">
	<label for="toAddressGeoRegion">
		<g:message code="sourcingRuleHdr.toAddressGeoRegion.label" default="To Address Geo Region" />
		
	</label>
	<g:textField name="toAddressGeoRegion" value="${sourcingRuleHdrInstance?.toAddressGeoRegion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleHdrInstance, field: 'toLocation', 'error')} required">
	<label for="toLocation">
		<g:message code="sourcingRuleHdr.toLocation.label" default="To Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="toLocation.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.toLocation?.id}"  />
</div>

