
<tr id="referenceRow" class="odd" referenceId="${bookingReference.id}">
	<td>
		<a href="/cimbidiaSCM/booking/deleteBookingReference?bookingInstance.id=${bookingReference?.booking?.id}&bookingReference.id=${bookingReference?.id}"	id="deleteRefNumLink" >
			<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
		<a href="#"	funct="openEditReferenceLink" referenceId="${bookingReference.id}" >
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>
	
	</td>
	<td>
		<label id="referenceType">${bookingReference.referenceType}</label>
	</td>
	<td>
		<label id="referenceNumber">${bookingReference.referenceNumber}</label>
	</td>
</tr>
			