<%@ page import="com.cimbidia.scm.asn.Asn" %>



<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'price', 'error')} ">
	<label for="price">
		<g:message code="asn.price.label" default="Price" />
		
	</label>
	<g:textField name="price" value="${fieldValue(bean: asnInstance, field: 'price')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'masterBOL', 'error')} ">
	<label for="masterBOL">
		<g:message code="asn.masterBOL.label" default="Master BOL" />
		
	</label>
	<g:textField name="masterBOL" value="${asnInstance?.masterBOL}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'trailerId', 'error')} ">
	<label for="trailerId">
		<g:message code="asn.trailerId.label" default="Trailer Id" />
		
	</label>
	<g:textField name="trailerId" value="${asnInstance?.trailerId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'tractorId', 'error')} ">
	<label for="tractorId">
		<g:message code="asn.tractorId.label" default="Tractor Id" />
		
	</label>
	<g:textField name="tractorId" value="${asnInstance?.tractorId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'sealNumber', 'error')} ">
	<label for="sealNumber">
		<g:message code="asn.sealNumber.label" default="Seal Number" />
		
	</label>
	<g:textField name="sealNumber" value="${asnInstance?.sealNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'tempCtrl', 'error')} ">
	<label for="tempCtrl">
		<g:message code="asn.tempCtrl.label" default="Temp Ctrl" />
		
	</label>
	<g:textField name="tempCtrl" value="${asnInstance?.tempCtrl}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'isPerish', 'error')} ">
	<label for="isPerish">
		<g:message code="asn.isPerish.label" default="Is Perish" />
		
	</label>
	<g:textField name="isPerish" value="${asnInstance?.isPerish}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'expectedShippingDate', 'error')} ">
	<label for="expectedShippingDate">
		<g:message code="asn.expectedShippingDate.label" default="Expected Shipping Date" />
		
	</label>
	<g:jqueryDatePicker name="expectedShippingDate" precision="minute" value="${asnInstance?.expectedShippingDate}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'expectedDeliveryDate', 'error')} ">
	<label for="expectedDeliveryDate">
		<g:message code="asn.expectedDeliveryDate.label" default="Expected Delivery Date" />
		
	</label>
	<g:jqueryDatePicker name="expectedDeliveryDate" precision="minute" value="${asnInstance?.expectedDeliveryDate}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'equipment', 'error')} ">
	<label for="equipment">
		<g:message code="asn.equipment.label" default="Equipment" />
		
	</label>
	<g:select name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${asnInstance?.equipment?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'carrierPrice', 'error')} ">
	<label for="carrierPrice">
		<g:message code="asn.carrierPrice.label" default="Carrier Price" />
		
	</label>
	<g:textField name="carrierPrice" value="${fieldValue(bean: asnInstance, field: 'carrierPrice')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'asnNo', 'error')} ">
	<label for="asnNo">
		<g:message code="asn.asnNo.label" default="Asn No" />
		
	</label>
	<g:textArea name="asnNo" cols="40" rows="5" value="${asnInstance?.asnNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'shipDestination', 'error')} required">
	<label for="shipDestination">
		<g:message code="asn.shipDestination.label" default="Ship Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="shipDestination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${asnInstance?.shipDestination?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="asn.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${asnInstance?.origin?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'additionalInformation', 'error')} ">
	<label for="additionalInformation">
		<g:message code="asn.additionalInformation.label" default="Additional Information" />
		
	</label>
	<g:textArea name="additionalInformation" cols="40" rows="5" value="${asnInstance?.additionalInformation}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'carrierCompany', 'error')} ">
	<label for="carrierCompany">
		<g:message code="asn.carrierCompany.label" default="Carrier Company" />
		
	</label>
	<g:select name="carrierCompany.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${asnInstance?.carrierCompany?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'billTo', 'error')} ">
	<label for="billTo">
		<g:message code="asn.billTo.label" default="Bill To" />
		
	</label>
	<g:select name="billTo.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${asnInstance?.billTo?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'businessUnit', 'error')} ">
	<label for="businessUnit">
		<g:message code="asn.businessUnit.label" default="Business Unit" />
		
	</label>
	<g:select name="businessUnit.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${asnInstance?.businessUnit?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'companyId', 'error')} ">
	<label for="companyId">
		<g:message code="asn.companyId.label" default="Company Id" />
		
	</label>
	<g:select name="companyId.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${asnInstance?.companyId?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="asn.weight.label" default="Weight" />
		
	</label>
	<g:textField name="weight" value="${fieldValue(bean: asnInstance, field: 'weight')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'volume', 'error')} ">
	<label for="volume">
		<g:message code="asn.volume.label" default="Volume" />
		
	</label>
	<g:textField name="volume" value="${fieldValue(bean: asnInstance, field: 'volume')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'quantity', 'error')} ">
	<label for="quantity">
		<g:message code="asn.quantity.label" default="Quantity" />
		
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: asnInstance, field: 'quantity')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'dimWeight', 'error')} ">
	<label for="dimWeight">
		<g:message code="asn.dimWeight.label" default="Dim Weight" />
		
	</label>
	<g:textField name="dimWeight" value="${fieldValue(bean: asnInstance, field: 'dimWeight')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'pc', 'error')} ">
	<label for="pc">
		<g:message code="asn.pc.label" default="Pc" />
		
	</label>
	<g:select name="pc.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.pc?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'deliveryEnd', 'error')} ">
	<label for="deliveryEnd">
		<g:message code="asn.deliveryEnd.label" default="Delivery End" />
		
	</label>
	<g:jqueryDatePicker name="deliveryEnd" precision="minute" value="${asnInstance?.deliveryEnd}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'deliveryStart', 'error')} ">
	<label for="deliveryStart">
		<g:message code="asn.deliveryStart.label" default="Delivery Start" />
		
	</label>
	<g:jqueryDatePicker name="deliveryStart" precision="minute" value="${asnInstance?.deliveryStart}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'pickupEnd', 'error')} ">
	<label for="pickupEnd">
		<g:message code="asn.pickupEnd.label" default="Pickup End" />
		
	</label>
	<g:jqueryDatePicker name="pickupEnd" precision="minute" value="${asnInstance?.pickupEnd}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'pickupStart', 'error')} ">
	<label for="pickupStart">
		<g:message code="asn.pickupStart.label" default="Pickup Start" />
		
	</label>
	<g:jqueryDatePicker name="pickupStart" precision="minute" value="${asnInstance?.pickupStart}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="asn.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${asnInstance?.createdBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'createdDttm', 'error')} required">
	<label for="createdDttm">
		<g:message code="asn.createdDttm.label" default="Created Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${asnInstance?.createdDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'fromAddress', 'error')} required">
	<label for="fromAddress">
		<g:message code="asn.fromAddress.label" default="From Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fromAddress.id" from="${com.cimbidia.wm.core.Address.list()}" optionKey="id" value="${asnInstance?.fromAddress?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'incoTerm', 'error')} required">
	<label for="incoTerm">
		<g:message code="asn.incoTerm.label" default="Inco Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="incoTerm.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.incoTerm?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'modifiedBy', 'error')} required">
	<label for="modifiedBy">
		<g:message code="asn.modifiedBy.label" default="Modified By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${asnInstance?.modifiedBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'modifiedDttm', 'error')} required">
	<label for="modifiedDttm">
		<g:message code="asn.modifiedDttm.label" default="Modified Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${asnInstance?.modifiedDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'mot', 'error')} required">
	<label for="mot">
		<g:message code="asn.mot.label" default="Mot" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${asnInstance?.mot?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'priorityNumber', 'error')} ">
	<label for="priorityNumber">
		<g:message code="asn.priorityNumber.label" default="Priority Number" />
		
	</label>
	<g:textField name="priorityNumber" value="${asnInstance?.priorityNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'receipt', 'error')} required">
	<label for="receipt">
		<g:message code="asn.receipt.label" default="Receipt" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="receipt.id" from="${com.cimbidia.wm.receiving.Receipt.list()}" optionKey="id" value="${asnInstance?.receipt?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'shipStatus', 'error')} ">
	<label for="shipStatus">
		<g:message code="asn.shipStatus.label" default="Ship Status" />
		
	</label>
	<g:textField name="shipStatus" value="${asnInstance?.shipStatus}" />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'toAddress', 'error')} required">
	<label for="toAddress">
		<g:message code="asn.toAddress.label" default="To Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="toAddress.id" from="${com.cimbidia.wm.core.Address.list()}" optionKey="id" value="${asnInstance?.toAddress?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'transResp', 'error')} required">
	<label for="transResp">
		<g:message code="asn.transResp.label" default="Trans Resp" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="transResp.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.transResp?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asnInstance, field: 'transportationOrders', 'error')} ">
	<label for="transportationOrders">
		<g:message code="asn.transportationOrders.label" default="Transportation Orders" />
		
	</label>
	<g:select name="transportationOrders" from="${com.cimbidia.wm.shipment.TransportationOrder.list()}" multiple="yes" optionKey="id" size="5" value="${asnInstance?.transportationOrders}" />
</div>

