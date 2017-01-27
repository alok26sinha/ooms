<%@page import="com.cimbidia.wm.core.User"%>
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'to.filterlist.label', default: 'Filter Transportation Orders').toLowerCase()}" />
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
<label style="color:white"><warehouse:message code="to.filterlist.label"/></label></div><br/>
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
						<th class="dtl-header"></th>
						<th class="dtl-header">${warehouse.message(code: 'to.filterName.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'to.Public.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'to.shipNo.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'to.dashboard.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'to.status.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'shipping.shipfrom.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'shipping.shipto.label')}</th>	
						<th class="dtl-header">${warehouse.message(code: 'to.user.label')}</th>					
						
						</tr>
				</thead>		            
				<tbody >
            		<%--<tr class="prop odd">            
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
								<g:select name="toStatus" from="${['Open','Accepted', 'Tendered', 'Intransit', 'Delivered']}" value="${toStatus}"
          												valueMessagePrefix="toStatus"noSelection="['':'']"/>
								</td>
							<td  style="border:2px solid white !important;">
					          	<g:selectDepot name="origin" 
										class="form-control" optionKey="id" value="${origin}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td  style="border:2px solid white !important;">
									<g:selectDepot name="destination" 
										class="form-control" optionKey="id"  value="${destination}" noSelection="['':warehouse.message(code:'default.all.label')]"/>
									
							</td>
							<td style="border:2px solid white !important;"></td>
							<td style="border:2px solid white !important;"></td>
				           <td class="filter-list-item" style="height: 100%;width:85px; vertical-align: bottom">
								<button name="filter" class="btn btn-success">
									<i class="fa fa-filter"/>
									<warehouse:message code="default.button.filter.label"/>
								</button>
							</td>
							</g:form>
					</tr>								
				
					--%><g:if test="${toFilters.size() != 0}">
					<g:each var="toFilter" in="${toFilters}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style="border:2px solid white !important;">      
							<td>
							
						<div class="action-menu">
							<input type="checkbox" name="toFilterCheck" class="checkForId"  id="${toFilter?.id?.encodeAsHTML()}"
										 onchange="javascript:void(0);" />
							</div>
					</td>								
							<td style="border:2px solid white !important;" class="left shipment-name">
							${fieldValue(bean: toFilter, field: "filterName")}
							</td>
                            <td style="border:2px solid white !important;">
                            <g:if test="${toFilter.isPublic == 0}">
                            No
                            </g:if>
                            <g:if test="${toFilter.isPublic == 1}">
                            Yes
                            </g:if>
                            </td>
                            <td align="center" style="border:2px solid white !important;">
                            
								${fieldValue(bean: toFilter, field: "shipment.shipmentNumber")} 
							</td>
                            <td align="center" style="border:2px solid white !important;">
                            <g:if test="${toFilter.showOnDashboard == 0}">
                            No
                            </g:if>
                            <g:if test="${toFilter.showOnDashboard == 1}">
                            Yes
                            </g:if>
							</td>
                            
							<td align="center" style="border:2px solid white !important;">
							
								${fieldValue(bean: toFilter, field: "toStatus")} 
							</td>
							
							<td align="center" style="border:2px solid white !important;">	
								${fieldValue(bean: toFilter, field: "origin.name")}  
							</td>
							<td align="center" style="border:2px solid white !important;">	
								${fieldValue(bean: toFilter, field: "destination.name")}  
							</td>
							<td align="center" style="border:2px solid white !important;">
								${User?.findById(toFilter.userId)}
								
							</td>
							
							</tr>
					</g:each> 
					</g:if>
					<g:elseif test="${toFilters.size() == 0}"> 
						<table><tr><td>No Records Found</td></tr></table>
					  </g:elseif>                   		
				</tbody>
			</table>
<table><tr>
		<td>
		<div class="action-menu">
		<span id="shipment-action-menu" class="action-menu">
		<button class="action-btn btn btn-default">
			Actions<i class="fa fa-arrow-down"></i>
		</button>
	<div class="actions" style="min-width: 200px;">
	<div class="action-menu-item" id="delete">
			<g:link action="deleteToFilter" controller="Shipment" id="deleteFilterId">
				Delete
			</g:link>
			</div>
			<div class="action-menu-item" id="apply">
			<g:link action="applyToFilter" controller="Shipment" id="applyFilterId">
				Apply
			</g:link>
			</div>
			<div class="action-menu-item" id="plan">
			<g:link action="planShipmentByFilter" controller="Shipment" id="planFilterId">
				Plan Shipment
			</g:link>
			</div>
		
	</div>
</span>
						
		</td>
		</tr></table>
			</div>
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

			
			
        </script>
        <script type="text/javascript">
		
		  
			$(function(){
				 $('#delete').click(function(){
					
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length > 0){
				        	 $("a[href='/cimbidiaSCM/shipment/deleteToFilter/deleteFilterId']").attr('href', '/cimbidiaSCM/shipment/deleteToFilter/'+val)
					        }else{
						        alert("Please Checked  One or more checkBox For Delete");
					        	}
				       
					  });
				 $('#apply').click(function(){
						
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	 $("a[href='/cimbidiaSCM/shipment/applyToFilter/applyFilterId']").attr('href', '/cimbidiaSCM/shipment/applyToFilter/'+val)
					        }else{
						        alert("Please Checked any one checkBox to filter TO");
					        	}
				       
					  });
				 $('#plan').click(function(){
						
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	 $("a[href='/cimbidiaSCM/shipment/planShipmentByFilter/planFilterId']").attr('href', '/cimbidiaSCM/shipment/planShipmentByFilter/'+val)
					        }else{
						        alert("Please Checked any one checkBox to filter TO");
					        	}
				       
					  });
				 
				
			});
	
			
			
        </script>
    </body>
</html>
