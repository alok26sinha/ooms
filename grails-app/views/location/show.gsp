<%@ page import="com.cimbidia.wm.core.RoleType" %>
<%@ page import="com.cimbidia.wm.core.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'warehouse.label', default: 'Location')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
		<link rel="stylesheet" href="${createLinkTo(dir:'js/jquery',file:'jquery.colorpicker.css')}" type="text/css" media="screen, projection" />
		<script src="${createLinkTo(dir:'js/jquery/', file:'jquery.colorpicker.js')}" type="text/javascript" ></script>
		
    </head>
    <body>
        <div class="body">
        
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${locationInstance}" as="list" />
	            </div>
            </g:hasErrors>
                        
			<g:render template="summary"/>			  
			
			
			<div class="tabs">
				<ul>
					<li>
						<a href="#tabs-details">
							<warehouse:message code="location.label"/>
						</a>
					</li>
				%{--	<g:isUserInRole roles="[RoleType.ROLE_ADMIN]">
						 <li>
							 a href="#tabs-transactions">
								<warehouse:message code="transactions.label"/>
							</a> 
						</li> 
						<li> 
							<a href="#tabs-shipments">
								<warehouse:message code="shipments.label"/>
							</a>
						</li> 
						<li>
							<a href="#tabs-requests">
								<warehouse:message code="requests.label"/>																	
							</a>
						</li>
						<li>
							<a href="#tabs-orders">
								<warehouse:message code="orders.label"/>																	
							</a>
						</li>
						<li>
							<a href="#tabs-events">
								<warehouse:message code="events.label"/>
							</a>
						</li>
						<li>
							<a href="#tabs-users">
								<warehouse:message code="users.label"/>																	
							</a>
						</li>
					</g:isUserInRole>
				</ul>		
				<g:isUserInRole roles="[RoleType.ROLE_ADMIN]">
					<div id="tabs-transactions" class="dialog">
						<table>
							<tr>
								<th>Actions</th>							
								<th>Id</th>
								<th>Date</th>
								<th>Type</th>
								<th>Inventory</th>
								<th>Source</th>
								<th>Destination</th>
							</tr>
							<g:each var="transaction" in="${locationInstance?.transactions }" status="i">
								<tr class="${i%2?'odd':'even' }">
									<td>
										<g:render template="../transaction/actions" model="[transactionInstance:transaction]"/>
									</td>
									<td>${transaction.id }</td>
									<td>${transaction.transactionDate }</td>
									<td>${transaction.transactionType?.name }</td>
									<td>${transaction.inventory }</td>
									<td>${transaction.source }</td>
									<td>${transaction.destination }</td>
									<%-- 
									<td><g:link controller="inventory" action="showTransaction" id="${transaction.id }">show</g:link></td>
									<td><g:link controller="inventory" action="editTransaction" id="${transaction.id }">edit</g:link></td>
									<td><g:link controller="location" action="deleteTransaction" id="${transaction.id }" 
										onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
										params="['location.id':locationInstance?.id]" fragment="tabs-transactions">delete</g:link></td>
										--%>
								</tr>
							</g:each>
						</table>
					</div>  
					<div id="tabs-shipments" class="dialog">
						<table>
							<tr>
								<th>Actions</th>							
								<th>Id</th>
								<th>Type</th>
								<th>Status</th>
								<th>Date</th>
								<th>Source</th>
								<th>Destination</th>
							</tr>						
							<g:each var="shipment" in="${locationInstance?.shipments }" status="i">
								<tr class="${i%2?'odd':'even' }">
									<td>
										<g:render template="../shipment/actions" model="[shipmentInstance:shipment]"/>
									</td>
									<td>${shipment.id }</td>
									<td>${shipment.shipmentType?.name }</td>
									<td>
										<format:metadata obj="${shipment?.status?.code}"/>
										<g:prettyDateFormat date="${shipment?.status?.date}" />
									</td>
									<td>
										${shipment?.status?.date}
									</td>
									<td>${shipment.origin }</td>
									<td>${shipment.destination }</td>
								</tr>
							</g:each>
						</table>
					</div> 
					<div id="tabs-events" class="dialog">
						<table>
							<g:each var="event" in="${locationInstance?.events }">
								<tr>
									<td>${event.id }</td>
									<td>${event }</td>
									<td><g:link controller="event" action="show" id="${event.id }">show</g:link></td>
									<td><g:link controller="event" action="edit" id="${event.id }">edit</g:link></td>
									<td>
										<g:link controller="location" action="deleteEvent" id="${event.id }" 
											onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
											params="['location.id':locationInstance?.id]" fragment="tabs-events">delete</g:link>
									</td>
								</tr>
							</g:each>
						</table>
					</div>
					<div id="tabs-requests" class="dialog">
						<table>
							<g:each var="requestInstance" in="${locationInstance?.requests }">
								<tr>
									<td>${requestInstance.id }</td>
									<td>${requestInstance }</td>
									<td><g:link controller="requisition" action="show" id="${requestInstance.id }">show</g:link></td>
									<td><g:link controller="requisition" action="edit" id="${requestInstance.id }">edit</g:link></td>
									<td><g:link controller="location" action="deleteRequest" id="${requestInstance.id }" 
										onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
										params="['location.id':locationInstance?.id]" fragment="tabs-requests">delete</g:link></td>
								</tr>
							</g:each>
						</table>
					</div>
					<div id="tabs-orders" class="dialog">
						<table>
							<g:each var="order" in="${locationInstance?.orders }">
								<tr>
									<td>${order.id }</td>
									<td>${order }</td>
									<td><g:link controller="order" action="show" id="${order.id }">show</g:link></td>
									<td><g:link controller="order" action="edit" id="${order.id }">edit</g:link></td>
									<td><g:link controller="location" action="deleteOrder" id="${order.id }" 
										onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
										params="['location.id':locationInstance?.id]" fragment="tabs-orders">delete</g:link></td>
								</tr>
							</g:each>
						</table>
					</div>
					<div id="tabs-users" class="dialog">
						<table>
							<g:each var="user" in="${locationInstance?.users }">
								<tr>
									<td>${user.id }</td>
									<td>${user }</td>
									<td><g:link controller="user" action="show" id="${user.id }">show</g:link></td>
									<td><g:link controller="user" action="edit" id="${user.id }">edit</g:link></td>
									<td><g:link controller="location" action="deleteUser" id="${user.id }" 
										onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
										params="['location.id':locationInstance?.id]" fragment="tabs-users">delete</g:link></td>
								</tr>
							</g:each>
						</table>
	
					</div>				
				</g:isUserInRole> --}%
				<div id="tabs-details" class="dialog">
		            <g:form method="post" action="update">
		                <g:hiddenField name="id" value="${locationInstance?.id}" />
		                <g:hiddenField name="version" value="${locationInstance?.version}" />
		                
		                    <table>
		                        <tbody>
		                            <tr class="prop">
		                                <td valign="top" class="name">
											<label for="name"><warehouse:message code="default.name.label" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'name', 'errors')}">
											${locationInstance?.name}
		                                </td>
		                            </tr>
		                            <tr class="prop">
		                                <td valign="top" class="name">
											<label for="type"><warehouse:message code="location.locationType.label" /></label>
			
		                                </td>
		                                <td valign="top" class="value">
		                                	${locationInstance?.locationType?.name }
		                                		
		                                	
		                                </td>
		                            </tr>
		                            <tr class="prop">
		                                <td valign="top" class="name">
											<label for="locationGroup"><warehouse:message code="location.locationGroup.label" /></label>
		                                </td>
		                                <td valign="top" class="value">
											${locationInstance?.locationGroup?.name?:warehouse.message(code:'default.none.label') }
		                                </td>
		                            </tr>	         
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                	<label for="manager"><warehouse:message code="warehouse.manager.label" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'manager', 'errors')}">
										%{--	${locationInstance?.manager?:warehouse.message(code:'default.none.label')} --}%
		                                </td>
		                            </tr>
		                            <tr class="prop">
		                                <td valign="top" class="name">
			                                <label for="active"><warehouse:message code="warehouse.active.label" /></label> 
		                                </td>
		                                <td valign="top" class="value${hasErrors(bean: locationInstance, field: 'active', 'errors')}">
											${locationInstance?.active}
		                                </td>
		                            </tr>
		                            <tr class="prop">
		                                <td valign="top" class="name">
			                                <label for="local"><warehouse:message code="warehouse.local.label" /></label>
		                                </td>
		                                <td valign="top" class="value${hasErrors(bean: locationInstance, field: 'local', 'errors')}">
											${locationInstance?.local}
		                                </td>
		                            </tr>
		                            
		                            <tr class="prop">
		                                <td valign="top" class="name">
											<label for="name"><warehouse:message code="location.supportedActivities.label" /></label>
		                                </td>
		                                <td valign="top" class="value">
		                                
		                                	<g:set var="activityList" value="${com.cimbidia.wm.core.ActivityCode.list() }"/>
	                                		<g:set var="locationActivityList" value="${locationInstance?.supportedActivities?:locationInstance?.locationType?.supportedActivities}"/>
		                                	
		                                	<table>
			                                	<g:each var="activity" in="${activityList }" status="status">
													<tr class="${status%2?'even':'odd' }">
														<td>
															<g:if test="${locationInstance?.supports(activity) }">
																<img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'tick.png')}" alt="${warehouse.message(code: 'default.yes.label') }" title="${warehouse.message(code: 'default.yes.label') }"/>               	
							                            	</g:if>
							                            	<g:else>
																<img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'cross.png')}" alt="${warehouse.message(code: 'default.no.label') }" title="${warehouse.message(code: 'default.no.label') }"/>               	
							                            	</g:else>
							                            	&nbsp;
															${format.metadata(obj:activity)}
														</td>
													</tr>
												</g:each>
											</table>
		                                	
		                                </td>
		                            </tr>
									<tr class="prop">
		                                <td valign="top" class="name">
		                                  <label for="bgColor"><warehouse:message code="warehouse.logo.label"/></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'logo', 'errors')}">
		                              		      
											<g:if test="${locationInstance?.logo }">
												<img class="logo" src="${createLink(controller:'location', action:'viewLogo', id:locationInstance.id)}" style="vertical-align: bottom" />		            				
											</g:if>				                                   
		                                   	
		                                </td>
		                            </tr>		                            
		                            
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                  <label for="bgColor"><warehouse:message code="warehouse.bgColor.label"/></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'bgColor', 'errors')}">
		                                
		                                	<table>
		                                		<tr>
		                                			<td>
					                                    <span class="fade">${locationInstance?.bgColor }</span>
		                                			</td>
		                                				                                			
		                                		</tr>
		                                	</table>
			                                   
		                                   	
		                                </td>
		                            </tr>
		                            
		                            
					                            
		                            
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                  <label for="fgColor"><warehouse:message code="warehouse.fgColor.label" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'fgColor', 'errors')}">
											<table>
		                                		<tr>
		                                			<td>
					                                    <span class="fade">${locationInstance?.fgColor }</span>
		                                			</td>
		                                			
		                                		</tr>
		                                	</table>		                                    
		                                   	
		                                </td>
		                            </tr>
		                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minTime"><warehouse:message code="location.minTime.label" default="Sort order"/></label>
                                </td>
                                			
		                                			<td>
					                                    <span class="fade">${locationInstance?.minTime }</span>
		                                			</td>
		                           
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxTime"><warehouse:message code="location.maxTime.label" default="Sort order"/></label>
                                </td>
                                
		                                			<td>
					                                    <span class="fade">${locationInstance?.maxTime }</span>
		                                			</td>
		                                			
                            </tr>
		                            <%-- 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                  <label for="parentLocation"><warehouse:message code="warehouse.parentLocation.label" default="Parent Location" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'parentLocation', 'errors')}">
											<g:select name="parentLocation.id" from="${com.cimbidia.wm.core.Location.list()}" 
												optionKey="id" optionValue="name" value="" noSelection="['null': '']" />							
		                                </td>
		                            </tr>
		                            --%>
		                            <%-- 
		                            <tr class="prop">
		                            
		                            	<td valign="top" class="name">
		                            	
		                            	</td>
		                            	<td class="value">
											<div class="buttons left">
							                   <button type="submit">								
													<img src="${createLinkTo(dir: 'images/icons/silk', file: 'accept.png')}" class="top"/>
													<warehouse:message code="default.button.save.label"/>
												</button>
												&nbsp;
												<g:link action="list">
													${warehouse.message(code: 'default.button.cancel.label')}						
												</g:link>			
											</div>
										</td>
									</tr>
		                            --%>
				<tr class="prop">
	                            <td valign="top" class="name"><label>Address</label></td>
	                            <td valign="top" class="value">
									<g:if test="${locationInstance?.address }">
										<table id="addressTable">
											<thead>
												<tr class="odd">
													<th>Address</th>
													<th>Street Addess</th>
													<th>City</th>
													<th>County</th>
													<th>StateOrProvince</th>
													<th>PostalCode</th>
													<th>Country</th>
													<th/>
												</tr>
											</thead>									
											<tbody>
													<tr class="order-item even">
														<td>
															${locationInstance?.address?.address}
														</td>
														<td>
															${locationInstance?.address?.address2}
														</td>
														<td>
															${locationInstance?.address?.city}
														</td>
														<td>
															${locationInstance?.address?.county}
														</td>
														<td>
															${locationInstance?.address?.stateOrProvince}
														</td>
														<td>
															${locationInstance?.address?.postalCode}
														</td>
														<td>
															${locationInstance?.address?.country}
														</td>

														<td align="right">
															<a href="javascript:void(0);" id="${locationInstance?.id}" class="open-dialog"><img src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="Edit" /></a>
														</td>														
													</tr>
												
											</tbody>
										</table>
									</g:if>
									<g:else>
										<span class="fade"><warehouse:message code="default.noItems.label" /></span>
										<div align="left">
											<a href="javascript:void(0);" id="${locationInstance?.id}" class="open-dialog"><img src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="Edit" /></a>
										</div>														
									</g:else>
	                            </td>
	                        </tr>	                        
		                          
		                        </tbody>
		                    </table>
		                <table>
		                <tr>
		                <td>
		                <g:link controller="location" action="viewByDay" id="${locationInstance?.id}">Calendar</g:link>
	
		                <div class="dtl-small">
									<a href="javascript:void(0);" id="" class="map"><label>Map</label></a>
						</div>
		                </td>
		                </tr>
		                </table>
		               
		            </g:form>

		            
		            </div>

			
			<div id="dialog-form" title="Address">
			<form id="address">
			  <fieldset>
				<input type="hidden" name="location.id" id="location.id" value="${locationInstance?.id}"/>
				<label for="address">Address Line1</label>
				<input type="text" name="address" id="address" class="text ui-widget-content ui-corner-all" />
				<br/>
				<label for="address1">Line2</label>
				<input type="text" name="address2" id="address2" class="text ui-widget-content ui-corner-all" />
				<br/>
				<label for="city">City</label>
				<input type="text" name="city" id="city" class="text ui-widget-content ui-corner-all" />
				<br/>
				<label for="county">County</label>
				<input type="text" name="county" id="county" class="text ui-widget-content ui-corner-all" />
				<br/>
				<label for="stateOrProvince">State</label>
				<g:selectSTATE name="stateOrProvince"  noSelection="['': '']" />
				<br/>
				<label for="postalCode">Postal Code</label>
				<input type="text" name="postalCode" id="postalCode" class="text ui-widget-content ui-corner-all" />
				<br/>
				<label for="country">Country</label>
				<g:countrySelect id="country" name="country" default="usa" />
			</fieldset>
			</form>
		</div>
		<table>
		<tr>
		<th><div id="map-canvas" style="width: 400px; height: 300px"></div></th>
		<th><div id="pano" style="width: 400px; height: 300px;"></div></th>
		<td>
		</tr>
		</table>
		
        
    	

	    
	    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
function initialize() {
  var fenway =new google.maps.LatLng(${locationInstance?.latitude},${locationInstance?.longitude});
  var mapOptions = {
    center: fenway,
    zoom: 14
  };
  var map = new google.maps.Map(
      document.getElementById('map-canvas'), mapOptions);
  var panoramaOptions = {
    position: fenway,
    pov: {
      heading: 34,
      pitch: 10
    }
  };
  var panorama = new  google.maps.StreetViewPanorama(document.getElementById('pano'),panoramaOptions);
  map.setStreetView(panorama);
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
	    
		            <script type="text/javascript">

	        function selectCombo(comboBoxElem, value) {
		        alert(comboBoxElem + " " + value)
				if (comboBoxElem != null) {
					if (comboBoxElem.options) { 
						for (var i = 0; i < comboBoxElem.options.length; i++) {
				        	if (comboBoxElem.options[i].value == value &&
				                comboBoxElem.options[i].value != "") { //empty string is for "noSelection handling as "" == 0 in js
				                comboBoxElem.options[i].selected = true;
				                break
				        	}
						}
					}
				}
			}						
	    
	        $(document).ready(function() {
	        	// store cookie for a day, without, it would be a session cookie
	        	$(".tabs").tabs({cookie: { expires: 1 } }); 
	            $('#bgColor').colorpicker({
	                size: 20,
	                label: '',
	                hide: true
	            });

	            $('#fgColor').colorpicker({
	                size: 20,
	                label: '',
	                hide: true
	            });

	            $( "#mapForm" ).dialog({
				      autoOpen: false,
				      height: 375,
				      width: 820,
				      modal: true,
				      
					Cancel: function() {
					  $( "#mapForm" ).dialog( "close" );
					}
				      
				    });
					
			$( ".map" ).click(function() {
				var currentId = $(this).attr('id');
				//$( "#mapForm" ).data('shipmentId', currentId );
				$( "#mapForm" ).dialog( "open" );
			      });
			     
			
	        });
	    </script> 
	    
<script>


$(document).ready(function() {  
	$( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 350,
	      modal: true,
	      buttons: {
					"Save": function() 
					{
					  var bValid = true;
			
					  if ( bValid ) {
					  	var currentId = $(this).data('itemid');
					  	$("input[id=itemid]").val(currentId)
					  	//alert ('Here1 ' + currentId);
					  	//alert('dialog serialise val='+$('#address').serialize());
						$.ajax({
							url: "/cimbidiaSCM/location/saveAddress",
							type: "POST",
							data: $('#address').serialize(),
							success: function(data) {
							//	alert ( 'Location Address Saved' );
							    $("#addressTable tbody").append("");
							    $(this).dialog("close");
							},
							error: function(xhr, textStatus, error){
							   //whatever you need to do here - output errors etc
							 //  alert( 'Error while Saving Address ' + error + xhr.statusText);
							   console.log(xhr.statusText);
							   console.log(textStatus);
							   console.log(error);
							}
			        		});		  //end of ajax  
			        		$(this).dialog( "close" );
					  } //end of if
					}, //end of save
					Cancel: function() {
					  $(this).dialog( "close" );
					}
	      },
	      close: function() {
				//$(".dialogFields").val( "" ).removeClass( "ui-state-error" );
	      }
	    });


	$( ".open-dialog" ).click(function() {
		$( "#dialog-form" ).dialog( "open" );
	      });
	

	
    
});


</script>
	    
    </body>
</html>
