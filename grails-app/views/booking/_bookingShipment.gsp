

<tr id="shipmentRow" class="odd" shipId="${bookingShipment.id}" >
	<td>
		<a href="/cimbidiaSCM/booking/deletebookingShipment?bookingInstance.id=${bookingShipment?.booking?.id}&bookingShipment.id=${bookingShipment?.id}"	disabled="true" id="deleteShipLink" >
			<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
		<a href="#"	funct="openEditShipLink" shipId="${bookingShipment.id}" id="editShipLink">
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>
	</td>
	
	<td align="center" style="border:2px solid white !important;">
														<g:if test="${bookingShipment?.shipment?.weight == 0}">
														</g:if>
								           				<g:else>
															${fieldValue(bean: bookingShipment?.shipment, field: "weight")}  
														</g:else>	
														</td>
														<td align="center" style="border:2px solid white !important;">	
														<g:if test="${bookingShipment?.shipment?.volume == 0}">
														</g:if>
								           				<g:else>
															${fieldValue(bean: bookingShipment?.shipment, field: "volume")}  
														</g:else>											
														</td>
														<td align="center" style="border:2px solid white !important;">												
														<g:if test="${bookingShipment?.shipment?.quantity == 0}">
														</g:if>
								           				<g:else>
															${fieldValue(bean: bookingShipment?.shipment, field: "quantity")}  
														</g:else>	 						
														</td>
														<td align="center" style="border:2px solid white !important;">
														${bookingShipment?.shipment?.mot?.code}
														</td>
														<td align="center" style="border:2px solid white !important;">
															${fieldValue(bean: bookingShipment?.shipment, field: "shipStatus")} 
														</td>
														
														
										
	<%--<td>
	<td class="left shipment-name" style="border:2px solid white !important;">
								
								                       <g:hiddenField action="show" controller="shipment" id="${bookingShipment?.shipment?.id}">
								                           ${fieldValue(bean: bookingShipment?.shipment, field: "shipmentNumber")}
								                           </g:link></td>
														<td align="center" style="border:2px solid white !important;">
		<g:hiddenField id="shipid" name="bookingShipment.id" value="${bookingShipment.id}"/>
		<label id="shipmentTypeCode">${bookingShipment.shipmentType.code}</label>
 	</td>
	<td>
		<label id="shipmentTypeDescription">${bookingShipment.shipmentType.description}</label>
	</td>
	<td>
		<label id="numOfContainers">${bookingShipment.numOfContainers}</label>
	</td>
	<g:isUserCarrier>
	<td>
		<label id="numOfConfirmedContainers">${bookingShipment.numOfConfirmedContainers}</label>	</td>
	</g:isUserCarrier>
	<td>
		<label id="transServ">${bookingShipment.transportationService.name}</label>	</td>
	<td>
		<label id="shipmentProvider">${bookingShipment.shipmentProvider.name}</label>	
	</td>
	<td>
		<label id="comments">${bookingShipment.comments}</label>	
	</td>
--%></tr>
			