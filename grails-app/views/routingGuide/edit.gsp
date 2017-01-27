

<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${routingGuideInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${routingGuideInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<div class="content_inner">
					<label class="pagetitle">${warehouse.message(code: 'default.button.editRoutingGuide.label', default: 'Edit Routing Guide')}</label>
				</div>
            	<fieldset>
            		 <g:hiddenField name="id" value="${routingGuideInstance?.id}" />
	                <g:hiddenField name="version" value="${routingGuideInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        	  <g:render template='form' model="[routingGuideInstance:routingGuideInstance]"/>
	                    		 <tr>
	                        		<table>
		                    		 	<div>
											<label class="section-header" for='carriers'>
												<warehouse:message code="default.carriers.label" default="Carriers"/>
											</label>
										</div>
										<thead>
											<tr id="carrierHead">
												<th/>
												<th>
													Carrier
												</th>
												<th>
													Carrier Priority
												</th>
												<th>
													Equipment
												</th>
												<th>
													Mode
												</th>
												<th>
													Temperature control
												</th>
												<th>
													Service Level
												</th>
												<th>
													Frequency
												</th>
												<th>
													Commitment
												</th>
												<th>
													Capacity
												</th>
												<th>
													Surge Capacity
												</th>
											</tr>
									</thead>
									<tbody id="carrierBody">
										 <g:if test="${routingGuideInstance?.routingGuideCarrierList?.size() > 0}">	          					
				          					<g:render template='routingGuideCarrier' collection="${routingGuideInstance?.routingGuideCarrierList}" var="routingGuideCarrier" model="['i':routingGuideCarrier?.id]"/>
										</g:if>
										<div>
										<g:render template='routingGuideCarrier' model="['routingGuideCarrier':null,'i':'_clone','hidden':true]"/>
										</div>	
									</tbody>
									</table>
								</tr>
		      					<tr>
									<td id="addCarrier">
											<button name="addCarrier" id="addCarrierBtn" type="button">Add Carrier</button>
									</td>
								</tr>
	                    
		                        <tr class="prop">
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
            
<div id="dialog-form-carrier" title="Add/Edit Carriers">
	<form id="addCarrierForm">
	<table>
	<tr id="addCarrierRow">
		<td>
			<g:hiddenField name="routingGuide.id" value="${routingGuideInstance?.id}" id="routingGuideId"/>
			<g:hiddenField name="id" value="${id}" id="id"/>
			<label>Carrier ID</label>
		</td>
		<td>
			<g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${routingGuideCarrier?.carrier?.id }"
										valueName="${routingGuideCarrier?.carrier?.companyName }"
										styleClass="text" width="175" />
		</td>
	</tr>
	<tr>		
		<td valign="top" class="name">
	        <label for="carrierPriority"><warehouse:message code="routingGuide.carrierPriority.label" default="Carrier Priority" /></label>
	    </td>
	    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'carrierPriority', 'errors')}">
	        <g:textField name="carrierPriority" value="${fieldValue(bean: routingGuideCarrier, field: 'carrierPriority')}" />
	    </td>
	</tr>
	
	<tr>
		<td>
			<label>Equipment</label>
		</td>
		<td>
			<g:select name="equipment.id" id="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value=""  noSelection="['null': '']"  />
		</td>
	</tr>
	<tr>
		<td>
			<label>Mot</label>
		</td>
		<td>
			<g:select name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${routingGuideCarrier?.mot?.id}" noSelection="['null': '']"  />
   		</td>
	</tr>
	<tr>
		<td valign="top" class="name">
        	<label for="tempCtrl"><warehouse:message code="routingGuide.tempCtrl.label" default="Temp control" /></label>
    	</td>
	    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'tempCtrl', 'errors')}">
	        <g:selectTempCtrl name="tempCtrl.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${routingGuideCarrier?.tempCtrl?.id}" noSelection="['null': '']" />
	    </td>
	</tr>
	<tr>
		 <td valign="top" class="name">
	        <label for="serviceLevel"><warehouse:message code="routingGuideCarrier.serviceLevel.label" default="Service Level" /></label>
	    </td>
	    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'serviceLevel', 'errors')}">
	        <g:selectSL name="serviceLevel.id" value="${routingGuideCarrier?.serviceLevel?.id}" noSelection="['null': '']"  />
	    </td>
	</tr>
	<tr>
		 <td valign="top" class="name">
	        <label for="absOrPercent"><warehouse:message code="routingGuideCarrier.absOrPercent.label" default="Commitment Unit" /></label>
	    </td>
	    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'absOrPercent', 'errors')}">
	        <g:select name="absOrPercent" value="${routingGuideCarrier?.absOrPercent}" from="['ABSOLUTE','PERCENTAGE']" noSelection="['null': '']"  />
	    </td>
	</tr>
	
	<tr>
    <td valign="top" class="name">
        <label for="commitmentFrequency"><warehouse:message code="routingGuide.commitmentFrequency.label" default="Commitment Frequency" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'commitmentFrequency', 'errors')}">
        <g:selectFreq name="frequency.id" value="${routingGuideCarrier?.frequency?.id}" noSelection="['null': '']" />
    </td>
    </tr>
	<tr>
    <td valign="top" class="name">
        <label for="commitmentValue"><warehouse:message code="routingGuide.commitmentValue.label" default="Commitment Value" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'commitmentValue', 'errors')}">
        <g:textField name="commitmentValue" value="${fieldValue(bean: routingGuideCarrier, field: 'commitmentValue')}" />
    </td>
    </tr>
    <tr>
		<td valign="top" class="name">
	        <label for="capacityValue"><warehouse:message code="routingGuideCarrier.capacityValue.label" default="Capacity Value" /></label>
	    </td>
	    <td valign="top" class="value ${hasErrors(bean: routingGuideCarrier, field: 'capacityValue', 'errors')}">
	        <g:textField name="capacityValue" value="${fieldValue(bean: routingGuideCarrier, field: 'capacityValue')}" />
	    </td>
    </tr>
	</table>
	</form>
</div>
            
            <script>
             $( "#addCarrierBtn" ).click(function() {

				  // $("#dialog-form-carrier input[name='mot']").val("");
			     //  var equiptypeStr = "#dialog-form-carrier select[name='equipment.id'] option[selected='selected']";
		          // $(equiptypeStr).removeAttr("selected");
				 
				$( "#dialog-form-carrier" ).dialog( "open" );
			  });
	  
            
	   //Add form for booking equipment
	  $( "#dialog-form-carrier" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      buttons: {
		"Save": function() {
			console.log($('#addCarrierForm').serialize());
			var url;
			var addOrUpdate;
			if ($("#addCarrierForm input[name='id']").val() )
			{
				url = "/cimbidiaSCM/routingGuide/updateRoutingGuideCarrier";
				addOrUpdate = false;
			}
			else
			{
				url = "/cimbidiaSCM/routingGuide/saveRoutingGuideCarrier"
				addOrUpdate = true;
			}
		  	$.ajax({
					url: url,
					type: "POST",
					data: $('#addCarrierForm').serialize(),
					success: function(data) {
						refreshCarriers(data,addOrUpdate);

					},
					error: function(xhr, textStatus, error){
					   //whatever you need to do here - output errors etc
					   //alert( 'Bobbbbbb' + error);
					   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					}
        		});	
        		
        	 	$( "#dialog-form-carrier" ).dialog( "close" );
			},
			Cancel: function() {
			  $( "#dialog-form-carrier" ).dialog( "close" );
			}
	      },
	      close: function() {
			$(".dialogFields").val( "" ).removeClass( "ui-state-error" );
	      }
	    });

	function refreshCarriers(data, addOrUpdate)
	{
		console.log(data);
		var carrierRow;
		if(addOrUpdate)
		{
			var carrierClone = $("#carrierRow_clone").clone();
			//alert('carrierclone='+carrierClone);
			$(carrierClone).removeAttr("style");
			//alert('id='+data.routingGuideCarrierId);
			//alert('carr id='+data.carrier);
						
			//set values of fields in row
			$(carrierClone).find("#routingGuideCarrierId").text(data.routingGuideCarrierId)
			$(carrierClone).find("#carrier").text(data.carrier)
			$(carrierClone).find("#carrierPriority").text(data.carrierPriority)
			if(data.mot)
			{
				$(carrierClone).find("#mot").text(data.mot)
			}
			if(data.equipment)
			{
				$(carrierClone).find("#equipment").text(data.equipment)
			}
			if(data.tempCtrl)
			{
				$(carrierClone).find("#tempCtrl").text(data.tempCtrl)
			}
			if(data.serviceLevel)
			{
				$(carrierClone).find("#serviceLevel").text(data.serviceLevel)
			}
			if(data.frequency)
			{
				$(carrierClone).find("#frequency").text(data.frequency)
			}
			if(data.commitmentValue)
			{
				$(carrierClone).find("#commitmentValue").text(data.commitmentValue)
			}
			if(data.capacityValue)
			{
				$(carrierClone).find("#capacityValue").text(data.capacityValue)
			}
			var hrefval= "/cimbidiaSCM/routingGuide/deleteRoutingGuideCarrier?routingGuideCarrier.id="+data.routingGuideCarrierId
			$(carrierClone).find("#deleteCarrierLink").attr("href", hrefval)
			
			$(carrierClone).find("#editCarrierLink").attr("carrierId", data.routingGuideCarrierId)
			
			//append row to table
			$("#carrierBody").append(carrierClone);
		}
		else
		{
			//alert('in update' +data.id);
			 //carrierRow = $("tr[equipId="+data.id+"]");
			 //var updatedRow = updateRowFields(carrierRow, data, addOrUpdate);
			 

		}
	} 
	
		$(document).on("click", "#equipmentRow a[funct='openEditCarrierLink']", function() {
		var carrierId = $(this).attr('carrierId');
        $.ajax({
            url:'/cimbidiaSCM/routingGuide/getRoutingGuideCarrier',
            data: { id : carrierId },
            success: function(data){
            	//alert('in success' + data.numOfContainers);
               $("#dialog-form-carrier input[name='numOfContainers']").val(data.numOfContainers);
               $("#dialog-form-carrier input[name='numOfConfirmedContainers']").val(data.numOfConfirmedContainers);
               $("#dialog-form-carrier input[name='booking.id']").val(data.bookingId);
               $("#dialog-form-carrier input[name='id']").val(data.id);
                $("#dialog-form-carrier input[name='comments']").val(data.comments);
				
               var equiptypeStr = "#dialog-form-equipment select[name='equipmentType.id'] option[value='"+data.equipmentTypeId+"']";
               $(equiptypeStr).attr("selected","selected");
 			 
 			 	var transportationServiceStr = "#dialog-form-equipment select[name='transportationService.id'] option[value='"+data.transportationServiceId + "']";
               $(transportationServiceStr).attr("selected","selected");
               
               var equipmentProviderStr = "#dialog-form-equipment select[name='equipmentProvider.id'] option[value='"+data.equipmentProviderId + "']";
               $(equipmentProviderStr).attr("selected","selected");
          
               $("#dialog-form-equipment").dialog("open");
            }
        });
    });
    
	
            </script>
        </div>
	</body>
</html>
