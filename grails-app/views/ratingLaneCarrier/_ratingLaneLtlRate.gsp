<tr <g:if test="${hidden}">style="display:none;"</g:if> id="carrierRow${i}" class="odd" carrierId="${ratingLaneltlRates?.id}" >
	<td>
		
		<g:link controller="ratingLaneLtlRates" action="show" id="${ratingLaneltlRates?.id}">
			<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></g:link>
	</td>

	              
     
     <td>
        <label id="payee">${ratingLaneltlRates?.ltlClass}</label>
    </td>
    
   
    
    
    <td>
        <label id="rate">${ratingLaneltlRates?.rate}</label>
    </td>
   
    <td>
        <label id="fromZone">${ratingLaneltlRates?.fromZone}</label>
    </td>
     <td>
        <label id="toZone">${ratingLaneltlRates?.toZone}</label>
    </td>
    
</tr> 