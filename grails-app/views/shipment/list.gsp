<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipment.list.label', default: 'Orders').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <style>
      	</style>
    </head>    
    <body>
        <div class="">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
	<div id="" class="" style="padding: 0px;width: 100%">
	        
		
<span class="content_inner">
		<div class="pagetitle">
		<label style="color:white"><warehouse:message code="shipping.shipmentlist.label"/></label>


		</div></span>
		<div class="right">

					<span class="plus">
			            +
			        </span>&nbsp;
			        	<%--<span class="comment note" >
				            <img class="top" src="${resource(dir: 'images', file: 'comment.png')}">
				            --%><script src="https://apis.google.com/js/platform.js"></script>
							<div id="placeholder-rr"></div>

						<script>
							  gapi.hangout.render('placeholder-rr', {
							    'render': 'createhangout',
							    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
							    'widget_size': 25
							  });
							</script>
							<%--</img>
			        	</span>
			        --%></div>
		<div class="table-responsive list">
		<table id="sample-table-1" class="table table-striped table-hover table-condensed">            
            	<thead>
					<tr class="prop">   
						<th class="dtl-header"><input type="checkbox" id="selectall"/> &nbsp; Select All</th>
						<g:sortableColumn property="shipmentNumber"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipmentNo.label',default:'Shipment Number')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<g:sortableColumn property="weight"  class="dtl-header" title="${warehouse.message(code: 'shipping.totalWt.label',default:'Total Weight(Lbs)')}"params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
					
						<g:sortableColumn property="volume"  class="dtl-header" title="${warehouse.message(code: 'shipping.totalVolume.label',default:'Total Volume (Cubic Feet)')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<g:sortableColumn property="quantity"  class="dtl-header" title="${warehouse.message(code: 'shipping.quantityUOM.label',default:'Total Quantity (Pallets)')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<td  class="dtl-header" >${warehouse.message(code: 'shipping.mot.label',default:'Mode')}</td>
						
						<g:sortableColumn property="shipStatus"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipmentStatus.label',default:'Shipment Status')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<td  class="dtl-header">${warehouse.message(code: 'shipping.assignedCarrier.label',default:'Assigned Carrier')}</td>
						
						<g:sortableColumn property="origin"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipfrom.label',default:'Ship From')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<g:sortableColumn property="shipDestination"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipto.label',default:'Ship To')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<g:sortableColumn property="pickupStart"  class="dtl-header"  title="${warehouse.message(code: 'shipping.pickUpDt.label',default:'Pickup Date/Time')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
											
						<g:sortableColumn property="deliveryStart"  class="dtl-header" title="${warehouse.message(code: 'shipping.dropoff.label',default:'Delivery Date/Time')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,mot:params.mot
														].findAll {it.value}}"/>
						
						<th class="dtl-header"></th>
						</tr>
				</thead>		            
				<tbody >
            		<tr class="prop odd">            
			            <g:form action="shipListByFilter" method="post">
			             <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            	
							<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='shipmentNumber' value="${shipmentNumber}"/>
							</td>
			            
								<td style="border:2px solid white !important;">
								</td>
								<td style="border:2px solid white !important;">
								</td>
								<td style="border:2px solid white !important;">
									<td style="border:2px solid white !important;">
			            		<g:selectMOT name="mot" optionKey="id"
										value="${mot?.id}" />
								</td>
								<td  class="filter-list-item" style="border:2px solid white !important;">
								<g:select name="shipStatus" from="${['Open','Planned','Accepted', 'Tendered', 'Intransit', 'Delivered']}" value="${shipStatus}"
          												valueMessagePrefix="shipStatus"noSelection="['':'']"/>
								
								</td><td></td>
							<td  style="border:2px solid white !important;">
					          	<g:selectDepot name="origin" 
										class="form-control" optionKey="id" value="${origin}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td  class="filter-list-item" style="border:2px solid white !important;">
									<g:selectDepot name="shipDestination" 
										class="form-control" optionKey="id"  value="${shipDestination}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
									
							</td>
							<td style="border:2px solid white !important;"></td>
							<td style="border:2px solid white !important;"></td>
				           <td class="filter-list-item" style="height: 100%;width:85px; vertical-align: bottom">
								<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
							</td>
							</g:form>
					</tr>					
				
					<g:if test="${shipments.size() != 0}">
					<g:each var="shipmentInstance" in="${shipments}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">      
							<td style="border:2px solid white !important;">
							<input type="checkbox" name="shipmentCheck"  class="checkForId" id="${shipmentInstance?.id?.encodeAsHTML()}"
										 onchange="javascript:void(0);" />
							</td>	
							<td class="left shipment-name" style="border:2px solid white !important;">

                        <g:link action="show" id="${shipmentInstance.id}">
                            ${fieldValue(bean: shipmentInstance, field: "shipmentNumber")}
                            </g:link></td>
							<td align="center" style="border:2px solid white !important;">
							<g:if test="${shipmentInstance?.weight == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: shipmentInstance, field: "weight")}  
							</g:else>	
							</td>
							<td align="center" style="border:2px solid white !important;">	
							<g:if test="${shipmentInstance?.volume == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: shipmentInstance, field: "volume")}  
							</g:else>											
							</td>
							<td align="center" style="border:2px solid white !important;">												
							<g:if test="${shipmentInstance?.quantity == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: shipmentInstance, field: "quantity")}  
							</g:else>	 						
							</td>
							<td align="center" style="border:2px solid white !important;">
							${shipmentInstance?.mot?.code}
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: shipmentInstance, field: "shipStatus")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: shipmentInstance, field: "carrierCompany.companyName")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: shipmentInstance, field: "origin.name")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: shipmentInstance, field: "shipDestination.name")}
							</td>
							<td align="center" style="border:2px solid white !important;">
								${shipmentInstance?.pickupStart?.format('MM/dd/yyyy HH:mm')}
							</td>
							
							
							<td align="right" style="border:2px solid white !important;">												
								${shipmentInstance?.deliveryStart?.format('MM/dd/yyyy HH:mm')}						
							</td>
							<td align="right" style="border:2px solid white !important;">												
								<div class="dtl-small">
									<a href="javascript:void(0);" id="${shipmentInstance.id}" class="open-trackingDialog"><img style="height:20px" src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="Create Tracking Message" /></a>
								</div>						
							</td>
							
							</tr>
					</g:each> 
					</g:if>
					<g:elseif test="${shipments.size() == 0}"> 
						<table><tr><td>No Records Found</td></tr></table>
					  </g:elseif>                   		
				</tbody>
			</table>
<table><tr class="prop">
<td valign="top"></td>
		<td valign="top">

		<div class="action-menu">
						<g:render template="listShippingMenuItems" model="[shipmentInstance:shipmentInstance]"/>
		</div>
		<div style="position: relative; left: -25px;" class="paginateButtons">										
               									 <g:paginate total="${shipmentTotal?:0 }" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo,,mot:params.mot
														].findAll {it.value}}"/>
        </div>
		</td>
		</tr></table>
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
        <input type="text" name="msgDate" id="msgDate"	value=""> 
									<script	type="text/javascript">
										$(function() {
											$('*[name=msgDate]')
													.datetimepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y H:i'
															});
										});
									</script>
      	</td></tr>
        <tr><td><label for="comments">Comments</label></td><td><input type="text" name='comments' value="" size="30" /></td></tr>
        </table>
         	
		</form>
	</div>
			</div>
		<script type="text/javascript">
		
		$(document).ready(function() {  
			
				
			$( "#trackingDialog-form" ).dialog({
			      autoOpen: false,
			      height: 300,
			      width: 420,
			      modal: true,
			      buttons: {
				"Save": function() {
				  var bValid = true;

				  if ( bValid ) {
					var shipmentId = $(this).data('shipmentId');
				  	$("input[id=shipmentId]").val(shipmentId)
					$.ajax({
						url: "/cimbidiaSCM/shipment/createTrackingMsg",
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
			$( ".open-trackingDialog" ).click(function() {
				var currentId = $(this).attr('id');
				$( "#trackingDialog-form" ).data('shipmentId', currentId );
				$( "#trackingDialog-form" ).dialog( "open" );
			      });
			
			 $(function(){
				 $('#edit').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	 $("a[href='/cimbidiaSCM/shipment/edit/shipIdEdit']").attr('href', '/cimbidiaSCM/shipment/edit/'+val)
					        }else{
						        alert("Please Checked Only One checkBox For Edit Shipment");
					        	}
				       
					  });
				 $('#show').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	$("a[href='/cimbidiaSCM/shipment/showDetails/shipIdShow']").attr('href', '/cimbidiaSCM/shipment/showDetails/'+val)
				        }else{
					        alert("Please Checked Only One checkBox For Show Shipment Details");
				        	}
					  });
			      $('#tendered').click(function(){
			        var val = [];
			        $(':checkbox:checked').each(function(i){
			          var currentId = $(this).attr('id');
			          val[i] = currentId
			        });
			        
			        $("a[href='/cimbidiaSCM/shipment/tenderedShipment/tenderedIds']").attr('href', '/cimbidiaSCM/shipment/tenderedShipment/'+val)
				  });
			      $('#accepted').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        
				         $("a[href='/cimbidiaSCM/shipment/acceptedShipment/acceptedIds']").attr('href', '/cimbidiaSCM/shipment/acceptedShipment/'+val)
				      });
			      $('#rejected').click(function(){
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        
				         $("a[href='/cimbidiaSCM/shipment/rejectedShipment/rejectedIds']").attr('href', '/cimbidiaSCM/shipment/rejectedShipment/'+val)
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
		

	</script>

    </body>
</html>
