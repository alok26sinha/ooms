<tr <g:if test="${hidden}">style="display:none;"</g:if> id="carrierRow${i}" class="odd" carrierId="${ratingLaneCar?.id}" >
	<td>
		
		<g:link controller="ratingLaneCarrier" action="show" id="${ratingLaneCar?.id}">
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></g:link>
	</td>
	<g:if test="${fromPage}">
	<td>
	<label id="carrierPriority">${ratingLaneCar?.routingGuide.id}</label>
	</td>
	</g:if>
	<td>
		<g:hiddenField id="ratingLaneCarrierId" name="ratingLaneCarrier.id" value="${ratingLaneCar?.id}"/>
		<label id="carrier">${ratingLaneCar?.carrier?.companyName}</label>
 	</td>	              
     <td>
        <label id="secondaryCarrier">${ratingLaneCar?.secondaryCarrier}</label>
    </td>
    <td>
        <label id="mot">${ratingLaneCar?.mot?.description}</label>
    </td>
    
    <td>
        <label id="tempCtrl">${ratingLaneCar?.tempCtrl?.name}</label>
    </td>
    <td>
        <label id="serviceLevel">${ratingLaneCar?.serviceLevel?.name}</label>
    </td>
    
    <td>
        <label id="frequency">${ratingLaneCar?.frequency?.name}</label>
    </td>
    
    <td>
        <label id="equipment">${ratingLaneCar?.equipment}</label>
    </td>
    
     <td>
        <label id="payee">${ratingLaneCar?.payee}</label>
    </td>
    <td>
        <label id="rate">${ratingLaneCar?.rate}</label>
    </td>
    <td>
        <label id="totalCost">${ratingLaneCar?.totalCost}</label>
    </td>
    
</tr> 