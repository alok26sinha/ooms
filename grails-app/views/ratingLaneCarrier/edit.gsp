
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneCarrier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
		
		<script type="text/javascript">

		function show_ltlDiv(id)
		{
			
			 if(id == '12'){
				
				$("#ltlHead").show();
				$("#ltlBody").show();
				$("#ltlSection").show();
				$("#addLtl").show();
			 }
			 else {
				 $("#ltlHead").hide();
				 $("#ltlBody").hide();
				 $("#ltlSection").hide();
				 $("#addLtl").hide();
			}
		}

		



		$(document).ready(function() {
		  
			var id = ${ratingLaneCarrierInstance?.mot?.id};
			if(id == '12'){
				
				$("#ltlHead").show();
				$("#ltlBody").show();
				$("#ltlSection").show();
				$("#addLtl").show();
			 }
			 else {
				 $("#ltlHead").hide();
				 $("#ltlBody").hide();
				 $("#ltlSection").hide();
				 $("#addLtl").hide();
			}
		   
		});
		</script>
		
  
    </head>
    <body onload="showLtl()">
        <div class="body">
        <script type="text/javascript">
    
        </script>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ratingLaneCarrierInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${ratingLaneCarrierInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${ratingLaneCarrierInstance?.id}" />
	                <g:hiddenField name="version" value="${ratingLaneCarrierInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                         <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label style="white-space: nowrap;text-align: left ; padding:0px;" for="carrier"><warehouse:message code="ratingLaneCarrier.carrier.label" default="Carrier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'carrier', 'errors')}">
	                                    <g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${ratingLaneCarrierInstance?.carrier?.id }"
										valueName="${ratingLaneCarrierInstance?.carrier?.companyName }"
										styleClass="text" width="175" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label style="white-space: nowrap;text-align: left ; padding:0px;" for="mot"><warehouse:message code="ratingLaneCarrier.mot.label" default="Mot" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'mot', 'errors')}">
	                                    <g:select style="width:290px;" name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.mot?.id}" noSelection="['null': '']" onchange="show_ltlDiv(this.value)"  />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="equipment"><warehouse:message code="ratingLaneCarrier.equipment.label" default="Equipment" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'equipment', 'errors')}">
	                                    <g:select style="width:140px;" name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.equipment?.id}" noSelection="['null': '']" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="tempCtrl"><warehouse:message code="ratingLaneCarrier.tempCtrl.label" default="Temp Ctrl" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'tempCtrl', 'errors')}">
	                                    <g:selectTempCtrl style="width:290px;" name="tempCtrl.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.tempCtrl?.id}" noSelection="['null': '']" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="serviceLevel"><warehouse:message code="ratingLaneCarrier.serviceLevel.label" default="Service Level" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'serviceLevel', 'errors')}">
	                                    <g:selectSL style="width:290px;" name="serviceLevel.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.serviceLevel?.id}" noSelection="['null': '']" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="cost"><warehouse:message code="ratingLaneCarrier.cost.label" default="Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'cost', 'errors')}">
	                                    <g:textField name="cost" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'cost')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="totalCost"><warehouse:message code="ratingLaneCarrier.totalCost.label" default="Total Cost" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'totalCost', 'errors')}">
	                                    <g:textField style="width:285px;" name="totalCost" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'totalCost')}" />
	                                </td>
	                         
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="secondaryCarrier"><warehouse:message code="ratingLaneCarrier.secondaryCarrier.label" default="Secondary Carrier" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'secondaryCarrier', 'errors')}">
	                                    <g:autoSuggest id="secondaryCarrier" name="secondaryCarrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${ratingLaneCarrierInstance?.secondaryCarrier?.id }"
										valueName="${ratingLaneCarrierInstance?.secondaryCarrier?.companyName }"
										styleClass="text" width="175" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="contractNumber"><warehouse:message code="ratingLaneCarrier.contractNumber.label" default="Contract Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'contractNumber', 'errors')}">
	                                    <g:textField name="contractNumber" value="${ratingLaneCarrierInstance?.contractNumber}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                               
	                               <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="tariff"><warehouse:message code="ratingLaneCarrier.tariff.label" default="Tariff" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'tariff', 'errors')}">
	                                    <g:select name="tariff.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.tariff?.id}" noSelection="['null': '']" />
	                                </td>
	                               
	                                
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="rateUnit"><warehouse:message code="ratingLaneCarrier.rateUnit.label" default="Rate Unit" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rateUnit', 'errors')}">
	                                    <g:selectRateUnit  style="width:290px;" name="rateUnit.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.rateUnit?.id}" noSelection="['null': '']" />
	                                </td>
	                            	<td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="minRate"><warehouse:message code="ratingLaneCarrier.minRate.label" default="Min Rate" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'minRate', 'errors')}">
	                                    <g:textField name="minRate" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'minRate')}" />
	                                </td>
	                                
	                            </tr>
	                        
	                            <tr class="prop">
	                            	<td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="payee"><warehouse:message code="ratingLaneCarrier.payee.label" default="Payee" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'payee', 'errors')}">
	                                    <g:select name="payee.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.payee?.id}" noSelection="['null': '']" />
	                                </td>
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="minDistance"><warehouse:message code="ratingLaneCarrier.minDistance.label" default="Min Distance" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'minDistance', 'errors')}">
	                                    <g:textField style="width:285px;" name="minDistance" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'minDistance')}" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label style="white-space: nowrap;text-align: left ; padding:0px;"  for="supportsMultiStop"><warehouse:message code="ratingLaneCarrier.supportsMultiStop.label" default="Supports Multi Stop" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'supportsMultiStop', 'errors')}">
	                                    <g:checkBox name="supportsMultiStop" value="${ratingLaneCarrierInstance?.supportsMultiStop}" />
	                                </td>
	                           
	                                
	                            </tr>
	                        
	                            <tr class="prop">
	                                
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="frequency"><warehouse:message code="ratingLaneCarrier.frequency.label" default="Frequency" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'frequency', 'errors')}">
	                                    <g:selectFreq  style="width:290px;" name="frequency.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.frequency?.id}" noSelection="['null': '']" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="modifReasonCode"><warehouse:message code="ratingLaneCarrier.modifReasonCode.label" default="Modif Reason Code" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'modifReasonCode', 'errors')}">
	                                    <g:selectModifReason style="width:290px;"  name="modifReasonCode.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.modifReasonCode?.id}" noSelection="['null': '']" />
	                                </td>
	                                
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="surgeRate"><warehouse:message code="ratingLaneCarrier.surgeRate.label" default="Surge Rate" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'surgeRate', 'errors')}">
	                                    <g:checkBox name="surgeRate" value="${ratingLaneCarrierInstance?.surgeRate}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="comments"><warehouse:message code="ratingLaneCarrier.comments.label" default="Comments" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'comments', 'errors')}">
	                                    <g:textField style="width:285px;" name="comments" value="${ratingLaneCarrierInstance?.comments}" />
	                                </td>
	                            
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="currency"><warehouse:message code="ratingLaneCarrier.currency.label" default="Currency" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'currency', 'errors')}">
	                                    <g:selectPUOM style="width:290px;"  name="currency.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.currency?.id}"  />
	                                </td>
	                             
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="rate"><warehouse:message code="ratingLaneCarrier.rate.label" default="Rate" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rate', 'errors')}">
	                                    <g:textField name="rate" value="${fieldValue(bean: ratingLaneCarrierInstance, field: 'rate')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label style="white-space: nowrap;text-align: left ; padding:0px;"  for="rateType"><warehouse:message code="ratingLaneCarrier.rateType.label" default="Rate Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'rateType', 'errors')}">
	                                    <g:selectRateType style="width:290px;"  name="rateType.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${ratingLaneCarrierInstance?.rateType?.id}"  />
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label  style="white-space: nowrap;text-align: left ; padding:0px;" for="ratingLaneAccessorialList"><warehouse:message code="ratingLaneCarrier.ratingLaneAccessorialList.label" default=" Accessorial List" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneCarrierInstance, field: 'ratingLaneAccessorialList', 'errors')}">
	                                    
	                                </td>
	                            </tr>
	                        
	                            
	                        	 <tr>
	                        	<td colspan="6">
	                        	<table>
		                    		 	<div id="ltlSection">
											<label class="section-header" for='carriers'>
												<warehouse:message code="default.carrierss.label" default="LTL Rates"/>
											</label>
										</div>
										<thead  id="ltlHead">
											<tr id="carrierHead">
												<th/>
											
												<th>
													Class
												</th>
												<th>
													Rate
												</th>
												<th>
													Source Zone
												</th>
												<th>
													Destination Zone
												</th>
												
											</tr>
									</thead>
									<tbody id="ltlBody">
								
										 <g:if test="${ratingLaneCarrierInstance?.ratingLaneltlRatesList?.size() > 0}">	          					
				          					<g:render template='ratingLaneLtlRate' collection="${ratingLaneCarrierInstance?.ratingLaneltlRatesList}" var="ratingLaneltlRates" model="['i':ratingLaneltlRates?.id]"/>
										</g:if>
										<div>
										<g:render template='ratingLaneLtlRate' model="['ratingLaneltlRates':null,'i':'_clone','hidden':true]"/>
										</div>	
									</tbody>
									</table>
									</td>
	                        	</tr>
	                        	<tr>
									<td colspan="2" id="addLtl">
											<g:link controller="ratingLaneLtlRates" action="create" params="['ratingLaneCarrier.id': ratingLaneCarrierInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLane Rate')])}</g:link>
	                                   
									</td>
								</tr>                       
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						                </div>
		    						</td>                    	
	                        	</tr>	                        
	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
