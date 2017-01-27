  	<tr>
    	<td>
        	<table>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="businessUnit"><warehouse:message code="routingGuide.businessUnit.label" default="Business Unit" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'businessUnit', 'errors')}">
                    <g:selectBU name="businessUnit.id" optionKey="bu" value="${routingGuideInstance?.businessUnit?.id}" noSelection="['null': '']" />
                      %{--  <g:selectBU name="businessUnit.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${routingGuideInstance?.businessUnit?.id}" noSelection="['null': '']" /> --}%
                    </td>
                    <td valign="top" class="name">
                        <label for="rgStatus"><warehouse:message code="routingGuide.rgStatus.label" default="Status" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'rgStatus', 'errors')}">
                        <g:select name="rgStatus" value="${routingGuideInstance?.rgStatus}" from="['ACTIVE','INACTIVE']"/>
                    </td>
                     <td valign="top" class="name">
                        <label for="effectiveStartDate"><warehouse:message code="routingGuide.effectiveStartDate.label" default="Effective Start Date" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'effectiveStartDate', 'errors')}">
                        <g:jqueryDatePicker name="effectiveStartDate" precision="minute" value="${routingGuideInstance?.effectiveStartDate?.format('MM/dd/yyyy')}" noSelection="['': '']" />
                    </td>
                     <td valign="top" class="name">
                        <label for="effectiveEndDate"><warehouse:message code="routingGuide.effectiveEndDate.label" default="Effective End Date" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'effectiveEndDate', 'errors')}">
                        <g:jqueryDatePicker name="effectiveEndDate" precision="minute" value="${routingGuideInstance?.effectiveEndDate?.format('MM/dd/yyyy')}" noSelection="['': '']" />
                    </td>
                      <td valign="top" class="name">
                        <label for="billingMethod"><warehouse:message code="routingGuide.billingMethod.label" default="Billing Method" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'billingMethod', 'errors')}">
                        <g:selectIncoterm name="billingMethod.id" value="${routingGuideInstance?.billingMethod?.id}"  noSelection="['null': '']" />
                    </td>
                     <td valign="top" class="name">
                        <label for="billTo"><warehouse:message code="routingGuide.billTo.label" default="Bill To" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: routingGuideInstance, field: 'billTo', 'errors')}">
                        <g:select name="billTo.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${routingGuideInstance?.billTo?.id}" noSelection="['null': '']" />
                    </td>
            	</tr>
   
    		</table>
		</td>
	</tr>
 	<tr>
		<td>
			<table>
				<tr>
					<td><label><b>Origin</b></label>
        	 			<table>
        	 				<tr>
								<td style=""><label for='fromType'>Origin Type</label></td>
								<td><g:select name="fromType" id="fromType" optionValue="name" from="${com.cimbidia.wm.core.rg.RatingRoutingLocationType.list()}" value="${routingGuideInstance?.fromType}"/>
								</td>
							</tr>
							<tr>
								<td style=""><label id="lblOrigin" for='origin'><warehouse:message
											code="routingGuide.origin.label" default="Origin Location" /></label></td>
								
								<td>
									<span id="origin-span" class="span"></span> 
									<input id="origin-value" class="value" type="hidden" value="${routingGuideInstance?.origin?.id}" name="origin.id"> 
									<input id="origin-suggest" class="autocomplete text ui-autocomplete-input" type="text" value="${routingGuideInstance?.origin?.name}" placeholder="" name="origin.name" autocomplete="off">
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
								<td style=""><label id="lblFromCity" for='fromCity'>City</label></td>
								<td><input type="text" id='fromCity'
									name='fromCity'
									value="${routingGuideInstance?.fromCity?.encodeAsHTML()}" />
							</tr>
							<tr>
								<td style=""><label id="lblFromCounty" for='fromCounty'>County</label></td>
								<td><input type="text" name='fromCounty' id='fromCounty'
									value="${routingGuideInstance?.fromCounty?.encodeAsHTML()}" />
							</tr>
							<tr>
								<td style=""><label id="lblFromPostalCode" for='fromPostalCode'>Postal Code</label></td>
								<td><input type="text" name='fromPostalCode' id='fromPostalCode'
									value="${routingGuideInstance?.fromPostalCode?.encodeAsHTML()}" />
							</tr>
							<tr>
								<td style=""><label id="lblFromStateOrProvince" for='fromStateOrProvince'>State/Province</label></td>
								<td><g:selectSTATE 
										id="fromStateOrProvince.id" name="fromStateOrProvince"
										value="${routingGuideInstance?.fromStateOrProvince}" noSelection="['null': '']" />
									<input style="display: none;" id="fromStateOrProvince" type="text" name="fromStateOrProvince.id"
									value="${routingGuideInstance?.fromStateOrProvince}" /> </td>
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
								<td style=""><label id="lblFromCountry" for='fromCountry'>Country</label></td>
								<td><g:countrySelect id="fromCountry"
										name="fromCountry"
										value="${routingGuideInstance?.fromCountry}" default="usa" noSelection="['null': '']" />
							</tr>
						</table>
					</td>
					<td><label><b>Destination</b></label>
						<table>
							<tr>
								<td style=""><label for='toType'>Destination Type</label></td>
								<td>
									<g:select name="toType" optionValue="name" from="${com.cimbidia.wm.core.rg.RatingRoutingLocationType.list()}" value="${routingGuideInstance?.toType}"/>
								</td>
							</tr>
							<tr>
								<td style=""><label id="lblDestination" for='destination'><warehouse:message
											code="order.destination.label" default="Destination" /></label></td>
								<td>
									<span id="destination-span" class="span" style="text-align: left; display: none;"></span> 
									<input id="destination-value" class="value" type="hidden" value="${routingGuideInstance?.destination?.id}" name="destination.id">
									<input id="destination-suggest" class="autocomplete text ui-autocomplete-input" type="text"
									value="${routingGuideInstance?.destination?.name}" placeholder="" name="destination.name" autocomplete="off">
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
							<td style=""><label id="lblToCity" for='toCity'>City</label></td>
							<td><input type="text" id='toCity' name='toCity' value="${routingGuideInstance?.toCity?.encodeAsHTML()}"/>
						
							</tr>
							<tr>
							<td style=""><label id="lblToCounty" for='toCounty'>County</label></td>
							<td><input type="text" id="toCounty" name='toCounty' value="${routingGuideInstance?.toCounty?.encodeAsHTML()}"/>
							</tr>
							<tr>
							<td style=""><label id="lblToPostalCode" for='toPostalCode'>Postal Code</label></td>
							<td><input id="toPostalCode" type="text" name='toPostalCode' value="${routingGuideInstance?.toPostalCode?.encodeAsHTML()}"/>
							</tr>
							<tr>
							<td style=""><label id="lblToStateOrProvince" for='toStateOrProvince'>State/Province</label></td>
							<td><g:selectSTATE id="toStateOrProvince.id"  name="="toStateOrProvince" value="${routingGuideInstance?.toStateOrProvince}" noSelection="['null': '']" />
							 <input style="display:none;" id="toStateOrProvince" type="text" name="toStateOrProvince.id"  value="${routingGuideInstance?.toStateOrProvince}" />
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
							<td style=""><label id="lblToCountry" for='toCountry'>Country</label></td>
							<td>
							<g:countrySelect id="toCountry" name="toCountry" value="${routingGuideInstance?.toCountry}"
         						default="usa" noSelection="['null': '']"/>
						
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
 	</tr>
 	<script>
 	$(document).ready(function()
	{
		
		showHideFromFields();		
		showHideToFields();		
	
		$("#fromType").blur(function() {
			showHideFromFields();
		});
	
	
		$("#toType").blur(function() {
			showHideToFields();
		});
		
		function showHideFromFields()
		{
			var val = $("#fromType").val();
			switch(val)
			{ 
				case 'Location' :
					$("#from").attr("style","display:inline");
					$("#lblOrigin").attr("style","display:inline");
					$("#origin-suggest").attr("style","display:inline");

					$("#fromCity").attr("style","display:none");
					$("#lblFromCity").attr("style","display:none");

					$("#fromCounty").attr("style","display:none");
					$("#lblFromCounty").attr("style","display:none");

					$("#fromCountry").hide();
					$("#lblFromCountry").attr("style","display:none");

					$("#fromPostalCode").attr("style","display:none");
					$("#lblFromPostalCode").attr("style","display:none");

				  	$("#fromStateOrProvince\\.id").hide();
					$("#lblFromStateOrProvince").attr("style","display:none");
					break;
					
				case 'Country' :
					$("#from").attr("style","display:none");
					$("#lblOrigin").attr("style","display:none");
					$("#origin-suggest").attr("style","display:none");

					$("#fromCity").attr("style","display:none");
					$("#lblFromCity").attr("style","display:none");

					$("#fromCounty").attr("style","display:none");
					$("#lblFromCounty").attr("style","display:none");

					$("#fromCountry").show();
					$("#lblFromCountry").attr("style","display:inline");

					$("#fromPostalCode").attr("style","display:none");
					$("#lblFromPostalCode").attr("style","display:none");

				  	$("#fromStateOrProvince\\.id").hide();
					$("#lblFromStateOrProvince").attr("style","display:none");
					break;
					
				case 'City-State-PostalCode' :
					$("#from").attr("style","display:none");
					$("#lblOrigin").attr("style","display:none");
					$("#origin-suggest").attr("style","display:none");

					$("#fromCity").attr("style","display:inline");
					$("#lblFromCity").attr("style","display:inline");

					$("#fromCounty").attr("style","display:inline");
					$("#lblFromCounty").attr("style","display:inline");

					$("#fromCountry").show();
					$("#lblFromCountry").attr("style","display:inline");
					
					$("#fromPostalCode").attr("style","display:inline");
					$("#lblFromPostalCode").attr("style","display:inline");

				  	$("#fromStateOrProvince\\.id").show();
					$("#lblFromStateOrProvince").attr("style","display:inline");
					break;  
			} 
		} 
		
		function showHideToFields()
		{
			var val = $("#toType").val();
			switch(val)
			{ 
				case 'Location' :
					$("#to").attr("style","display:inline");
					$("#lblDestination").attr("style","display:inline");
					$("#destination-suggest").attr("style","display:inline");

					$("#toCity").attr("style","display:none");
					$("#lblToCity").attr("style","display:none");

					$("#toCounty").attr("style","display:none");
					$("#lblToCounty").attr("style","display:none");

					$("#toCountry").hide();
					$("#lblToCountry").attr("style","display:none");

					$("#toPostalCode").attr("style","display:none");
					$("#lblToPostalCode").attr("style","display:none");

				  	$("#toStateOrProvince\\.id").hide();
					$("#lblToStateOrProvince").attr("style","display:none");
					break;
					
				case 'Country' :
					$("#to").attr("style","display:none");
					$("#lblDestination").attr("style","display:none");
					$("#destination-suggest").attr("style","display:none");

					$("#toCity").attr("style","display:none");
					$("#lblToCity").attr("style","display:none");

					$("#toCounty").attr("style","display:none");
					$("#lblToCounty").attr("style","display:none");

					$("#toCountry").show();
					$("#lblToCountry").attr("style","display:inline");

					$("#toPostalCode").attr("style","display:none");
					$("#lblToPostalCode").attr("style","display:none");

				  	$("#toStateOrProvince\\.id").hide();
					$("#lblToStateOrProvince").attr("style","display:none");
					break;
					
				case 'City-State-PostalCode' :
					$("#to").attr("style","display:none");
					$("#lblDestination").attr("style","display:none");
					$("#destination-suggest").attr("style","display:none");

					$("#toCity").attr("style","display:inline");
					$("#lblToCity").attr("style","display:inline");

					$("#toCounty").attr("style","display:inline");
					$("#lblToCounty").attr("style","display:inline");

					$("#toCountry").show();
					$("#lblToCountry").attr("style","display:inline");
					
					$("#toPostalCode").attr("style","display:inline");
					$("#lblToPostalCode").attr("style","display:inline");

				  	$("#toStateOrProvince\\.id").show();
					$("#lblToStateOrProvince").attr("style","display:inline");
					break;  
			} 
		}
		
	});
 	</script>