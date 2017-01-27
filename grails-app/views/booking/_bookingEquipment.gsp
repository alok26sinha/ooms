

<tr id="equipmentRow" class="odd" equipId="${bookingEquipment.id}" >
	<td>
		<a href="/cimbidiaSCM/booking/deleteBookingEquipment?bookingInstance.id=${bookingEquipment?.booking?.id}&bookingEquipment.id=${bookingEquipment?.id}"	disabled="true" id="deleteEquipLink" >
			<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
		<a href="#"	funct="openEditEquipLink" equipId="${bookingEquipment.id}" id="editEquipLink">
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>
	</td>
	<td>
		<g:hiddenField id="equipid" name="bookingEquipment.id" value="${bookingEquipment.id}"/>
		<label id="equipmentTypeCode">${bookingEquipment.equipmentType.code}</label>
 	</td>
	<td>
		<label id="equipmentTypeDescription">${bookingEquipment.equipmentType.description}</label>
	</td>
	<td>
		<label id="numOfContainers">${bookingEquipment.numOfContainers}</label>
	</td>
	<g:isUserCarrier>
	<td>
		<label id="numOfConfirmedContainers">${bookingEquipment.numOfConfirmedContainers}</label>	</td>
	</g:isUserCarrier>
	<td>
		<label id="transServ">${bookingEquipment.transportationService.name}</label>	</td>
	<td>
		<label id="equipmentProvider">${bookingEquipment.equipmentProvider.name}</label>	
	</td>
	<td>
		<label id="comments">${bookingEquipment.comments}</label>	
	</td>
</tr>
			