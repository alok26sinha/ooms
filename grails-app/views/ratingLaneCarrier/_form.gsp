<%@ page import="com.cimbidia.wm.core.rg.RatingLaneCarrier" %>



<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'carrier', 'error')} required">
	<label for="carrier">
		<g:message code="ratingLaneCarrier.carrier.label" default="Carrier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="carrier.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.carrier?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'mot', 'error')} ">
	<label for="mot">
		<g:message code="ratingLaneCarrier.mot.label" default="Mot" />
		
	</label>
	<g:select name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.mot?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'equipment', 'error')} ">
	<label for="equipment">
		<g:message code="ratingLaneCarrier.equipment.label" default="Equipment" />
		
	</label>
	<g:select name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.equipment?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'tempCtrl', 'error')} ">
	<label for="tempCtrl">
		<g:message code="ratingLaneCarrier.tempCtrl.label" default="Temp Ctrl" />
		
	</label>
	<g:select name="tempCtrl.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.tempCtrl?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'serviceLevel', 'error')} ">
	<label for="serviceLevel">
		<g:message code="ratingLaneCarrier.serviceLevel.label" default="Service Level" />
		
	</label>
	<g:select name="serviceLevel.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.serviceLevel?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'secondaryCarrier', 'error')} ">
	<label for="secondaryCarrier">
		<g:message code="ratingLaneCarrier.secondaryCarrier.label" default="Secondary Carrier" />
		
	</label>
	<g:select name="secondaryCarrier.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.secondaryCarrier?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'contractNumber', 'error')} ">
	<label for="contractNumber">
		<g:message code="ratingLaneCarrier.contractNumber.label" default="Contract Number" />
		
	</label>
	<g:textField name="contractNumber" value="${ratingLaneCarrierInstance?.contractNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'minRate', 'error')} ">
	<label for="minRate">
		<g:message code="ratingLaneCarrier.minRate.label" default="Min Rate" />
		
	</label>
	<g:textField name="minRate" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'minRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rateUnit', 'error')} ">
	<label for="rateUnit">
		<g:message code="ratingLaneCarrier.rateUnit.label" default="Rate Unit" />
		
	</label>
	<g:select name="rateUnit.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.rateUnit?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'tariff', 'error')} ">
	<label for="tariff">
		<g:message code="ratingLaneCarrier.tariff.label" default="Tariff" />
		
	</label>
	<g:select name="tariff.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.tariff?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'minDistance', 'error')} ">
	<label for="minDistance">
		<g:message code="ratingLaneCarrier.minDistance.label" default="Min Distance" />
		
	</label>
	<g:textField name="minDistance" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'minDistance')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'supportsMultiStop', 'error')} ">
	<label for="supportsMultiStop">
		<g:message code="ratingLaneCarrier.supportsMultiStop.label" default="Supports Multi Stop" />
		
	</label>
	<g:checkBox name="supportsMultiStop" value="${ratingLaneCarrierInstance?.supportsMultiStop}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'payee', 'error')} ">
	<label for="payee">
		<g:message code="ratingLaneCarrier.payee.label" default="Payee" />
		
	</label>
	<g:select name="payee.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.payee?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'surgeRate', 'error')} ">
	<label for="surgeRate">
		<g:message code="ratingLaneCarrier.surgeRate.label" default="Surge Rate" />
		
	</label>
	<g:checkBox name="surgeRate" value="${ratingLaneCarrierInstance?.surgeRate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'frequency', 'error')} ">
	<label for="frequency">
		<g:message code="ratingLaneCarrier.frequency.label" default="Frequency" />
		
	</label>
	<g:select name="frequency.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.frequency?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'modifReasonCode', 'error')} ">
	<label for="modifReasonCode">
		<g:message code="ratingLaneCarrier.modifReasonCode.label" default="Modif Reason Code" />
		
	</label>
	<g:select name="modifReasonCode.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.modifReasonCode?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="ratingLaneCarrier.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${ratingLaneCarrierInstance?.comments}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'currency', 'error')} required">
	<label for="currency">
		<g:message code="ratingLaneCarrier.currency.label" default="Currency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="currency.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.currency?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="ratingLaneCarrier.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rate" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'rate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rateType', 'error')} required">
	<label for="rateType">
		<g:message code="ratingLaneCarrier.rateType.label" default="Rate Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rateType.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.rateType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneCarrierInstance, field: 'ratingLane', 'error')} required">
	<label for="ratingLane">
		<g:message code="ratingLaneCarrier.ratingLane.label" default="Rating Lane" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="ratingLane.id" from="${com.cimbidia.wm.core.rg.RatingLane.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.ratingLane?.id}"  />
</div>

