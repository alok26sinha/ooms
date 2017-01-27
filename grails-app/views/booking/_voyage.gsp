<tr class="prop">
    <td valign="top" class="name">
        <label for="bookingConfirmationNumber"><warehouse:message code="booking.bookingConfirmationNumber.label" default="Booking Confirmation Number" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'bookingConfirmationNumber', 'errors')}">
        <g:textField name="bookingConfirmationNumber" value="${bookingInstance?.bookingConfirmationNumber}" />
    </td>
</tr>


<tr class="prop">
     <td valign="top" class="name">
        <label for="vessel"><warehouse:message code="booking.vessel.label" default="Vessel" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'vessel', 'errors')}">
        <g:textField id="vessel" name="vessel" value="${bookingInstance?.vessel}"  />
    </td>
    <td valign="top" class="name">
        <label for="voyageNumber"><warehouse:message code="booking.voyageNumber.label" default="Voyage Number" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'voyageNumber', 'errors')}">
        <g:textField name="voyageNumber" value="${bookingInstance?.voyageNumber}" />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="closingDate"><warehouse:message code="booking.closingDate.label" default="Closing Date" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'closingDate', 'errors')}">
        <input id="closingDate" name="closingDate" value="${bookingInstance?.closingDate?.format('yyyy/MM/dd HH:mm') }" />
    </td>
      <td valign="top" class="name">
        <label for="plannedDepartureDate"><warehouse:message code="booking.plannedDepartureDate.label" default="Planned Departure Date" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'plannedDepartureDate', 'errors')}">
        <input id="plannedDepartureDate" name="plannedDepartureDate" value="${bookingInstance?.plannedDepartureDate?.format('yyyy/MM/dd HH:mm') }"/>
    </td>
     <td valign="top" class="name">
        <label for="plannedArrivalDate"><warehouse:message code="booking.plannedArrivalDate.label" default="Planned Arrival Date" />
    </td>
    <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'plannedArrivalDate', 'errors')}">
        <input id="plannedArrivalDate" name="plannedArrivalDate" value="${bookingInstance?.plannedArrivalDate?.format('yyyy/MM/dd HH:mm') }"/>
    </td>
</tr>

<script>
$(function(){
	$("#closingDate").datetimepicker(
	{
	//	mask:true,
		format:'Y/m/d H:i'
	});
   	$("#plannedDepartureDate").datetimepicker(
	{
	//	mask:true,
		format:'Y/m/d H:i'
	});
   		
   	$("#plannedArrivalDate").datetimepicker(
	{
	//	mask:true,
		format:'Y/m/d H:i'
	});

});
</script>