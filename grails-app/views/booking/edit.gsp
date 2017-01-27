
<%@ page import="com.cimbidia.wm.booking.Booking" %>
<%@ page import="com.cimbidia.wm.booking.BookingStatus" %>
<%@ page import="com.cimbidia.wm.booking.BookingEquipment" %>
<%@ page import="grails.converters.JSON" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'booking.label', default: 'Booking')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
	
	<script type="text/javascript">

		function addId(id)
		{
			
			document.getElementById("selectedCheck").value += ","+id;
		}
		function clearId()
		{
			document.getElementById("selectedCheck").value ="";
		}
		
		</script>
    </head>
    <body onload="clearId()">
    	<div class="boostrap">
    		<%--<div class="title">
				<h3>${warehouse.message(code: 'bookingEdit.label', default: 'Edit Booking')}</h3>
			</div>
        --%><div class="body">
        <div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Edit Booking"/></label>

		</div>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bookingInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${bookingInstance}" as="list" />
	               
	            </div>
            </g:hasErrors>
             <g:hasErrors bean="${cmd}">
	            <div class="errors">
	                 <g:renderErrors bean="${cmd}" as="list" />
		            </div>
            </g:hasErrors>
            
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${bookingInstance?.id}" />
	                <g:hiddenField name="version" value="${bookingInstance?.version}" />
	                <g:hiddenField name="fromPage" value="edit"/>
	                <g:hiddenField id="isCarrier" name="isCarrier" value="false"/>
	                <input type="hidden" name="selectedCheck" id="selectedCheck">
	                <input type="hidden" name="booking.id" id="booking.id" value="${ bookingInstance.id}">
	                
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <g:render template='form' model="[bookingInstance:bookingInstance]"/>
	                           
	                        	
	                            <tr>
                            		<table>
                            			<caption>
	                            			<div class="title left">
												<h4>${warehouse.message(code: 'booking.equipmentList.label', default: 'Equipments')}</h4>
											</div>
										</caption>
                            		
											<thead>
												<tr id="equipmentHead">
													<th/>
													<th align="center">
														Equipment Type
													</th>
													<th align="center">
														Equipment Description
													</th>
													<th align="center">
														# of containers
													</th>
													<g:isUserCarrier>
														<th align="center">
															# of confirmed containers
														</th>
														<script>
														$("#isCarrier").attr("value","true");
														</script>
													</g:isUserCarrier>
													<th align="center">
														Transportation Service
													</th>
													<th align="center">
														Equipment Provider
													</th>
													<th align="center">
														Comments
													</th>
												</tr>
											</thead>
											<tbody id="equipmentBody">
											 <g:if test="${bookingInstance?.bookingEquipmentList?.size() > 0}">
	                							<g:render template='bookingEquipment' collection="${bookingInstance?.bookingEquipmentList}" var="bookingEquipment" model="['i':i]"/>
											</g:if>
											</tbody>
										</table>
									</tr>
									<tr>
									<td id="addEquipment">
											<button name="addEquipment" id="addEquipmentBtn" type="button">Add Equipment</button>
									</td>
									</tr>
									
									 <tr>
									
                            		<table>
                            			<caption>
	                            			<div class="title left">
												<h4>${warehouse.message(code: 'booking.shipmentList.label', default: 'Shipment')}</h4>
											</div>
										</caption>
                            		
											<thead>
												<tr id="shipmentHead">
													<th><input type="checkbox" id="selectall"/> &nbsp; Select All</th>
													<th align="center">
														Shipment Number
													</th>
													<th align="center">
														Total Weight (Lbs)
													</th>
													<th align="center">
														Total Volume (Cubic Feet)
													</th>
													<th align="center">
														Total Quantity (Pallets)
													</th>
													
													<th align="center">
														Mode
													</th>
													<th align="center">
														Shipment Status
													</th>
													
												</tr>
											</thead>
											<tbody id="shipmentbody">
											
											<g:if test="${bookingInstance.bookingShipmentList != null}">
												<g:each var="bookingShipment" in="${bookingInstance.bookingShipmentList}" status="i">
													<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">      
														<td style="border:2px solid white !important;">
														<input type="checkbox" name="shipmentCheck"  class="checkForId" id="${bookingShipment?.id?.encodeAsHTML()}"
																	 onclick="addId('${bookingShipment?.id}')" />
														</td>	
														<td class="left shipment-name" style="border:2px solid white !important;">
								
								                       <g:link action="show" controller="shipment" id="${bookingShipment?.shipment?.id}">
								                           ${fieldValue(bean: bookingShipment?.shipment, field: "shipmentNumber")}
								                           </g:link></td>
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
														
														
														
														
														</tr>
										</g:each> 
								</g:if>
								<g:elseif test="${shipments?.size() == 0}"> 
									<table><tr><td>No Records Found</td></tr></table>
					  			</g:elseif>
											</tbody>
										</table>
									</tr>
									
									<tr valign="top"><table><tr>
									<td id="addShipment">
											<button name="addShipment" id="addShipmentBtn" type="button">Add Shipment</button>
											
											
											<g:actionSubmit  style="height: 25px; top: -15px; vertical-align: top; text-transform: none; border-radius: 0px;" action="deleteBookingShipment"  value="${warehouse.message(code: 'default.button.deleted.label', default: 'Delete Shipment')}" />
									</td></tr></table>
									</tr>
									
	                            <tr>
	                                <td valign="top" class="value ${hasErrors(bean: bookingInstance, field: 'referenceList', 'errors')}">
	                                  
										<ul>
											<div  class="list">
											<table>
											
												<caption>
													<div class="title left">
														<h4>${warehouse.message(code: 'booking.referenceList.label', default: 'Reference Numbers')}</h4>
													</div>
												</caption>
												<thead>
													<tr id="refNumHead">
														<th/>
														<th>
															Reference Type
														</th>
														<th>
															Reference Number
														</th>
													</tr>
												</thead>
												<tbody id="referenceBody">
												  	<g:if test="${bookingInstance?.referenceList?.size() > 0}">
														<g:render template='reference' collection="${bookingInstance?.referenceList}" var="bookingReference"/>
													</g:if>
												</tbody>
											</table>
											</div>
										</ul>
										
										<div id="addReference">
											<button name="addReference" id="addReferenceBtn" type="button">Add Reference</button>
										</div>
										
	                                </td>
	                            </tr>
	                            
	                            <table>
	                              <g:render template='voyage' model="[bookingInstance:bookingInstance]"/>
	                        	</table>
	                        	              <div><label class="section-header"><warehouse:message code="shiping.trackingMsg.label" default="Line Items"/></label></div>	
		               </td></tr></table>
		               <table>										
						<tr class="prop">
							
						   <td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.carrier.label" default="Carrier" /></label>
							</td>
						   	<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgType.label" default="Message Type" /></label>
							</td>
							<td valign="top" class="dtl-header">
						      <label><warehouse:message code="shipping.stopno.label" default="Stop" /></label>
						   	</td>
						   	<td valign="top" class="dtl-header">
						      <label><warehouse:message code="shipping.vehicle.label" default="Vehicle" /></label>
						   	</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgDate.label" default="Message Date" /></label>
							</td>
							
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.comments.label" default="Comments" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.createdDate.label" default="Created Date" /></label>
							</td>
		
							</tr> 
							<g:if test="${bookingInstance.trackingMsgs?.size() != 0}">
							<g:each var="trackingMsg" in="${bookingInstance.trackingMsgs}" status="i">
							<tr id="trackingMsg${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>${trackingMsg?.carrier?.companyName}</td>
    						<td>${trackingMsg?.msgType}</td>
    						<td>${trackingMsg?.stopType }</td>
    						<td>${trackingMsg?.vehicle}</td>
    						<td>${trackingMsg?.msgDate?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${trackingMsg?.comments}</td>
    						<td>${trackingMsg?.createdDate?.format('MM/dd/yyyy HH:mm')}</td>
    						
        					</tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${bookingInstance.trackingMsgs?.size() == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
					  		<tr>
					  		<td></td><td></td><td></td><td></td><td></td>
					  		<td><div class="dtl-small">
									<a href="javascript:void(0);" id="${bookingInstance.id}" class="open-trackingDialog"><label>Add</label></a>
								</div></td>
					  		</tr>
							</table>
							                     
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="btn" action="update" btnPress="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:if test="${bookingInstance?.bookingStatus == BookingStatus.NEW || bookingInstance?.bookingStatus == BookingStatus.REJECTED}">
						                    	<g:actionSubmit class="submitToCarrier" btnPress="submitToCarrier" action="submitToCarrier" value="${warehouse.message(code: 'default.button.submitToCarrier.label', default: 'submitToCarrier')}" />
						                    </g:if>
						                    <g:if test="${bookingInstance?.bookingStatus == BookingStatus.REQUESTED || bookingInstance?.bookingStatus == BookingStatus.AMMENDED}">
							                    <g:actionSubmit class="btn" action="accept" btnPress="accept" value="${warehouse.message(code: 'default.button.accept.label', default: 'Accept')}" />
							                    <g:actionSubmit class="btn" action="reject" btnPress="reject" value="${warehouse.message(code: 'default.button.counter.label', default: 'Counter')}" />
						                    </g:if>
						                    <g:isUserAdmin>
						                    	<g:actionSubmit class="btn" action="delete" btnPress="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						                	</g:isUserAdmin>
						                </div>
		    						</td>                    	
	                        	</tr>	                        
	                        </tbody>
	                    </table>
	                </div>
	    
		
                </fieldset>
            </g:form>
        </div>
<div id="dialog-form-reference" title="Add/Edit Booking Reference">
	<form id="addReferenceForm">
	<table>
		<tr id="referenceRow">
			<td>
				<g:hiddenField name="booking.id" value="${bookingInstance?.id}" id="refNumbookingId"/>
				<g:hiddenField name="id" value="${id}" id="id"/>
				<label>Reference Type</label>
			</td>
			<td>
				<g:select id="referenceType" name="referenceType" from="${com.cimbidia.wm.booking.ReferenceType}" value=""  noSelection="['':'-Choose Reference Type-']"/>
			</td>
		</tr>
		<tr>
			<td>
			<label>Reference NUmber</label>
			</td>
			<td>
				<g:textField name='referenceNumber' id='referenceNumber' value=""/>
			</td>
		</tr>
	</table>
	</form>
</div>

<div id="dialog-form-shipment" title="Add Booking Shipment">
	<form id="addShipmentForm">
	<table>
	<tr id="addShipmentRow">
		<td>
			<g:hiddenField name="booking.id" value="${bookingInstance?.id}" id="shipbookingId"/>
			<g:hiddenField name="id" value="${id}" id="id"/>
			<label>Shipment ID</label>
		</td>
		
		<td>
			<g:select name="shipment.id" id="shipment.id" from="${com.cimbidia.wm.shipment.Shipment.list()}" optionKey="id" value=""  /><%--
			
			 <g:autoSuggest id="shipment" name="shipment"
										jsonUrl="${request.contextPath }/json/shipmentLookup"
										valueId="${bookingInstance?.bookingShipmentList?.shipment?.id}"
										valueName="${bookingInstance?.bookingShipmentList?.shipment?.shipmentNumber }"
										styleClass="text" width="175" />
			
										
										
		--%></td>
	</tr>
	
	
	
	</table>
	</form>
</div>

<div id="dialog-form-equipment" title="Add/Edit Booking Equipment">
	<form id="addEquipmentForm">
	<table>
	<tr id="addEquipmentRow">
		<td>
			<g:hiddenField name="booking.id" value="${bookingInstance?.id}" id="equipbookingId"/>
			<g:hiddenField name="id" value="${id}" id="id"/>
			<label>Equipment ID</label>
		</td>
		
		<td>
			<g:select name="equipmentType.id" id="equipmentType.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value=""  />
		</td>
	</tr>
	<tr>
		<td>
		<label># Containers</label>
		</td>
		<td>
			<input class="form-control input-sm" type="text" name='numOfContainers' id='numOfContainers' value="${data?.numOfContainers}" />
		</td>
	</tr>
	<g:isUserCarrier>
	<tr>
		<td>
		<label>#Confirmed Containers</label>
		</td>
		<td>
			<input class="form-control input-sm" type="text" name='numOfConfirmedContainers' id='numOfConfirmedContainers' value=""/>
		</td>
	</tr>
	</g:isUserCarrier>
	<tr>
		<td>
		<label>Transportation Service</label>
		</td>
		<td>
			<g:selectTranspService name="transportationService.id" id="transportationService.id" value=""/>
		</td>
	</tr>
	<tr>
		<td>
		<label>Equipment Provider</label>
		</td>
		<td>
			<g:selectEquipProvider name="equipmentProvider.id" id="equipmentProvider.id" value=""/>
		</td>
	</tr>
	<tr>
		<td>
		<label>Comments</label>
		</td>
		<td>
			<input class="form-control input-sm" type="text" name='comments' id='comments' value="" class="text"/>
		</td>
	</tr>
	</table>
	</form>
</div>

  <div id="trackingDialog-form" title="Add Tracking Messages">
        <form id="trackingMsgForm">
        <input type="hidden" name="bookingId" id="bookingId" />
        <table>
        <tr><td><label for="msgType">Message Type</label></td><td><g:select name="msgType" from="${['Arrival', 'Loaded', 'Customs Hold', 'Customs Release',  'Unloaded', 'Departure']}" valueMessagePrefix="msgType" /></td></tr>
        
        <tr><td><label for="stopType">Stop </label></td><td><g:select name="stopType" from="${['Origin' ,'Origin Port','Destination Port','Destination']}"></g:select>
        <tr><td><label for="vehicle">Vehicle</label></td><td><g:select name="vehicle" from="${['Vessel', 'Rail', 'Truck' ]}"></g:select>	 
			</td></tr>
        <tr><td><label for="msgDate">Message Date</label></td><td>
        <input type="text" name="msgDate" id="msgDate" value="">
									<script type="text/javascript">
										$(function(){
										$('*[name=msgDate]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
        <%--<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="msgDate" id="msgDate" value="" format="MM/dd/yyyy" />--%></td></tr>
        <tr><td><label for="comments">Comments</label></td><td><input type="text" name='comments' value="" size="30" /></td></tr>
        </table>
         	
		</form>
	</div>

<script>
$(document).ready(function() {  
	
	$("#selectall").click(function(event) { 
  		
	 	var checkboxVals = new Array();
        if(this.checked) { // check select status
            $('.checkForId').each(function() {  
                this.checked = true; 
               
             	checkboxVals.push(this.id);
			});
		}
	
		else{
            $('.checkForId').each(function() {  
                this.checked = false; 
               
            });     
 			
	    };
	    var ckval = "";
	    for(var i=0; i<checkboxVals.length;i++)
	    {
	    	ckval = ckval +","+checkboxVals[i];
	    }
	   
	    
	    $("#selectedCheck").attr("value", ckval);
	
	});
	
	
	
	//disable fields 
	$("#bookingNumber").attr("disabled", "disabled");
	$("#shipFrom-suggest").attr("disabled", "disabled");
	$("#shipTo-suggest").attr("disabled", "disabled");
	$("#originPort").attr("disabled", "disabled");
	$("#destinationPort").attr("disabled", "disabled");
	$("#carrier").attr("disabled", "disabled");
	
	if($("#isCarrier").attr("value") == "true")
	{
		//disable more fields
		$("input[id^='earliestDepartureDate']").attr("disabled","disabled");
		$("input[id^='mustArriveByDate']").attr("disabled","disabled");
		$("#hazmat").attr("disabled","disabled");
		$("#productClass option:not(:selected)").attr('disabled', true);
        $("#unCode option:not(:selected)").attr('disabled', true);  	
        $("#incoterms option:not(:selected)").attr('disabled', true);	
        $("input[id^='supplier']").attr("disabled","disabled");
        $("input[id^='shipper']").attr("disabled","disabled");
        $("input[id^='customer']").attr("disabled","disabled");
        $("input[id^='consignee']").attr("disabled","disabled");
        $("input[id^='bookingAgent']").attr("disabled","disabled");
        $("#specialHandling option:not(:selected)").attr('disabled', true);	
        
		$("#addEquipmentBtn").attr("disabled","disabled");
		$("#deleteEquipLink").click(function(event) { event.preventDefault()});
	}

 $( "#addShipmentBtn" ).click(function() {
		$( "#dialog-form-shipment" ).dialog( "open" );
	  });
	  
	   //Add form for booking equipment
	  $( "#dialog-form-shipment" ).dialog({
	      autoOpen: false,
	      height: 350,
	      width: 350,
	      modal: true,
	      buttons: {
		"Save": function() {
			console.log($('#addShipmentForm').serialize());
			var url;
			url = "/cimbidiaSCM/booking/saveBookingShipment"
		  	$.ajax({
					url: url,
					type: "POST",
					data: $('#addShipmentForm').serialize(),
					success: function(data) {
						//alert('data' + data);
						//refreshShipments(data);
						window.location = window.location.href;

					},
					error: function(xhr, textStatus, error){
					   //whatever you need to do here - output errors etc
					   //alert( 'Bobbbbbb' + error);
					   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					}
        		});	
        		
        	 	$( "#dialog-form-shipment" ).dialog( "close" );
			},
			Cancel: function() {
			  $( "#dialog-form-shipment" ).dialog( "close" );
			}
	      },
	      close: function() {
			$(".dialogFields").val( "" ).removeClass( "ui-state-error" );
	      }
	    });

	function refreshShipments(data)
	{
		console.log(data);
			alert('in add');
			$("#shipmentTemplateStructure").template("shipRowTemplate");
			alert('here???' + $.tmpl("shipRowTemplate",data));
			$.tmpl("shipRowTemplate",data).appendTo("#shipmentbody");
			alert('done123');
	} 

	$(document).on("click", "#shipmentRow a[funct='openEditShipLink']", function() {
		var shipId = $(this).attr('shipId');
        $.ajax({
            url:'/cimbidiaSCM/booking/getBookingShipment',
            data: { id : shipId },
            success: function(data){
            	//alert('in success' + data.numOfContainers);
              /* $("#dialog-form-shipment input[name='numOfContainers']").val(data.numOfContainers);
               $("#dialog-form-shipment input[name='numOfConfirmedContainers']").val(data.numOfConfirmedContainers);
               $("#dialog-form-shipment input[name='booking.id']").val(data.bookingId);
               $("#dialog-form-shipment input[name='id']").val(data.id);
                $("#dialog-form-shipment input[name='comments']").val(data.comments);
				
               var shiptypeStr = "#dialog-form-shipment select[name='shipmentType.id'] option[value='"+data.shipmentTypeId+"']";
               $(shiptypeStr).attr("selected","selected");
 			 
 			 	var transportationServiceStr = "#dialog-form-shipment select[name='transportationService.id'] option[value='"+data.transportationServiceId + "']";
               $(transportationServiceStr).attr("select*d","selected");
               
               var shipmentProviderStr = "#dialog-form-shipment select[name='shipmentProvider.id'] option[value='"+data.shipmentProviderId + "']";
               $(shipmentProviderStr).attr("selected","selected");
          
          		*/
               $("#dialog-form-shipment").dialog("open")
            }
        });
    });
	  
	  $( "#addEquipmentBtn" ).click(function() {

		   $("#dialog-form-equipment input[name='numOfContainers']").val("");
	       $("#dialog-form-equipment input[name='numOfConfirmedContainers']").val("");
	       $("#dialog-form-equipment input[name='id']").val("");
	       $("#dialog-form-equipment input[name='comments']").val("");
	       
	       var equiptypeStr = "#dialog-form-equipment select[name='equipmentType.id'] option[selected='selected']";
           $(equiptypeStr).removeAttr("selected");
		 
		 	var transportationServiceStr = "#dialog-form-equipment select[name='transportationService.id'] option[selected='selected']";
           $(transportationServiceStr).removeAttr("selected");
           
           var equipmentProviderStr = "#dialog-form-equipment select[name='equipmentProvider.id'] option[selected='selected']";
           $(equipmentProviderStr).removeAttr("selected");
	       

		$( "#dialog-form-equipment" ).dialog( "open" );
	  });
	  
	   //Add form for booking equipment
	  $( "#dialog-form-equipment" ).dialog({
	      autoOpen: false,
	      height: 350,
	      width: 350,
	      modal: true,
	      buttons: {
		"Save": function() {
			console.log($('#addEquipmentForm').serialize());
			var url;
			var addOrUpdate;
			if ($("#addEquipmentForm input[name='id']").val() )
			{
				url = "/cimbidiaSCM/booking/updateBookingEquipment";
				addOrUpdate = false;
			}
			else
			{
				url = "/cimbidiaSCM/booking/saveBookingEquipment"
				addOrUpdate = true;
			}
		  	$.ajax({
					url: url,
					type: "POST",
					data: $('#addEquipmentForm').serialize(),
					success: function(data) {
						refreshEquipments(data,addOrUpdate);

					},
					error: function(xhr, textStatus, error){
					   //whatever you need to do here - output errors etc
					   //alert( 'Bobbbbbb' + error);
					   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					}
        		});	
        		
        	 	$( "#dialog-form-equipment" ).dialog( "close" );
			},
			Cancel: function() {
			  $( "#dialog-form-equipment" ).dialog( "close" );
			}
	      },
	      close: function() {
			$(".dialogFields").val( "" ).removeClass( "ui-state-error" );
	      }
	    });

	function refreshEquipments(data, addOrUpdate)
	{
		console.log(data);
		var equipRow;
		if(addOrUpdate)
		{
			//alert('in add');
			$("#equipmentTemplateStructure").template("equipRowTemplate");
			$.tmpl("equipRowTemplate",data).appendTo("#equipmentBody");
		}
		else
		{
			//alert('in update' +data.id);
			 equipRow = $("tr[equipId="+data.id+"]");
			 var updatedRow = updateRowFields(equipRow, data, addOrUpdate);
			 

		}
	} 

	function updateRowFields(row, data, addOrUpdate)
	{	
		var updatedFieldsRow = row.find("label").each(function() {
		var id = $(this).attr("id");
		//alert('id='+id);
		switch(id)
		{
			case 'equipmentTypeCode':
				$(this).text(data.equipmentTypeCode);
				break;
			
			case 'equipmentTypeDescription':
				$(this).text(data.equipmentTypeDesc);
				break;
			
			case 'numOfContainers':
				$(this).text(data.numOfContainers);
				break;
			
			case 'numOfConfirmedContainers':
				$(this).text(data.numOfConfirmedContainers);
				break;
			
			case 'transServ':
				$(this).text(data.transportationServiceName);
				break;
			
			case 'equipmentProvider':
				$(this).text(data.equipmentProviderName);
				break;
			
			case 'comments':
				$(this).text(data.comments);
				break;
			
				} 
			}).end();
			
			if(addOrUpdate)
			{
					updatedFieldsRow = updatedFieldsRow.find("a").each(function() {
					var id = $(this).attr("id");
					switch(id)
					{
						case 'deleteEquipLink':
						var url = "/cimbidiaSCM/booking/deleteBookingEquipment?bookingInstance.id="+data.bookingId+"&bookingEquipment.id="+data.id;
						//alert(url);
						$(this).attr("href",url);
						break;
						
						case 'editEquipLink':
						$(this).attr("equipId",data.id);
						break;
					}
					}).end();
			}
			updatedFieldsRow.attr("equipId",data.id);
			return updatedFieldsRow;
	}
	
	 
	$(document).on("click", "#equipmentRow a[funct='openEditEquipLink']", function() {
		var equipId = $(this).attr('equipId');
        $.ajax({
            url:'/cimbidiaSCM/booking/getBookingEquipment',
            data: { id : equipId },
            success: function(data){
            	//alert('in success' + data.numOfContainers);
               $("#dialog-form-equipment input[name='numOfContainers']").val(data.numOfContainers);
               $("#dialog-form-equipment input[name='numOfConfirmedContainers']").val(data.numOfConfirmedContainers);
               $("#dialog-form-equipment input[name='booking.id']").val(data.bookingId);
               $("#dialog-form-equipment input[name='id']").val(data.id);
                $("#dialog-form-equipment input[name='comments']").val(data.comments);
				
               var equiptypeStr = "#dialog-form-equipment select[name='equipmentType.id'] option[value='"+data.equipmentTypeId+"']";
               $(equiptypeStr).attr("selected","selected");
 			 
 			 	var transportationServiceStr = "#dialog-form-equipment select[name='transportationService.id'] option[value='"+data.transportationServiceId + "']";
               $(transportationServiceStr).attr("selected","selected");
               
               var equipmentProviderStr = "#dialog-form-equipment select[name='equipmentProvider.id'] option[value='"+data.equipmentProviderId + "']";
               $(equipmentProviderStr).attr("selected","selected");
          
          		if($("#isCarrier").attr("value") == "true")
          		{
          			 $("#dialog-form-equipment input[name='numOfContainers']").attr("readonly",true);
          			 //$("#dialog-form-equipment input[name='comments']").attr("readonly",true);
          			 $("#dialog-form-equipment select[name='equipmentType.id'] option:not(:selected)").attr('disabled', true);
          			 $("#dialog-form-equipment select[name='transportationService.id'] option:not(:selected)").attr('disabled', true);
          			 $("#dialog-form-equipment select[name='equipmentProvider.id'] option:not(:selected)").attr('disabled', true);
          			 
          		}
               $("#dialog-form-equipment").dialog("open");
            }
        });
    });
    
    	
	$( "#addReferenceBtn" ).click(function() {
		 var referenceTypeStr = "#dialog-form-reference select[name='referenceType'] option[selected='selected']";
           $(referenceTypeStr).removeAttr("selected");
           
        $("#dialog-form-reference input[name='referenceNumber']").val("");
        $("#dialog-form-reference input[name='id']").val("");
		$("#dialog-form-reference" ).dialog( "open" );
		
	  });

	  //Add form for booking reference
	  $( "#dialog-form-reference" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 400,
	      modal: true,
	      buttons: {
		"Save": function() {
			console.log($('#addReferenceForm').serialize());
			
			var url;
			var addOrUpdate;
			if ($("#addReferenceForm input[name='id']").val() )
			{
				url = "/cimbidiaSCM/booking/updateBookingReference";
				addOrUpdate = false;
			}
			else
			{
				url = "/cimbidiaSCM/booking/saveBookingReference"
				addOrUpdate = true;
			}
			//alert('addOrUpdate='+addOrUpdate);
			
		  	$.ajax({
					url: url,
					type: "POST",
					data: $('#addReferenceForm').serialize(),
					success: function(data) {
						//alert('BookingReference added' +data);
						refreshRefNum(data,addOrUpdate);

					},
					error: function(xhr, textStatus, error){
					   //whatever you need to do here - output errors etc
					   //alert( 'Bobbbbbb' + error);
					   console.log(xhr.statusText);
					   console.log(textStatus);
					   console.log(error);
					}
        		});	
        		
        	 	$( "#dialog-form-reference" ).dialog( "close" );
			},
			Cancel: function() {
			  $( "#dialog-form-reference" ).dialog( "close" );
			}
	      },
	      close: function() {
			$(".dialogFields").val( "" ).removeClass( "ui-state-error" );;
	      }
	    });


	  
	  
  	function refreshRefNum(data, addOrUpdate)
	{
		console.log(data);
		var refNumRow;
		if(addOrUpdate)
		{
			//alert('in add');
			$("#referenceTemplateStructure").template("referenceRowTemplate");
			$.tmpl("referenceRowTemplate",data).appendTo("#referenceBody");
		}
		else
		{
			//alert('in update' +data.id);
			 var referenceId = data.id;
			 refNumRow = "tr[referenceId="+referenceId+"]  label[id="
			 var rt = refNumRow + "referenceType ]";
			 var rn = refNumRow + "referenceNumber ]";
	
			 //alert('rt='+rt + "data="+data.referenceType);
			 //alert('rn='+rn + "data="+data.referenceNumber);
			 $(rt).text(data.referenceType);
			 $(rn).text(data.referenceNumber);
		}
	} 
	  	
	$(document).on("click", "#referenceRow a[funct='openEditReferenceLink']", function() {
		var referenceId = $(this).attr('referenceId');
		//alert('refid='+referenceId);
        $.ajax({
            url:'/cimbidiaSCM/booking/getBookingReference',
            data: { id : referenceId },
            success: function(data){
               var referenceTypeStr = "#dialog-form-reference select[name='referenceType'] option[value='"+data.referenceType+"']";
	           $(referenceTypeStr).attr("selected","selected");
	           
	       		$("#dialog-form-reference input[name='referenceNumber']").val(data.referenceNumber);
	       		$("#dialog-form-reference input[name='id']").val(data.id);
        		$("#dialog-form-reference input[name='booking.id']").val(data.bookingId);
 
               $("#dialog-form-reference").dialog("open");
            }
        });
    });
    
	$( ".open-trackingDialog" ).click(function() {
		var currentId = $(this).attr('id');
		$( "#trackingDialog-form" ).data('bookingId', currentId );
		$( "#trackingDialog-form" ).dialog( "open" );
	      }); 

	
	$( "#trackingDialog-form" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 400,
	      modal: true,
	      buttons: {
		"Save": function() {
		  var bValid = true;	 
		if ( bValid ) {
			var bookingId = $(this).data('bookingId');
		  	$("input[id=bookingId]").val(bookingId)
			$.ajax({
				url: "/cimbidiaSCM/booking/createTrackingMsg",
				type: "POST",
				
				data: $('#trackingMsgForm').serialize(),
				success: function(data) {
					alert ( 'Tracking message saved!' );
					location.reload();
				    $(this).dialog("close");
				},
				error: function(xhr, textStatus, error){
				  
				   console.log(xhr.statusText);
				   console.log(textStatus);
				   console.log(error);
				}
      		});		    
      		$( "#trackingDialog-form" ).dialog( "close" );
		  }
		},
		Cancel: function() {
		  $( "#trackingDialog-form" ).dialog( "close" );
		}
	      },
	      close: function() {
		//allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });

});

</script>
<script id="referenceTemplateStructure" type="text/x-jquery-tmpl">
	<tr id="referenceRow" class="odd" referenceId="<%= '${id}' %>" >
		<td>
			<a href="/cimbidiaSCM/booking/deleteBookingReference?bookingInstance.id=<%= '${bookingId}' %>&bookingReference.id=<%= '${id}' %>"	id="deleteReferenceLink" >
				<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
			<a href="#"	funct="openEditReferenceLink" referenceId="<%='${id}' %>">
				<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>

		</td>
		<td>
			<label id="referenceType"><%='${referenceType}'%></label>
	 	</td>
		<td>
			<label id="referenceNumber"><%='${referenceNumber}'%></label>
		</td>
	</tr>
</script>

<script id="equipmentTemplateStructure" type="text/x-jquery-tmpl">
	<tr id="equipmentRow" class="odd" equipId="<%= '${id}' %>" >
		<td>
			<a href="/cimbidiaSCM/booking/deleteBookingEquipment?bookingInstance.id=<%= '${bookingId}' %>&bookingEquipment.id=<%= '${id}' %>"	id="deleteEquipLink" >
				<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" /></a>
			<a href="#"	funct="openEditEquipLink" equipId="<%='${id}' %>">
				<img src="${createLinkTo(dir:'images/icons',file:'edit.png')}" alt="Edit" /></a>

		</td>
		<td>
			<label id="equipmentTypeCode"><%='${equipmentTypeCode}'%></label>
	 	</td>
		<td>
			<label id="equipmentTypeDescription"><%='${equipmentTypeDesc}'%></label>
		</td>
		<td>
			<label id="numOfContainers"><%='${numOfContainers}'%></label>
		</td>
		<g:isUserCarrier>
		<td>
			<label id="numOfConfirmedContainers"><%='${numOfConfirmedContainers}'%></label>	</td>
		</g:isUserCarrier>
		<td>
			<label id="transServ"><%='${transportationServiceName}'%></label>	</td>
		<td>
			<label id="equipmentProvider"><%='${equipmentProviderName}'%></label>	
		</td>
		<td>
			<label id="comments"><%='${comments}'%></label>	
		</td>
	</tr>

</script>

<script id="shipmentTemplateStructure" type="text/x-jquery-tmpl">
	<g:if test="${bookingInstance.bookingShipmentList != null}">
												<tr  >      
														<td style="border:2px solid white !important;">
														<input type="checkbox" name="shipmentCheck"  class="checkForId" id="${bookingShipment?.id?.encodeAsHTML()}"
																	 onclick="addId('${bookingShipment?.id}')" />
														</td>	
														<td class="left shipment-name" style="border:2px solid white !important;">
								
								                       <g:link action="show" controller="shipment" id="${bookingShipment?.shipment?.id}">
								                           ${fieldValue(bean: bookingShipment?.shipment, field: "shipmentNumber")}
								                           </g:link></td>
														<td ><label id="weight">${fieldValue(bean: bookingShipment?.shipment, field: "weight")}  
															
														</td>	${fieldValue(bean: bookingShipment?.shipment, field: "volume")}
														<td><label id="volume">	${fieldValue(bean: bookingShipment?.shipment, field: "volume")}  
																									
														</td>
														<td ><label id="quantity">${fieldValue(bean: bookingShipment?.shipment, field: "quantity")}
								           				 						
														</td>
														
														<td ><label id="mode">${bookingShipment?.shipment?.mot?.code}
														</td>
														<td><label id="shipStatus">${fieldValue(bean: bookingShipment?.shipment, field: "shipStatus")} 
														</td>
														
														
														
											</tr>			
														
									
								</g:if>
		
		
	

</script>
	</div>  
    </body>
</html>