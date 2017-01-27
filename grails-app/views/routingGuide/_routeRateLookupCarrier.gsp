<tr id="carrierRow${i}" carrierId="${routingGuideCarrier?.id}" >
	<td/>
	<td>
        <label id="carrierPriority">${routingGuideCarrier?.carrierPriority}</label>
    </td>
	<td>
		<g:hiddenField id="routingGuideCarrierId" name="routingGuideCarrier.id" value="${routingGuideCarrier?.id}"/>
		<label id="carrier">${routingGuideCarrier?.carrier?.companyName}</label>
 	</td>	              
    
 </tr> 