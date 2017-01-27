<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'to.list.label', default: 'Transportation Orders').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <style>
        
/* Action Menu Items */
.actions .action-menu-info a:hover {
    cursor: pointer;
}
.actions .action-menu-item {
    border: 0px solid black;
    margin: 0px;
    padding: 0px;
}
.actions .action-menu-item a {
    display: block;
    padding: 5px;
    font-weight: normal;
    color: #666;
    font-size: 0.9em;
    font: 11px Century Gothic, Arial, Helvetica, sans-serif;
    line-height: 12px;
    text-align: left;
}
.actions .action-menu-item a:hover {
    display: block;
    background-color: lightgrey;
    padding: 5px;
    text-decoration: none;
}

.megaButton a,
.megaButton a:visited {
    text-decoration: none;
    padding: 10px;
    display: block;
    color: #333;
}

.megaButton:hover {
    background-color: lightgrey;
}
        
        .dtl-header {
			background-color: cornflowerblue;
			border: 2px solid white !important;
			
			text-align: center;
			color:white !important;
		}
		.toheader{
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
        <div>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
	<div id="" class="" style="padding: 0px;width: 100%">
	        
		
<span class="content_inner">
<div class="pagetitle">
<label style="color:white"><warehouse:message code="to.tolist.label"/></label></div><br/>
</div></span>
		<div class="right">

					<span class="plus">
			            +
			        </span>&nbsp;
			        	<script src="https://apis.google.com/js/platform.js"></script>
							<div id="placeholder-rr"></div>

						<script>
							  gapi.hangout.render('placeholder-rr', {
							    'render': 'createhangout',
							    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
							    'widget_size': 25
							  });
							</script>
							</div>
		
		 
		                        <div>
                           
                        </div>
                        <div>
                           
                        </div>
		<div class="table-responsive list">
		<table id="sample-table-1" class="table table-striped table-hover table-condensed">            
            	<thead>
					<tr class="prop">   
						<th class="dtl-header">${warehouse.message(code: 'default.actions.label')}</th>
						<g:sortableColumn property="toNumber"  class="dtl-header" title="${warehouse.message(code: 'to.toNo.label',default:'Transportation Number')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						<td class="dtl-header">${warehouse.message(code: 'to.shipNo.label',default:'Shipment Number')} </td>
						<g:sortableColumn property="weight"  class="dtl-header" title="${warehouse.message(code: 'shipping.totalWt.label',default:'Total Weight(Lbs)')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						<g:sortableColumn property="volume"  class="dtl-header" title="${warehouse.message(code: 'shipping.totalqt.label',default:'Total Volume (Cubic Feet)')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						<g:sortableColumn property="quantity"  class="dtl-header" title="${warehouse.message(code: 'shipping.quantityUOM.label',default:'Total Quantity (Pallets)')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						
						<g:sortableColumn property="toStatus"  class="dtl-header" title="${warehouse.message(code: 'shipping.status.label',default:'Status')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
					
						
						<g:sortableColumn property="origin"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipfrom.label',default:'Ship From')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						
						<g:sortableColumn property="destination"  class="dtl-header" title="${warehouse.message(code: 'shipping.shipto.label',default:'Ship To')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						
						<g:sortableColumn property="pickupStart"  class="dtl-header" title="${warehouse.message(code: 'shipping.pickUpDt.label',default:'Pickup Date/Time')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />
						
						<g:sortableColumn property="deliveryStart"  class="dtl-header" title="${warehouse.message(code: 'shipping.dropoff.label',default:'Delivery Date/Time')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,
														incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}" />				
						
						</tr>
				</thead>		            
				<tbody >
            		<tr class="prop odd">            
			            <g:form action="toListByFilter" method="post">
			            	<td style="border:2px solid white !important;"></td>
			            	<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='toNumber' value="${toNumber}"/>
							</td>
							<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='shipmentNumber' value="${shipmentNumber}" />
							</td>
			            	
								<td style="border:2px solid white !important;">
								</td>
								<td style="border:2px solid white !important;">
								</td>
								<td style="border:2px solid white !important;">
								</td>
								<td  style="border:2px solid white !important;">
								<g:select id="toStatus" name="toStatus" from="${['Open','Planned','Accepted','Tendered','Intransit','Delivered']}" value="${toStatus}"
          												valueMessagePrefix="toStatus"noSelection="['':'']"/>
								</td>
							<td  style="border:2px solid white !important;">
					          	<g:selectDepot id="origin" name="origin" 
										optionKey="id" value="${origin}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td  style="border:2px solid white !important;">
									<g:selectDepot id="destination" name="destination" 
										optionKey="id"  value="${destination}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
									
							</td>
							<td style="border:2px solid white !important;"></td>
							<td style="border:2px solid white !important;">
								<a href="javascript:void(0);" id="" class="open-dialog"><label class="dtl-header">Save</label></a>
								<%--<g:link action="saveToFilter" controller="Shipment">Save</g:link>
								
							<g:actionSubmit value="Save" action="saveToFilter" controller="shipment" /> 
							--%><button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
							</td>
							</g:form>
					</tr>								
				
					<g:if test="${transportationOrders.size() != 0}">
					<g:each var="transportationOrder" in="${transportationOrders}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style="border:2px solid white !important;">      
							<td>
						<div class="action-menu">
							<button class="action-btn">
								<img
									src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}" />
							</button>
							</div>
					</td>								
							<td class="left shipment-name">

                        <g:link action="transportationOrdersList">
                            ${fieldValue(bean: transportationOrder, field: "toNumber")}
                            </g:link></td>
                            <td style="border:2px solid white !important;">
                            <g:link action="show" id="${transportationOrder?.shipment?.id?.encodeAsHTML()}">
                            		${transportationOrder?.shipment?.shipmentNumber}
                            </g:link>												
													
							</td>
                            <td align="center" style="border:2px solid white !important;">
                            <g:if test="${transportationOrder?.weight == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: transportationOrder, field: "weight")} 
							</g:else>
							</td>
							<td align="center" style="border:2px solid white !important;">
							<g:if test="${transportationOrder?.volume == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: transportationOrder, field: "volume")} 
							</g:else>
								
							</td>
							
							<td align="center" style="border:2px solid white !important;">	
							<g:if test="${transportationOrder?.quantity == 0}">
							</g:if>
            				<g:else>
								${fieldValue(bean: transportationOrder, field: "quantity")}  
							</g:else>											
															
							</td>
							
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: transportationOrder, field: "toStatus")} 
							</td>
							
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: transportationOrder, field: "origin.name")} 
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: transportationOrder, field: "destination.name")}
							</td>
							<td align="center" style="border:2px solid white !important;">
								${transportationOrder?.pickupStart?.format('MM/dd/yyyy HH:mm')}
							</td>
							
							
							<td align="right" style="border:2px solid white !important;">												
								${transportationOrder?.deliveryStart?.format('MM/dd/yyyy HH:mm')}						
							</td>
							</tr>
							
					</g:each> 
					
					</g:if>
					<g:elseif test="${transportationOrders.size() == 0}"> 
						<table><tr><td>No Records Found</td></tr></table>
					  </g:elseif>                   		
				</tbody>
			</table>
<table>
		<tr>
		<td>
		<div class="action-menu">
						<g:render template="shipmentActions" model="[transportationOrder:transportationOrder]"/>
		</div>
		<div style="position: relative; left: -25px;" class="paginateButtons">										
               									 <g:paginate total="${transportationOrderTotal?:0 }" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers,toStatus:params.toStatus,	incoming:params.incoming, lastUpdatedFrom:params.lastUpdatedFrom,lastUpdatedTo:params.lastUpdatedTo
														,mot:params.mot? mot:null].findAll {it.value}}"/>
        </div>
		</td>
		</tr></table>
		
		<div>
		<div id="dialog-form" title="TO Filter Form">
		<form id="MsgForm">
		<table>
        <tr><td><label>Filter Name</label></td><td><input type="text"  name='filterName' value="" size="15" /></td></tr>
        <tr><td><label>Status</label></td>
        <td>
        <g:select id="status" name="status" from="${['Open','Accepted', 'Tendered', 'Intransit', 'Delivered']}" value="" valueMessagePrefix="toStatus"noSelection="['':'']"/>
        </td></tr>
        <tr><td><label>Ship From</label></td>
        <td>
        <g:selectDepot id="originFilter" name="originFilter" 
										class="form-control" optionKey="id" value="" valueMessagePrefix="originFilter"noSelection="['':warehouse.message(code:'default.all.label')]"/>
		
        </td></tr>
        <tr><td><label>Ship To</label></td><td>
        <g:selectDepot id="destinationFilter" name="destinationFilter" 
										class="form-control" optionKey="id" value=""valueMessagePrefix="destinationFilter" noSelection="['':warehouse.message(code:'default.all.label')]"/>
		
        </td></tr>
        <tr><td><label>Public</label></td><td><g:select name="isPublic" from="${['Yes', 'No']}" valueMessagePrefix="public" /></td></tr>
        <tr><td><label>Show On Dashboard</label></td><td><g:select name="dashboard" from="${['Yes', 'No']}" valueMessagePrefix="dashboard" /></td></tr>
        </table>
        
		
		</form>
		</div></div>
			</div>
			</div>
		<script type="text/javascript">
			$(function() { 		
				$(".clear-dates").click(function() {
					$('#statusStartDate-datepicker').val('');					
					$('#statusEndDate-datepicker').val('');
					$('#statusStartDate').val('');					
					$('#statusEndDate').val('');
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

			$(document).ready(function() { 
				
				
				
				$( "#dialog-form" ).dialog({
					
				      autoOpen: false,
				      height: 300,
				      width: 400,
				      modal: true,
				      buttons: {
					"Save": function() {
					  var bValid = true;

					  if ( bValid ) {
						//var shipmentId = $(this).data('shipmentId');
					  	//$("input[id=shipmentId]").val(shipmentId)
						$.ajax({
							url:"/cimbidiaSCM/shipment/saveToFilterData",
							type:"POST",
							
							data: $('#MsgForm').serialize(),
							success: function(data) {
								alert ( 'TO Filter saved!' );
								location.reload();
							    $(this).dialog("close");
							},
							error: function(xhr, textStatus, error){
							  
							   console.log(xhr.statusText);
							   console.log(textStatus);
							   console.log(error);
							}
			        		});		    
			        		$( "#dialog-form" ).dialog( "close" );
					  }
					},
					Cancel: function() {
					  $( "#dialog-form" ).dialog( "close" );
					}
				      },
				      close: function() {
					//allFields.val( "" ).removeClass( "ui-state-error" );
				      }
				    });


				$( ".open-dialog" ).click(function() {
					
					$("#dialog-form").dialog("open");
					var status=$("#toStatus").val()
					var origin=$("#origin option:selected").val();//$("#origin").val()
					var destination=$("#destination option:selected").val();//$("#destination").val()
					//alert(status+" : "+origin+" : "+destination) 
					$("#status").val(status)
					$("#originFilter").val(origin)
					$("#destinationFilter").val(destination)
				      });
				
				 
				
			});
			
			
        </script>
    </body>
</html>
