
<%@ page import="com.cimbidia.scm.asn.Asn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<g:set var="entityName"
	value="${warehouse.message(code: 'asn.label', default: 'Asn')}" />
<title><warehouse:message code="default.create.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle">
<warehouse:message code="default.create.label" args="[entityName]" /></content>

<style>
.poheader {
	background-color: rgb(96, 166, 232);
	height: 10%;
	text-align: center;
	font-size: x-large;
	position: relative;
	top: 0px;
	font-family: cambri(body);
}

.dtl-header {
	width: 7.35%;
	text-align: center;
	color: white !important;
	background: #0c7ebb; /* Old browsers */
	background: -moz-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #0c7ebb),
		color-stop(100%, #0c99df)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #0c7ebb 0%, #0c99df 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c7ebb',
		endColorstr='#0c99df', GradientType=0); /* IE6-9 */
	padding:0px;
}

.dtl-header-small {
	background: #0c7ebb; /* Old browsers */
	background: -moz-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #0c7ebb),
		color-stop(100%, #0c99df)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0c7ebb 0%, #0c99df 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #0c7ebb 0%, #0c99df 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c7ebb',
		endColorstr='#0c99df', GradientType=0); /* IE6-9 */
	width: 2.5%;
	text-align: center;
	color: white !important;
	padding:0px
}

.dtl-header label {
	color: white !important;
}

.dtl-header-small label {
	color: white !important;
}

.dtl {
	background-color: white;
	border: 1px solid white !important;
	width: 7.54%;
	text-align: center;
	float: left;
}

.dtl-small {
	background-color: white;
	border: 1px solid white !important;
	width: 2.5%;
	vertical-align: top;
	text-align: center;
	float: left;
}

.envelope {
	
}

.asnItem-div {
	width: 100%;
	display: inline-block;
}

.del-asnItem {
	margin-left: 90%;
}

.dialog td{
	padding:0px;
}
</style>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${asnInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${asnInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="pc"><warehouse:message code="asn.pc.label" default="Product Class" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'pc', 'errors')}">
	                                    <g:select name="pc.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.pc?.id}" noSelection="['null': '']" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="price"><warehouse:message code="asn.price.label" default="Price" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'price', 'errors')}">
	                                    <g:textField style="width: 190px;" name="price" value="${fieldValue(bean: asnInstance, field: 'price')}" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="masterBOL"><warehouse:message code="asn.masterBOL.label" default="Master BOL" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'masterBOL', 'errors')}">
	                                    <g:textField style="width: 190px;" name="masterBOL" value="${asnInstance?.masterBOL}" />
	                                </td>
	                             </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="trailerId"><warehouse:message code="asn.trailerId.label" default="Trailer Id" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'trailerId', 'errors')}">
	                                    <g:textField style="width: 270px;" name="trailerId" value="${asnInstance?.trailerId}" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="tractorId"><warehouse:message code="asn.tractorId.label" default="Tractor Id" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'tractorId', 'errors')}">
	                                    <g:textField  style="width: 190px;" name="tractorId" value="${asnInstance?.tractorId}" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="sealNumber"><warehouse:message code="asn.sealNumber.label" default="Seal Number" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'sealNumber', 'errors')}">
	                                    <g:textField style="width: 190px;" name="sealNumber" value="${asnInstance?.sealNumber}" />
	                                </td>
	                             </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="tempCtrl"><warehouse:message code="asn.tempCtrl.label" default="Temp Ctrl" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'tempCtrl', 'errors')}">
	                                    <g:textField style="width: 270px;" name="tempCtrl" value="${asnInstance?.tempCtrl}" />
	                                </td>
	                          
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="isPerish"><warehouse:message code="asn.isPerish.label" default="Is Perish" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'isPerish', 'errors')}">
	                                    <g:textField style="width: 190px;" name="isPerish" value="${asnInstance?.isPerish}" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="carrierPrice"><warehouse:message code="asn.carrierPrice.label" default="Carrier Price" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'carrierPrice', 'errors')}">
	                                    <g:textField style="width: 190px;" name="carrierPrice" value="${fieldValue(bean: asnInstance, field: 'carrierPrice')}" />
	                                </td>
	                              </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="expectedShippingDate"><warehouse:message code="asn.expectedShippingDate.label" default="Expected Shipping Date" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'expectedShippingDate', 'errors')}">
	                                    <g:jqueryDatePicker style="width: 270px;" name="expectedShippingDate" precision="minute" value="${asnInstance?.expectedShippingDate}" noSelection="['': '']" />
	                                </td>
	                            
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="expectedDeliveryDate"><warehouse:message code="asn.expectedDeliveryDate.label" default="Expected Delivery Date" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'expectedDeliveryDate', 'errors')}">
	                                    <g:jqueryDatePicker name="expectedDeliveryDate" precision="minute" value="${asnInstance?.expectedDeliveryDate}" noSelection="['': '']" />
	                                </td>
	                            
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="equipment"><warehouse:message code="asn.equipment.label" default="Equipment" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'equipment', 'errors')}">
	                                    <g:select style="width: 190px;" name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${asnInstance?.equipment?.id}" noSelection="['null': '']" />
	                                </td>
	                              </tr>
	                        
	                           
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="asnNo"><warehouse:message code="asn.asnNo.label" default="Asn No" /></label>
	                                </td>
	                                <td colspan="4" valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'asnNo', 'errors')}">
	                                    <g:textField name="asnNo"style="width: 500px;"  value="${asnInstance?.asnNo}" />
	                                </td>
	                              </tr>	                        
	                              
	                            
	                             
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="additionalInformation"><warehouse:message code="asn.additionalInformation.label" default="Additional Information" /></label>
	                                </td>
	                                <td  colspan="4" valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'additionalInformation', 'errors')}">
	                                    <g:textField name="additionalInformation" style="width: 500px;" value="${asnInstance?.additionalInformation}" />
	                                </td>
	                            </tr>
	                        

	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="billTo"><warehouse:message code="asn.billTo.label" default="Bill To" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'billTo', 'errors')}">
	                                    
	                               		<g:autoSuggest id="billTo" name="billTo"
										jsonUrl="${request.contextPath }/json/companyLookup"
										valueId="${asnInstance?.billTo?.id }"
										valueName="${asnInstance?.billTo?.companyName }"
										styleClass="text" width="240" />
	                                </td>
	                            
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="businessUnit"><warehouse:message code="asn.businessUnit.label" default="Business Unit" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'businessUnit', 'errors')}">
	                                   
	                                    <g:autoSuggest id="businessUnit" name="businessUnit"
										jsonUrl="${request.contextPath }/json/asnCarrierLookup"
										valueId="${asnInstance?.businessUnit?.id}"
										valueName="${asnInstance?.businessUnit?.companyName}"
										styleClass="text" width="183" height="15"/>	 
	                                   
	                                </td>
	                             
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="dimWeight"><warehouse:message code="asn.dimWeight.label" default="Dimension Weight" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'dimWeight', 'errors')}">
	                                    <g:textField style="width: 190px;" name="dimWeight" value="${fieldValue(bean: asnInstance, field: 'dimWeight')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                            	
	                                 <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="transResp"><warehouse:message code="asn.transResp.label" default="Trans Resp" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'transResp', 'errors')}">
	                                    <g:select style="width: 270px;" name="transResp.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.transResp?.id}"  />
	                                </td>
	                               
	                          
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="volume"><warehouse:message code="asn.volume.label" default="Volume" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'volume', 'errors')}">
	                                    <g:textField  style="width: 190px;"name="volume" value="${fieldValue(bean: asnInstance, field: 'volume')}" />
	                                </td>
	                             
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="quantity"><warehouse:message code="asn.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'quantity', 'errors')}">
	                                    <g:textField style="width: 190px;" name="quantity" value="${fieldValue(bean: asnInstance, field: 'quantity')}" />
	                                </td>
	                              </tr>
	                        
	                            <tr class="prop">
	                               
	                            
	                            	<td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="incoTerm"><warehouse:message code="asn.incoTerm.label" default="Inco Term" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'incoTerm', 'errors')}">
	                                    <g:select style="width: 270px;" name="incoTerm.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${asnInstance?.incoTerm?.id}"  />
	                                </td>
	                                 <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="weight"><warehouse:message code="asn.weight.label" default="Weight" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'weight', 'errors')}">
	                                    <g:textField style="width: 190px;" name="weight" value="${fieldValue(bean: asnInstance, field: 'weight')}" />
	                                </td>
	                                
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="shipStatus"><warehouse:message code="asn.shipStatus.label" default="Ship Status" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'shipStatus', 'errors')}">
	                                    <g:textField style="width: 190px;" name="shipStatus" value="${asnInstance?.shipStatus}" />
	                                </td>
	                           
	                             </tr>
	                        
	                            <tr class="prop"> 
	                            	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="carrierCompany"><warehouse:message code="asn.carrierCompany.label" default="Carrier Company" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'carrierCompany', 'errors')}">
	                                    
										<g:autoSuggest id="carrierCompany" name="carrierCompany"
										jsonUrl="${request.contextPath }/json/asnCarrierLookup"
										valueId="${asnInstance?.carrierCompany?.id}"
										valueName="${asnInstance?.carrierCompany?.companyName }"
										styleClass="text" width="240" height="15"/>	                                
	                                </td>
	                            
	                               
	                         
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="mot"><warehouse:message code="asn.mot.label" default="Mot" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value ${hasErrors(bean: asnInstance, field: 'mot', 'errors')}">
	                                    <g:select style="width: 190px;"name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${asnInstance?.mot?.id}"  />
	                                </td>
	                             
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;padding:0px;">
	                                    <label for="priorityNumber"><warehouse:message code="asn.priorityNumber.label" default="Priority Number" /></label>
	                                </td>
	                                <td valign="top" style="padding:0px;" class="value  ${hasErrors(bean: asnInstance, field: 'priorityNumber', 'errors')}">
	                                    <g:textField style="width: 190px;" name="priorityNumber" value="${asnInstance?.priorityNumber}" />
	                                </td>
	                           </tr>
	                        
								  
	                             
							
					
	                           <tr>
	                           
								<td id="horizontalLine" colspan="6"><td/>
								
	                    <tr class="prop">
	                    <td colspan="2"><label class="section-header"
								>ORIGIN</label>
								<table>
									<tr>
										<td style="padding:0px;"><label for='origin'><warehouse:message
													code="asn.origin.label" default="Ship From" /></label></td>
										<td style="padding:0px;">
											<%--<g:selectOrderSupplier name="origin.id" optionKey="id" value="${asnInstance?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
										--%> <span id="origin-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="origin-value" class="value" type="hidden" value=""
											name="origin.id"> <input id="fromAddress.id"
											class="value" type="hidden" value="" name="fromAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="origin-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${asnInstance?.origin?.name}"
											placeholder="" name="origin.name" autocomplete="off">
											<script language="javascript">
												$(document)
														.ready(
																function() {
																	$(
																			"#origin-suggest")
																			.click(
																					function() {
																						$(
																								this)
																								.trigger(
																										"focus");
																					});
																	$(
																			"#origin-suggest")
																			.blur(
																					function() {
																						return false;
																					});
																	$(
																			"#origin-span")
																			.click(
																					function() {
																						return false;
																					});
																	//$("#origin-suggest").css('width', '300px');
																	$(
																			"#origin-suggest")
																			.autocomplete(
																					{
																						delay : 100,
																						minLength : 1,
																						dataType : 'json',
																						//define callback to format results
																						source : function(
																								req,
																								add) {
																							var currentLocationId = $(
																									"#currentLocationId")
																									.val();
																							$
																									.getJSON(
																											'/cimbidiaSCM/json/locationLookup',
																											{
																												term : req.term,
																												warehouseId : currentLocationId
																											},
																											function(
																													data) {
																												var items = [];
																												$
																														.each(
																																data,
																																function(
																																		i,
																																		item) {
																																	items
																																			.push(item);
																																});
																												add(items);
																											});
																						},
																						focus : function(
																								event,
																								ui) {
																							return false;
																						},
																						change : function(
																								event,
																								ui) {
																							// If the user does not select a value, we remove the value
																							if (!ui.item) {
																								$(
																										this)
																										.prev()
																										.val(
																												"null")
																										.trigger(
																												"change");
																								$(
																										this)
																										.val(
																												""); // set the value in the textbox to empty string
																								$(
																										"#origin-suggest")
																										.trigger(
																												"selected");
																							}
																							return false;
																						},
																						select : function(
																								event,
																								ui) {
																							if (ui.item) {

																								$(
																										this)
																										.prev()
																										.val(
																												ui.item.value)
																										.trigger(
																												"change");
																								;
																								$(
																										this)
																										.val(
																												ui.item.valueText);

																								$(
																										"#fromAddress\\.city")
																										.val(
																												ui.item.city);
																								$(
																										"#fromAddress\\.county")
																										.val(
																												ui.item.county);
																								$(
																										"#fromAddress\\.postalCode")
																										.val(
																												ui.item.postalCode);
																								$(
																										"#fromAddress\\.country")
																										.val(
																												ui.item.country);
																								//$("#fromAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
																								$(
																										"#fromAddress\\.stateOrProvince\\.id")
																										.val(
																												ui.item.stateOrProvince);

																								$(
																										"#fromAddress\\.address")
																										.val(
																												ui.item.address);
																								$(
																										"#origin-value")
																										.val(
																												ui.item.value);
																								//alert(ui.item.value);
																								//alert(ui.item.id);
																								$(
																										"#fromAddress\\.id")
																										.val(
																												ui.item.id);
																							}
																							$(
																									"#origin-suggest")
																									.trigger(
																											"selected");
																							return false;
																						}
																					});
																});
											</script>
										</td>
									</tr>
									<tr>
										<td style="padding:0px;"><label for='origin.address'>Street
												Address</label></td>
										<td style="padding:0px;"><input type="text" name='fromAddress.address'
											id='fromAddress.address'
											value="${asnInstance?.fromAddress?.address?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style="padding:0px;"><label for='city'>City</label></td>
										<td style="padding:0px;"><input type="text" id='fromAddress.city'
											name='fromAddress.city'
											value="${asnInstance?.fromAddress?.city?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style="padding:0px;"><label for='city'>County</label></td>
										<td style="padding:0px;"><input type="text" name='fromAddress.county'
											value="${asnInstance?.fromAddress?.county?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style="padding:0px;"><label for='state'>State/Province</label></td>
										<td style="padding:0px;"><g:selectSTATE optionKey="id"
												name="fromAddress.stateOrProvince.id"
												value="${asnInstance?.fromAddress?.stateOrProvince}" /> <input
											style="display: none;" id="fromAddress.stateOrProvince"
											type="text" name="fromAddress.stateOrProvince.id"
											value="${asnInstance?.fromAddress?.stateOrProvince}" /></td>
										<script>
									$(document).ready(function()
											{
											 $("#fromAddress\\.country").change(function()
											 {
												
											  if($(this).val() != "usa")
											  {
												  $("#fromAddress\\.stateOrProvince\\.id").hide();
											   $("#fromAddress\\.stateOrProvince").show();
											  }
											  else
											  {
											   $("#fromAddress\\.stateOrProvince").hide();
											   $("#fromAddress\\.stateOrProvince\\.id").show();
											  }
											 });
											 $("#fromAddress\\.stateOrProvince").hide();
											});
									</script>
									</tr>
									<tr>
										<td style="padding:0px;"><label for='country'>Country</label></td>
										<td style="padding:0px;"><g:countrySelect id="fromAddress.country"
												name="fromAddress.country"
												value="${asnInstance?.fromAddress?.country}" default="usa" />
									</tr>
									<tr>
										<td style="padding:0px;"><label for='postalCode'>Zip Code</label></td>
										<td style="padding:0px;"><input type="text" id='fromAddress.postalCode'
											name='fromAddress.postalCode'
											value="${asnInstance?.fromAddress?.postalCode?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style="padding:0px;"><label>Pickup Start</label></td>
										<td style="padding:0px;">
										<input type="text" name="pickupStart" id="pickupStart" value="${asnInstance?.pickupStart }">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupStart"
												name="pickupStart" value="${asnInstance?.pickupStart }"
												format="MM/dd/yyyy" size="25" showTrigger="false" />--%>
												</td>
									</tr>
									<tr>
										<td style="padding:0px;"><label>Pickup End</label></td>
										<td style="padding:0px;">
										<input type="text" name="pickupEnd" id="pickupEnd" value="${asnInstance?.pickupEnd }">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupEnd" name="pickupEnd"
												value="${asnInstance?.pickupEnd }" format="MM/dd/yyyy"
												size="25" showTrigger="false" />
												--%></td>
								</table>
								
								
								</td>
								<td id="verticalLine">
								</td>
	                    	<td colspan="2"><label class="section-header">
								DESTINATION</label>
								<table>
									<tr>
										<td style="padding:0px;"><label for='shipDestination'><warehouse:message
													code="asn.shipDestination.label" default="Ship To" /></label></td>
										<td style="padding:0px;">
											<%--<g:selectasnSupplier name="destination.id" optionKey="id" value="${asnInstance?.shipDestination?.id}" noSelection="['':'-Choose destination location-']"/>
										--%> <span id="destination-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="destination-value" class="value" type="hidden" value="1"
											name="shipDestination.id"> <input id="toAddress.id"
											class="value" type="hidden" value="" name="toAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="destination-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${asnInstance?.shipDestination?.name}"
											placeholder="" name="shipDestination.name" autocomplete="off">
											<script language="javascript">
											$(document).ready(function() {
											$("#destination-suggest").click(function() {
											$(this).trigger("focus");
											});
											$("#destination-suggest").blur(function() {
											return false;
											});
											$("#destination-span").click(function() {
											return false;
											});
											//$("#destination-suggest").css('width', '300px');
											$("#destination-suggest").autocomplete({
											delay: 100,
											minLength: 1,
											dataType: 'json',
											//define callback to format results
											source: function(req, add){
											var currentLocationId = $("#currentLocationId").val();
											
											$.getJSON('/cimbidiaSCM/json/locationLookup', { term: req.term, warehouseId: currentLocationId }, function(data) {
											var items = [];
											$.each(data, function(i, item) {
											items.push(item);
											});
											add(items);
											});
											},
											focus: function(event, ui) {
											return false;
											},
											change: function(event, ui) {
											// If the user does not select a value, we remove the value
											if (!ui.item) {
											$(this).prev().val("null").trigger("change");
											$(this).val(""); // set the value in the textbox to empty string
											$("#destination-suggest").trigger("selected");
											}
											return false;
											},
											select: function(event, ui) {
											if (ui.item) {
												
											$(this).prev().val(ui.item.value).trigger("change");;
											$(this).val(ui.item.valueText);
											
											$("#toAddress\\.city").val(ui.item.city);
											$("#toAddress\\.county").val(ui.item.county);
											$("#toAddress\\.postalCode").val(ui.item.postalCode);
												$("#toAddress\\.country").val(ui.item.country);
												//$("#toAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#toAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#toAddress\\.address").val(ui.item.address);
											$("#toAddress\\.id").val(ui.item.id);
											$("#destination-value").val(ui.item.value);
											}
											$("#destination-suggest").trigger("selected");
											return false;
											}
											});
											});
											</script>
										</td>
									</tr>
									<tr>
									<td style="padding:0px;"><label for='destination.address'>Street Address</label></td>
									<td style="padding:0px;"><input type="text" name='toAddress.address' id='toAddress.address' value="${asnInstance?.toAddress?.address?.encodeAsHTML()}"/>
									</tr>
									<tr>
									<td style="padding:0px;"><label for='city'>City</label></td>
									<td style="padding:0px;"><input type="text" id='toAddress.city' name='toAddress.city' value="${asnInstance?.toAddress?.city?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style="padding:0px;"><label for='city'>County</label></td>
									<td style="padding:0px;"><input type="text" name='toAddress.county' value="${asnInstance?.toAddress?.county?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style="padding:0px;"><label for='state'>State/Province</label></td>
									<td style="padding:0px;"><g:selectSTATE optionKey="id" name="toAddress.stateOrProvince.id"  value="${asnInstance?.toAddress?.stateOrProvince}" />
									<input style="display:none;" id="toAddress.stateOrProvince" type="text" name="toAddress.stateOrProvince.id"  value="${asnInstance?.toAddress?.stateOrProvince}" />
									</td>
									<script>
									$(document).ready(function()
											{
											 $("#toAddress\\.country").change(function()
											 {
												
											  if($(this).val() != "usa")
											  {
												  $("#toAddress\\.stateOrProvince\\.id").hide();
											   $("#toAddress\\.stateOrProvince").show();
											  }
											  else
											  {
											   $("#toAddress\\.stateOrProvince").hide();
											   $("#toAddress\\.stateOrProvince\\.id").show();
											  }
											 });
											 $("#toAddress\\.stateOrProvince").hide();
											});
									</script>
									</tr>
									<tr>
									<td style="padding:0px;"><label for='country'>Country</label></td>
									<td style="padding:0px;">
									<g:countrySelect id="toAddress.country" name="toAddress.country" value="${asnInstance?.toAddress?.country}"
                 						default="usa"/>
								
									</tr>
									<tr>
									<td style="padding:0px;"><label for='postalCode'>Zip Code</label></td>
									<td style="padding:0px;"><input type="text" id='toAddress.postalCode' name='toAddress.postalCode' value="${asnInstance?.toAddress?.postalCode?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style="padding:0px;"><label>Delivery Start</label></td>
									<td style="padding:0px;">
									<input type="text" name="deliveryStart" id="deliveryStart" value="${asnInstance?.deliveryStart }">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
									<%--<g:jqueryDatePicker 
										id="deliveryStart" 
										name="deliveryStart" 
										value="${asnInstance?.deliveryStart }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" />--%>
										</td>
										</tr>
										<tr>
										<td style="padding:0px"><label>Delivery End</label></td>
										<td style="padding:0px;">
										<input type="text" name="deliveryEnd" id="deliveryEnd" value="${asnInstance?.deliveryEnd }">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker 
										id="deliveryEnd" 
										name="deliveryEnd" 
										value="${asnInstance?.deliveryEnd }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" />--%>
										</td>
								</table>
							</td>
						</tr>
						<tr>
								
								<td colspan="6" id="horizontalLine"/><td/>
								
							</tr>
						</table>
						<table>
							
						</table>
						
	                    
	                    
		                       
		                        
	                       
	                    
	                   <table>
							<tr>
								
								<td>
								<label class="section-header-new" for='lineitems'><warehouse:message code="default.lineitems.label" default="LINE ITEMS"/></label>
								<td/>
							</tr>
					</table>
						
			<table>
					
			<tr class="prop" style="padding:0px">
			<td valign="top" style="padding:0px" class="dtl-header-small">
		      <label for="lineNumber">#</label>
		   </td>
		   <td valign="top" class="dtl-header"style="padding:0px">
		      <label for="order">Order</label>
		   </td>
		   <td valign="top" class="dtl-header" style="padding:0px">
		      <label for="orderItems"><g:message code="asnItem.Item.label" default="Item" /></label>
		   </td>
		  <td valign="top" class="dtl-header"  style="padding:0px">
			<label for="pc"><warehouse:message code="asnItem.pc.label" default="PC" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="Quantity"><warehouse:message code="asnItem.Quantity.label" default="Quantity" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="QuantityUOM"><warehouse:message code="asnItem.Quantity.label" default="Quantity/UOM" /></label>
			</td>
			
			
			
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="weight"><warehouse:message code="asnItem.weight.label" default="Weight" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="weightUom"><warehouse:message code="asnItem.weightUom.label" default="Weight UOM" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="Volume"><warehouse:message code="asnItem.Volume.label" default="Volume" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="volumeUom"><warehouse:message code="asnItem.volumeUom.label" default="Volume UOM" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="priceUom"><warehouse:message code="asnItem.priceUom.label" default="Price/ UOM" /></label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="priceCurrency">Price Currency</label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px">
			<label for="Item Details">Item Details</label>
			</td>
			<td valign="top" class="dtl-header" style="padding:0px"></td>
			</tr> 
			
			</table>
	      	<div valign="top" class="value ${hasErrors(bean: asnInstance, field: 'asnItems', 'errors')}">
		       <!-- Render the asnItems template (_asnItems.gsp) here -->
		       <g:render template="asnItems" model="['asnInstance':asnInstance]" />
		      
		    </div>
	                     
	                </div><table>
	                
	                 <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
						                </div>                        	
		                        	</td>
		                        </tr></table>
                </fieldset>
            </g:form>
        </div>
        
        <!-- Render the asnItem template (_asnItem.gsp) hidden so we can clone it -->
    <g:render template='asnItem' model="['asnItem':null,'i':'_clone','hidden':true]"/>
    <!-- Render the asnItem template (_asnItem.gsp) hidden so we can clone it -->
    </body>
</html>
