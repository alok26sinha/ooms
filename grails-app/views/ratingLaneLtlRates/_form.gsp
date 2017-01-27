<%@ page import="com.cimbidia.wm.core.rg.RatingLaneLtlRates" %>



<div class="fieldcontain ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'ltlClass', 'error')} required">
	<label for="ltlClass">
		<g:message code="ratingLaneLtlRates.ltlClass.label" default="Ltl Class" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ltlClass" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'ltlClass')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="ratingLaneLtlRates.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rate" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'rate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'ratingLaneCarrier', 'error')} required">
	<label for="ratingLaneCarrier">
		<g:message code="ratingLaneLtlRates.ratingLaneCarrier.label" default="Rating Lane Carrier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="ratingLaneCarrier.id" from="${com.cimbidia.wm.core.rg.RatingLaneCarrier.list()}" optionKey="id" value="${ratingLaneLtlRatesInstance?.ratingLaneCarrier?.id}"  />
</div>


