<tr>
    <td valign="top" class="name">
        <label for="bookingNumber"><warehouse:message code="booking.bookingNumber.label" default="Booking Number" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'bookingNumber', 'errors')}">
        <g:textField name="bookingNumberDisplay" value="${bookingInstance?.bookingNumber}"  disabled="disabled" />
		<g:hiddenField name='bookingNumber' value="${bookingInstance?.bookingNumber}"/>
		<g:hiddenField name="actionPerformed" id="actionPerformed"/>
	</td>
     <td valign="top" class="name">
        <label for="bookingStatus"><warehouse:message code="booking.bookingStatus.label" default="Booking Status" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'bookingStatus', 'errors')}">
        <g:textField name="displayStatus" value="${bookingInstance?.bookingStatus}" disabled="disabled" />
        <g:hiddenField name='bookingStatus' id='bookingStatus' value="${bookingInstance?.bookingStatus}"/>
    </td>
    <td/>
    <td/>
</tr>

<tr>
    <td valign="top" class="name">
        <label for="shipFrom"><warehouse:message code="booking.shipFrom.label" default="Ship From" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'shipFrom', 'errors')}">
    	<g:autoSuggest id="shipFrom" name="shipFrom"
										jsonUrl="${request.contextPath}/json/locationLookup"
										valueId="${bookingInstance?.shipFrom?.id}"
										valueName="${bookingInstance?.shipFrom?.name}"
										styleClass="text" width="175" />
     </td>
     <td valign="top" class="name">
        <label for="shipTo"><warehouse:message code="booking.shipTo.label" default="Ship To" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'shipTo', 'errors')}">
    	<g:autoSuggest id="shipTo" name="shipTo"
										jsonUrl="${request.contextPath}/json/locationLookup"
										valueId="${bookingInstance?.shipTo?.id}"
										valueName="${bookingInstance?.shipTo?.name}"
										styleClass="text" width="175" />
    </td>
    
 
</tr>



<tr>
    <td valign="top" class="name">
        <label for="originPort"><warehouse:message code="booking.originPort.label" default="Origin Port" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'originPort', 'errors')}">
        <g:selectPort id="originPort" name="originPort.id" value="${bookingInstance?.originPort?.id}" noSelection="['': '']"/>
    </td>
     <td valign="top" class="name">
        <label for="destinationPort"><warehouse:message code="booking.destinationPort.label" default="Destination Port" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'destinationPort', 'errors')}">
        <g:selectPort id="destinationPort" name="destinationPort.id" value="${bookingInstance?.destinationPort?.id}" noSelection="['': '']"/>
    </td>
    <td valign="top" class="name">
        <label for="carrier"><warehouse:message code="booking.carrier.label" default="Carrier" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'carrier', 'errors')}">
	%{--<g:autoSuggest id="carrier" name="carrier" orig="" dest="" 
									jsonUrl="${request.contextPath }/json/bookingCarrierLookup"
									valueId="${bookingInstance?.carrier?.id }"
									valueName="${bookingInstance?.carrier?.companyName }"
									styleClass="text" width="175" /> --}%
    <g:selectOceanCarrier id="carrier" name="carrier.id" value="${bookingInstance?.carrier?.id}"  />
    </td>
</tr>

<tr>
    <td valign="top" class="name">
        <label for="earliestDepartureDate"><warehouse:message code="booking.earliestDepartureDate.label" default="Earliest Departure Date" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'earliestDepartureDate', 'errors')}">
       <g:jqueryDatePicker showOn="focus" id="earliestDepartureDate" name="earliestDepartureDate" value="${bookingInstance?.earliestDepartureDate?.format('MM/dd/yyyy') }" format="MM/dd/yyyy" size="25" showTrigger="false" />
    </td>
    <td valign="top" class="name">
        <label for="mustArriveByDate"><warehouse:message code="booking.mustArriveByDate.label" default="Must Arrive By Date" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'mustArriveByDate', 'errors')}">
       <g:jqueryDatePicker showOn="focus" id="mustArriveByDate" name="mustArriveByDate" value="${bookingInstance?.mustArriveByDate?.format('MM/dd/yyyy') }" format="MM/dd/yyyy" size="25" showTrigger="false" />
    </td>
</tr>


<tr>
    <td valign="top" class="name">
        <label for="hazmat"><warehouse:message code="booking.hazmat.label" default="Hazmat" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'hazmat', 'errors')}">
        <g:checkBox id="hazmat" name="hazmat" value="${bookingInstance?.hazmat}" />
    </td>
     <td valign="top" class="name">
        <label for="productClass"><warehouse:message code="booking.productClass.label" default="Product Class" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'productClass', 'errors')}">
        <g:selectPC id="productClass" name="productClass.id"  value="${bookingInstance?.productClass?.id}"  noSelection="['null': '']"/>
     </td>
     <td valign="top" class="name">
        <label for="unCode"><warehouse:message code="booking.unCode.label" default="Un Code" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'unCode', 'errors')}">
        <g:selectUNNumber id="unCode" name="unCode.id" value="${bookingInstance?.unCode?.id}" noSelection="['null': '']"/>
    </td>
</tr>

<tr>
    <td valign="top" class="name">
        <label for="incoterms"><warehouse:message code="booking.incoterms.label" default="Incoterms" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'incoterms', 'errors')}">
	    <g:selectIncoterm id="incoterms" name="incoterms.id" value="${bookingInstance?.incoterms?.id}" />
    </td>
     <td valign="top" class="name">
        <label for="supplier"><warehouse:message code="booking.supplier.label" default="Supplier" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'supplier', 'errors')}">
        <g:autoSuggest id="supplier" name="supplier"
										jsonUrl="${request.contextPath}/json/vendorLookup"
										valueId="${bookingInstance?.supplier?.id}"
										valueName="${bookingInstance?.supplier?.companyName}"
										styleClass="text" width="175" />
    </td>
     <td valign="top" class="name">
        <label for="shipper"><warehouse:message code="booking.shipper.label" default="Shipper" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'shipper', 'errors')}">
        <g:autoSuggest id="shipper" name="shipper"
										jsonUrl="${request.contextPath}/json/companyLookup"
										valueId="${bookingInstance?.shipper?.id}"
										valueName="${bookingInstance?.shipper?.companyName}"
										styleClass="text" width="175" />
    </td>
</tr>


<tr>
    <td valign="top" class="name">
        <label for="customer"><warehouse:message code="booking.customer.label" default="Customer" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'customer', 'errors')}">
                <g:autoSuggest id="customer" name="customer"
										jsonUrl="${request.contextPath}/json/companyLookup"
										valueId="${bookingInstance?.customer?.id}"
										valueName="${bookingInstance?.customer?.companyName}"
										styleClass="text" width="175" />
    </td>
     <td valign="top" class="name">
        <label for="consignee"><warehouse:message code="booking.consignee.label" default="Consignee" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'consignee', 'errors')}">
		<g:autoSuggest id="consignee" name="consignee"
										jsonUrl="${request.contextPath}/json/companyLookup"
										valueId="${bookingInstance?.consignee?.id}"
										valueName="${bookingInstance?.consignee?.companyName}"
										styleClass="text" width="175" />        
    </td>
     <td valign="top" class="name">
        <label for="bookingAgent"><warehouse:message code="booking.bookingAgent.label" default="Booking Agent" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'bookingAgent', 'errors')}">
		<g:autoSuggest id="bookingAgent" name="bookingAgent"
								jsonUrl="${request.contextPath}/json/companyLookup"
								valueId="${bookingInstance?.bookingAgent?.id}"
								valueName="${bookingInstance?.bookingAgent?.companyName}"
								styleClass="text" width="175" />  
    </td>
</tr>

<tr>
    <td valign="top" class="name">
        <label for="specialHandling"><warehouse:message code="booking.specialHandlingCode.label" default="Special Handling Code" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'specialHandlingCode', 'errors')}">
         <g:selectSHC id="specialHandling" name="specialHandling.id" value="${bookingInstance?.specialHandling?.id}"/>
    </td>
      <td valign="top" class="name">
        <label for="comments"><warehouse:message code="booking.comments.label" default="Comments" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'comments', 'errors')}">
        <g:textField name="comments" value="${bookingInstance?.comments}" />
    </td>
    <g:if test="${bookingInstance?.bookingForecastId}">
	    <td>
		   	<a href="/cimbidiaSCM/bookingForecast/show/${bookingInstance?.bookingForecastId}">
				View Booking Forecast </a>
		</td>
	</g:if>
</tr>

<script>
$(function() {
	  $(".btn").click(function(){
	  	var $input = $( this );
	  	var btnPress = $input.attr("btnPress");
		$("#actionPerformed").val(btnPress);
	});

	$("#shipFrom-suggest").blur(function() {
			var val = $(this).val();
			if(val)
			{
				var locId = $("#shipFrom-value").attr("value");			
				makeAjaxCall(locId,"#originPort");
			} //end if val
			else
			{
				$("#originPort").empty();
			}
	}); //end onblur
	
	$("#shipTo-suggest").blur(function() {
			var val = $(this).val();
			if(val)
			{
				var locId = $("#shipTo-value").attr("value");			
				makeAjaxCall(locId,"#destinationPort");
			} //end if val
			else
			{
				$("#destinationPort").empty();
			}
	}); //end onblur
		
		
	$("#destinationPortaaa").blur(function() {
		alert ( 'babab' );
		/*var origin = $("#shipFrom").val();
		var origPort = $("#originPort").val();
		var destination = $("#shipTo").val();
		var destinationPort = $("#destinationPort").val();
		var orig = "";
		var dest = "";
		if(originPort)
		{
			orig = originPort;
		}
		else
		{
			orig = origin
		}
		if(destinationPort)
		{
			dest = destinationPort
		}
		else
		{
			dest = destination
		}
		alert('orig'+orig);*/
		getAjaxRoutingGuideCarriers('orig', 'dest');
	
	  });
	  
	  
	  function getAjaxRoutingGuideCarriers(origin, destination) { 
	  alert('in getroutguide');
	  var result = "";
			$.ajax({
					url: "/cimbidiaSCM/booking/jq_rgCarriers",
					type: "POST",
					data: { "origin": origin, "destination": destination },
					dataType: 'json',
					success: function(data) {
					}, //end success
					error: function(xhr, textStatus, error){
						   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					} //end error
        		});	//end ajax
		}
		
		function makeAjaxCall(locId, selId) {
			var result = "";
			$.ajax({
					url: "/cimbidiaSCM/relatedLocation/jq_relatedLocNames",
					type: "POST",
					data: { "locationId":locId },
					dataType: 'json',
					success: function(data) {
							var result = data.relLocMap
							var $selectField = $(selId);
							$selectField.empty(); // remove old options
							$.each(result, function(key, value) {
						  	$selectField.append($("<option></option>").attr("value", key).text(value));
						});
					}, //end success
					error: function(xhr, textStatus, error){
						   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					} //end error
        		});	//end ajax
		}
		
		

		
}); //end onLoad
	

</script>
    

	                        