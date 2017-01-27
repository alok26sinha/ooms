<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'carrierShipment.title.label', default: 'Carrier Shipment').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <style>
        .dtl-header {
			background-color: cornflowerblue;
			border: 2px solid white !important;
			
			text-align: center;
			color:white !important;
		}
		.poheader{
			background-color: rgb(96, 166, 232);
			height: 10%;
			text-align: center;
			font-size: x-large;
			position: relative;
			top: 0px;
			font-family: cambri(body);
		}
		
</style>
    </head>    
    <body>
        <div class="boostrap">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
	<div id="" class="panel panel-primary" style="padding: 0px;width: 100%">
	        
		
		<div class="content_inner"><label style="color:white"><warehouse:message code="CarrierShipping.carrierShipment.label"/></label></div><br/>
		<table><tr>
		<td>
		<div class="action-menu">
						<g:render template="carrierListShippingMenuItems" model="[carrierShipmentInstance:carrierShipmentInstance]"/>
			</div>
		</td>
		</tr></table>
		 
		                        <div>
                           
                        </div>
                        <div>
                           
                        </div>
		<div class="table-responsive list">
		<table id="sample-table-1" class="table table-striped table-hover table-condensed">            
            	<thead>
					<tr class="prop"> 
						
						<th class="dtl-header"><input type="checkbox" id="selectall"/> &nbsp; Select All</th>
						<g:sortableColumn property="shipperCompanyId"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipper.label',default:'Shipper')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />
						
						<g:sortableColumn property="shipmentNumber"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipmentNo.label',default:'Shipment Number')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />  
					
						<%--<th class="dtl-header">${warehouse.message(code: 'shipping.totalWt.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'shipping.totalVolume.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'shipping.quantityUOM.label')}</th>--%>
						
						<g:sortableColumn property="shipStatus"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipmentStatus.label',default:'Shipment Status')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />
						
						<%--<g:sortableColumn property="toNumber"  class="dtl-header" title="${warehouse.message(code: 'shipping.assignedCarrier.label',default:'Assigned Carrier')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipper:params.shipper
														].findAll {it.value}}" />
						--%><th class="dtl-header">${warehouse.message(code: 'shipping.assignedCarrier.label')}</th>
						<g:sortableColumn property="origin"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipfrom.label',default:'Ship from')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />
						
						<g:sortableColumn property="shipDestination"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipto.label',default:'Ship To')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />
					
						<g:sortableColumn property="pickupStart"  class="dtl-header" title="${warehouse.message(code: 'shipping.pickUpDt.label',default:'Pickup Date/Time')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />	
					
						<g:sortableColumn property="deliveryStart"  class="dtl-header" title="${warehouse.message(code: 'shipping.dropoff.label',default:'Delivery Date/Time')}" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}" />					
						
						<th class="dtl-header"></th>
						</tr>
				</thead>		            
				<tbody >
            		<tr class="prop odd">            
			            <g:form action="carrierShipListByFilter" method="post">
			             <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            	<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='shipperCompanyId' value="${shipperCompanyId?.companyName }"/>
							</td>
							<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='shipmentNumber' value="${shipmentNumber }"/>
							</td>
			            	
								
								<td  class="filter-list-item" style="border:2px solid white !important;">
								<g:select name="shipStatus" from="${['Open','Accepted', 'Tendered', 'Intransit', 'Delivered']}" value="${shipStatus }"
          												valueMessagePrefix="shipStatus"noSelection="['':'']"/>
								
								</td><td></td>
							<td  style="border:2px solid white !important;">
					          	<g:selectDepot name="origin" 
										class="form-control" optionKey="id" value="${origin }" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td  class="filter-list-item" style="border:2px solid white !important;">
									<g:selectDepot name="shipDestination" 
										class="form-control" optionKey="id"  value="${shipDestination }" noSelection="['':warehouse.message(code:'default.all.label')]"/>
									
							</td>
							<td style="border:2px solid white !important;"></td>
							<td style="border:2px solid white !important;"></td>
				           <td>
								<button name="filter" class="btn btn-success">
									<i class="fa fa-filter"/>
									<warehouse:message code="default.button.filter.label"/>
								</button>
							</td>
							</g:form>
					</tr>					
									
				
					<g:if test="${carrierShipments?.size() != 0}">
					<g:each var="carrierShipmentInstance" in="${carrierShipments}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">      
							<td>
						<%--<div class="action-menu">
							<button class="action-btn">
								<img
									src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}" />
							</button>
							<div class="actions" style="position: absolute; display: none;">
								<g:render template="carrierListShippingMenuItems"
									model="[carrierShipmentInstance:carrierShipmentInstance]" />
							</div>
						</div>
						--%><input type="checkbox" name="shipmentCheck" class="checkForId" id="${carrierShipmentInstance?.id?.encodeAsHTML()}"
										 onchange="javascript:void(0);" />
					</td>		
						<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: carrierShipmentInstance, field: "shipperCompanyId.companyName")} 
							</td>						
							<td class="left shipment-name">

                        <g:link action="show"  id="${carrierShipmentInstance.shipment.id}">
                            ${fieldValue(bean: carrierShipmentInstance, field: "shipmentNumber")}
                            </g:link></td>
							<%--<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: carrierShipmentInstance, field: "weight")} 
							</td>
							<td style="border:2px solid white !important;">												
														
							</td>
							<td align="right" style="border:2px solid white !important;">												
															
							</td>
							
							--%><td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: carrierShipmentInstance, field: "shipStatus")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: carrierShipmentInstance, field: "carrierCompany.companyName")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
							<g:link class="edit" controller="location" action="viewByDay" id="${carrierShipmentInstance?.origin?.id}">
								${fieldValue(bean: carrierShipmentInstance, field: "origin.name")} 
								</g:link>
							</td>
							<td align="center" style="border:2px solid white !important;">
							<g:link class="edit" controller="location" action="viewByDay" id="${carrierShipmentInstance?.shipDestination?.id}">
								${fieldValue(bean: carrierShipmentInstance, field: "shipDestination.name")}
								</g:link>
							</td>
							<td align="center" style="border:2px solid white !important;">
								${carrierShipmentInstance?.pickupStart?.format('MM/dd/yyyy HH:mm')}
							</td>
							
							
							<td align="right" style="border:2px solid white !important;">												
								${carrierShipmentInstance?.deliveryStart?.format('MM/dd/yyyy HH:mm')}						
							</td>
							<td align="right" style="border:2px solid white !important;">												
								<div class="dtl-small">
									<a href="javascript:void(0);" id="${carrierShipmentInstance.id}" class="open-trackingDialog"><img style="height:20px" src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="Create Tracking Message" /></a>
								</div>						
							</td>
							</tr>
					</g:each>  
					</g:if>
					<g:elseif test="${carrierShipments.size() == 0}"> 
						<table><tr><td>No Records Found</td></tr></table>
					  </g:elseif>  
					  <tr><td colspan="3"><div style="position: relative; left: -25px;" class="paginateButtons">										
               									 <g:paginate total="${carrierShipmentsTotal?:0 }" params="${[shipmentNumber:params.shipmentNumber,origin:params.origin,statusStartDate:params.statusStartDate, 
														,shipDestination:params.shipDestination,shipStatus:params.shipStatus,shipperCompanyId:params?.shipperCompanyId
														].findAll {it.value}}"/>
        </div></td></tr>             		
				</tbody>
			</table>
			</div>
			</div>
			</div>
			<div>
			<div id="trackingDialog-form" title="Arrival/Departure">
        <form id="trackingMsgForm">
        <input type="hidden" name="shipmentId" id="shipmentId" />
        <table>
        <tr><td><label for="msgType">Message Type</label></td><td><g:select name="msgType" from="${['Arrival', 'Departure']}" valueMessagePrefix="msgType" /></td></tr>
        <tr><td><label for="stopNumber">Stop Number</label></td><td><input type="text" name='stopNumber' value="" size="5" /></td></tr>
        <tr><td><label for="msgDate">Message Date</label></td><td>
        <jqueryPicker:time styleClass="text ui-widget-content ui-corner-all" name="msgDate" value="" />
        <%--<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="msgDate" id="msgDate" value="" format="MM/dd/yyyy" />--%></td></tr>
        <tr><td><label for="comments">Comments</label></td><td><input type="text" name='comments' value="" size="30" /></td></tr>
        </table>
         	
		</form>
	</div>
			</div>
		<script type="text/javascript">
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

			$( "#trackingDialog-form" ).dialog({
			      autoOpen: false,
			      height: 300,
			      width: 400,
			      modal: true,
			      buttons: {
				"Save": function() {
				  var bValid = true;

				  if ( bValid ) {
					var shipmentId = $(this).data('shipmentId');
				  	$("input[id=shipmentId]").val(shipmentId)
					$.ajax({
						url: "/cimbidiaSCM/shipment/createCarrierTrackingMsg",
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


			$( ".open-trackingDialog" ).click(function() {
				var currentId = $(this).attr('id');
				$( "#trackingDialog-form" ).data('shipmentId', currentId );
				$( "#trackingDialog-form" ).dialog( "open" );
			      });
			 $(function(){
				 
			      $('#acceptedCarriers').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        $("a[href='/cimbidiaSCM/shipment/acceptedCarrierShipment/acceptedCarrierIds']").attr('href', '/cimbidiaSCM/shipment/acceptedCarrierShipment/'+val)
				      });
			      $('#rejectedCarriers').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        $("a[href='/cimbidiaSCM/shipment/rejectedCarrierShipment/rejectedCarrierIds']").attr('href', '/cimbidiaSCM/shipment/rejectedCarrierShipment/'+val)
				      });
			    });
			  
		});

		/*!
		* jQuery Cookie Plugin v1.4.0
		* https://github.com/carhartl/jquery-cookie
		*/
		(function (factory) {
		if (typeof define === 'function' && define.amd) {
		// AMD
		define(['jquery'], factory);
		} else if (typeof exports === 'object') {
		// CommonJS
		factory(require('jquery'));
		} else {
		// Browser globals
		factory(jQuery);
		}
		}(function ($) {

		var pluses = /\+/g;

		function encode(s) {
		return config.raw ? s : encodeURIComponent(s);
		}

		function decode(s) {
		return config.raw ? s : decodeURIComponent(s);
		}

		function stringifyCookieValue(value) {
		return encode(config.json ? JSON.stringify(value) : String(value));
		}

		function parseCookieValue(s) {
		if (s.indexOf('"') === 0) {
		// This is a quoted cookie as according to RFC2068, unescape...
		s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
		}

		try {
		// Replace server-side written pluses with spaces.
		// If we can't decode the cookie, ignore it, it's unusable.
		// If we can't parse the cookie, ignore it, it's unusable.
		s = decodeURIComponent(s.replace(pluses, ' '));
		return config.json ? JSON.parse(s) : s;
		} catch(e) {}
		}

		function read(s, converter) {
		var value = config.raw ? s : parseCookieValue(s);
		return $.isFunction(converter) ? converter(value) : value;
		}

		var config = $.cookie = function (key, value, options) {

		// Write

		if (value !== undefined && !$.isFunction(value)) {
		options = $.extend({}, config.defaults, options);

		if (typeof options.expires === 'number') {
		var days = options.expires, t = options.expires = new Date();
		t.setTime(+t + days * 864e+5);
		}

		return (document.cookie = [
		encode(key), '=', stringifyCookieValue(value),
		options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
		options.path ? '; path=' + options.path : '',
		options.domain ? '; domain=' + options.domain : '',
		options.secure ? '; secure' : ''
		].join(''));
		}

		// Read

		var result = key ? undefined : {};

		// To prevent the for loop in the first place assign an empty array
		// in case there are no cookies at all. Also prevents odd result when
		// calling $.cookie().
		var cookies = document.cookie ? document.cookie.split('; ') : [];

		for (var i = 0, l = cookies.length; i < l; i++) {
		var parts = cookies[i].split('=');
		var name = decode(parts.shift());
		var cookie = parts.join('=');

		if (key && key === name) {
		// If second argument (value) is a function it's a converter...
		result = read(cookie, value);
		break;
		}

		// Prevent storing a cookie that we couldn't decode.
		if (!key && (cookie = read(cookie)) !== undefined) {
		result[name] = cookie;
		}
		}

		return result;
		};

		config.defaults = {};

		$.removeCookie = function (key, options) {
		if ($.cookie(key) === undefined) {
		return false;
		}

		// Must not alter options, thus extending a fresh object...
		$.cookie(key, '', $.extend({}, options, { expires: -1 }));
		return !$.cookie(key);
		};

		}));

		


        </script>
    </body>
</html>
