<%@ page import="com.cimbidia.wm.core.rg.RatingLane" %>

<tr>
	                                <td valign="top" class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="businessUnit"><warehouse:message code="ratingLane.businessUnit.label" default="Business Unit" /></label>
	                                </td>
	                                <td valign="top" style="width: 100px; white-space: nowrap;" class="value ${hasErrors(bean: ratingLaneInstance, field: 'businessUnit', 'errors')}">
	                                    <g:select style="width: 100px; white-space: nowrap;" name="businessUnit.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${ratingLaneInstance?.businessUnit?.id}" noSelection="['null': '']" />
	                                </td>
	                                <td valign="top" class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="status"><warehouse:message code="ratingLane.status.label" default="Status" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneInstance, field: 'status', 'errors')}">
	                                    <g:select style="width: 100px; white-space: nowrap;" name="status" from="${ratingLaneInstance.constraints.status.inList}" value="${ratingLaneInstance?.status}" valueMessagePrefix="ratingLane.status"  />
	                                </td>
	                                 
	                        
	                            </tr>

	                        
	                            <tr>
	                                <td valign="top" class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="effectiveStartDate"><warehouse:message code="ratingLane.effectiveStartDate.label" default="Effective Start Date" /></label>
	                                </td>
	                                <td valign="top" style="width: 100px; white-space: nowrap;" class="value ${hasErrors(bean: ratingLaneInstance, field: 'effectiveStartDate', 'errors')}">
	                                    <g:jqueryDatePicker name="effectiveStartDate" precision="minute" value="${ratingLaneInstance?.effectiveStartDate}"  />
	                                </td>
	                                <td valign="top" class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="effectiveEndDate"><warehouse:message code="ratingLane.effectiveEndDate.label" default="Effective End Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneInstance, field: 'effectiveEndDate', 'errors')}">
	                                    <g:jqueryDatePicker name="effectiveEndDate" precision="minute" value="${ratingLaneInstance?.effectiveEndDate}"  />
	                                </td>
	                           
	                            </tr>

	                            <tr>
	                                <td valign="top" class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="maxCommodity"><warehouse:message code="ratingLane.maxCommodity.label" default="Max Commodity" /></label>
	                                </td>
	                                <td valign="top" style="width: 100px; white-space: nowrap;" class="value ${hasErrors(bean: ratingLaneInstance, field: 'maxCommodity', 'errors')}">
	                                    <g:selectCommodity name="maxCommodity.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneInstance?.maxCommodity?.id}"  />
	                                </td>
	                                <td valign="top"  class="name">
	                                    <label style="width: 100px; white-space: nowrap;" for="minCommodity"><warehouse:message code="ratingLane.minCommodity.label" default="Min Commodity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneInstance, field: 'minCommodity', 'errors')}">
	                                    <g:selectCommodity name="minCommodity.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneInstance?.minCommodity?.id}"  />
	                                </td>
	                                 
	                            </tr>

	                            <tr>
	                            	<td colspan="4">
										<table>
											<tr>
												<td><label><b>Origin</b></label>
							        	 			<table>
							        	 				<tr>
															<td style=""><label for='fromType'>Origin Type</label></td>
															<td><g:select name="fromType" optionValue="name" from="${com.cimbidia.wm.core.rg.RatingRoutingLocationType.list()}" value="${ratingLaneInstance?.fromType}"/>
															</td>
														</tr>
														<tr>
															<td style=""><label id="lblOrigin" for='origin'><warehouse:message
																		code="ratingLane.origin.label" default="Origin Location" /></label></td>
															
															<td>
																<span id="origin-span" class="span"></span> 
																<input id="origin-value" class="value" type="hidden" value="${ratingLaneInstance?.origin?.id}" name="origin.id"> 
																<span class="ui-helper-hidden-accessible" role="status" aria-live="polite">1</span>
																<input id="origin-suggest" class="autocomplete text ui-autocomplete-input" type="text" value="${ratingLaneInstance?.origin?.name}" placeholder="" name="origin.name" autocomplete="off">
																<script language="javascript">
																	$(document).ready(function() {
																		$("#origin-suggest").click(function() {
																			$(this).trigger("focus");
																		});
																		$("#origin-suggest").blur(function() {
																			return false;
																		});
																		$("#origin-span").click(function() {
																			return false;
																		});
																	$("#origin-suggest").autocomplete({
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
																			$("#origin-suggest").trigger("selected");
																		}
																		return false;
																	},
																	select: function(event, ui) {
																		if (ui.item) {
																			
																		$(this).prev().val(ui.item.value).trigger("change");;
																		$(this).val(ui.item.valueText);
																		
								
																		$("#origin-value").val(ui.item.value);
																		//alert(ui.item.value);
																		//alert(ui.item.address2);
																		}
																		$("#origin-suggest").trigger("selected");
																		return false;
																		}
																		});
																	});
																</script>
															</td>
														</tr>
														<tr>
															<td style=""><label for='fromCity'>City</label></td>
															<td><input type="text" id='fromCity'
																name='fromCity'
																value="${ratingLaneInstance?.fromCity?.encodeAsHTML()}" />
														</tr>
														<tr>
															<td style=""><label for='fromCounty'>County</label></td>
															<td><input type="text" name='fromCounty'
																value="${ratingLaneInstance?.fromCounty?.encodeAsHTML()}" />
														</tr>
														<tr>
															<td style=""><label for='fromPostalCode'>Postal Code</label></td>
															<td><input type="text" name='fromPostalCode'
																value="${ratingLaneInstance?.fromPostalCode?.encodeAsHTML()}" />
														</tr>
														<tr>
															<td style=""><label for='fromStateOrProvince'>State/Province</label></td>
															<td><g:selectSTATE 
																	id="fromStateOrProvince.id" name="fromStateOrProvince"
																	value="${ratingLaneInstance?.fromStateOrProvince}" noSelection="['null': '']" />
																<input style="display: none;" id="fromStateOrProvince" type="text" name="fromStateOrProvince.id"
																value="${ratingLaneInstance?.fromStateOrProvince}" /> </td>
															<script>
															$(document).ready(function()
															{
																 $("#fromCountry").change(function()
																 {
																	
																	  if($(this).val() != "usa")
																	  {
																		  	$("#fromStateOrProvince\\.id").hide();
																	   		$("#fromStateOrProvince").show();
																	  }
																	  else
																	  {
																		   $("#fromStateOrProvince").hide();
																		   $("#fromStateOrProvince\\.id").show();
																  	}
																 });
																 $("#fromStateOrProvince").hide();
															});
														</script>
														</tr>
														<tr>
															<td style=""><label for='fromCountry'>Country</label></td>
															<td><g:countrySelect id="fromCountry"
																	name="fromCountry"
																	value="${ratingLaneInstance?.fromCountry}" default="usa" noSelection="['null': '']" />
														</tr>
													</table>
												</td>
												<td >
													<label><b>Destination</b></label>
													<table>
														<tr>
															<td style=""><label for='toType'>Destination Type</label></td>
															<td>
																<g:select name="toType" optionValue="name" from="${com.cimbidia.wm.core.rg.RatingRoutingLocationType.list()}" value="${ratingLaneInstance?.toType}"/>
															</td>
														</tr>
														<tr>
															<td style=""><label for='destination'><warehouse:message
																		code="order.destination.label" default="Ship To" /></label></td>
															<td>
																<span id="destination-span" class="span" style="text-align: left; display: none;"></span> 
																<input id="destination-value" class="value" type="hidden" value="${ratingLaneInstance?.destination?.id}" name="destination.id">
																<span class="ui-helper-hidden-accessible" role="status" aria-live="polite">1</span> 
																<input id="destination-suggest" class="autocomplete text ui-autocomplete-input" type="text"
																value="${ratingLaneInstance?.destination?.name}" placeholder="" name="destination.name" autocomplete="off">
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
														<td style=""><label for='toCity'>City</label></td>
														<td><input type="text" id='toCity' name='toCity' value="${ratingLaneInstance?.toCity?.encodeAsHTML()}"/>
													
														</tr>
														<tr>
														<td style=""><label for='toCounty'>County</label></td>
														<td><input type="text" name='toCounty' value="${ratingLaneInstance?.toCounty?.encodeAsHTML()}"/>
														</tr>
														<tr>
														<td style=""><label for='toPostalCode'>Postal Code</label></td>
														<td><input type="text" name='toPostalCode' value="${ratingLaneInstance?.toPostalCode?.encodeAsHTML()}"/>
														</tr>
														<tr>
														<td style=""><label for='toStateOrProvince'>State/Province</label></td>
														<td><g:selectSTATE id="toStateOrProvince.id"  name="="toStateOrProvince" value="${ratingLaneInstance?.toStateOrProvince}" noSelection="['null': '']" />
														 <input style="display:none;" id="toStateOrProvince" type="text" name="toStateOrProvince.id"  value="${ratingLaneInstance?.toStateOrProvince}" />
														</td>
														<script>
														$(document).ready(function()
														{
															 $("#toCountry").change(function()
															 {
															  	if($(this).val() != "usa")
														  		{
															  		$("#toStateOrProvince\\.id").hide();
																   	$("#toStateOrProvince").show();
															  	}
															  	else
															  	{
																   $("#toStateOrProvince").hide();
																   $("#toStateOrProvince\\.id").show();
															  	}
														 });
															 $("#toStateOrProvince").hide();
														});
														</script>
														</tr>
														<tr>
														<td style=""><label for='toCountry'>Country</label></td>
														<td>
														<g:countrySelect id="toCountry" name="toCountry" value="${ratingLaneInstance?.toCountry}"
							         						default="usa" noSelection="['null': '']"/>
													
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
							 	</tr>
