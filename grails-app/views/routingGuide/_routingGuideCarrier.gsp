<tr <g:if test="${hidden}">style="display:none;"</g:if> id="carrierRow${i}" class="odd" carrierId="${routingGuideCarrier?.id}" >
	<td>
		<a href="/cimbidiaSCM/routingGuide/deleteRoutingGuideCarrier?routingGuideInstance.id=${routingGuideCarrier?.routingGuide?.id}&routingGuideCarrier.id=${routingGuideCarrier?.id}"	disabled="true" id="deleteCarrierLink" >
			<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
		<a href="#"	funct="openEditCarrierLink" carrierId="${routingGuideCarrier?.id}" id="editCarrierLink">
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>
	</td>
	<g:if test="${fromPage}">
	<td>
	<label id="carrierPriority">${routingGuideCarrier?.routingGuide.id}</label>
	</td>
	</g:if>
	<td>
		<g:hiddenField id="routingGuideCarrierId" name="routingGuideCarrier.id" value="${routingGuideCarrier?.id}"/>
		<label id="carrier">${routingGuideCarrier?.carrier?.companyName}</label>
 	</td>	              
    <td>
        <label id="carrierPriority">${routingGuideCarrier?.carrierPriority}</label>
    </td>
    <td>
        <label id="mot">${routingGuideCarrier?.mot?.description}</label>
    </td>
    <td>
        <label id="equipment">${routingGuideCarrier?.equipment?.name}</label>
    </td>
    <td>
        <label id="tempCtrl">${routingGuideCarrier?.tempCtrl?.name}</label>
    </td>
    <td>
        <label id="serviceLevel">${routingGuideCarrier?.serviceLevel?.name}</label>
    </td>
    
    <td>
        <label id="frequency">${routingGuideCarrier?.frequency?.name}</label>
    </td>
    <td>
        <label id="commitmentValue">${routingGuideCarrier?.commitmentValue}</label>
    </td>
    <td>
        <label id="capacityValue">${routingGuideCarrier?.capacityValue}</label>
    </td>
    <td>
        <label id="surgeCapacities"><a href="openSurgeCapacityForm()"/>Add Surge Capacity</a></label>
    </td>
</tr> 