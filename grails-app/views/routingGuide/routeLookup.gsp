
<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'routingGuide.label', default: 'Routing Guide')}" />
        <title><warehouse:message code="default.rgLookup.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.rgLookup.label" args="[entityName]" /></content>
		<script>
		$(function (){
		
		  $( "#dialog-rateDtls" ).dialog({
			      autoOpen: false,
			      height: 400,
			      width: 350,
			      modal: true,
			      buttons: {
				      close: function() {
						$(".dialogFields").val( "" );
				      }
				  }
	    });

			
			
	$(document).on("click", "a[funct='rateDtlsLink']", function() {
		//alert('in ratedtlfunc');
		var ratingLaneCarrierId = $(this).attr('ratingLaneCarrierId');
		var totalCost = $(this).text();
		//alert('totalcost='+totalCost);
			var url = '/cimbidiaSCM/ratingLaneCarrier/showRateDtls?id=' + ratingLaneCarrierId + '&totalCost='+ totalCost;
			var windowObjectReference;
			var strWindowFeatures = "menubar=no,location=no,resizable=no,scrollbars=no,status=yes,width=400,height=350,x=50,y=50";
      		windowObjectReference = window.open(url, "Cost Details", strWindowFeatures);


/*		var ratingLaneCarrierId = $(this).attr('ratingLaneCarrierId');

        $.ajax({
            url:'/cimbidiaSCM/ratingLaneCarrier/show',
            data: { id : ratingLaneCarrierId },
            success: function(data){
//              $("#dialog-rateDtls input[name='comments']").val(data.comments);
				$("#dialog-rateDtls").dialog("open");
            }
        }); */
    });
    
			
		}); //end onload func
		
		function openRatingDtls(ratingCarrierId)
		{
			var url = 'http://localhost:8080/cimbidiaSCM/ratingLaneCarrier/show/' + ratingCarrierId ;
			//var windowObjectReference;
			//var strWindowFeatures = "menubar=no,location=no,resizable=no,scrollbars=no,status=yes,width=400,height=350,x=50,y=50";
      		//windowObjectReference = window.open(url, "Cost Details", strWindowFeatures);
      		
      		$.ajax({
            url:url,
            data: { id : ratingCarrierId },
            success: function(data){
//                $("#dialog-rateDtls input[name='comments']").val(data.comments);
				
               $("#dialog-rateDtls").dialog("open");
            }
        });
      		
		}
		</script>
    </head>
    <body>
     <div>
        <div class="body">
			<div class="bootstrap">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${routingGuideSearchInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${routingGuideSearchInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <div class="content_inner">
				<label class="pagetitle">${warehouse.message(code: 'rgLookup.label', default: 'Rate Lookup')}</label>
			</div>
            <g:form action="getMatchingRoutesList" method="post" >

            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        	<tr>
	                        	 <td valign="top" class="name">
							        <label for="origin"><warehouse:message code="origin.label" default="Origin" /></label>
							    </td>
							    <td valign="top" class="value ${hasErrors(bean: routingGuideSearchInstance, field: 'origin', 'errors')}">
							    	<g:autoSuggest id="origin" name="origin"
																	jsonUrl="${request.contextPath}/json/locationLookup"
																	valueId="${origin?.id}"
																	valueName="${origin?.name}"
																	styleClass="text" width="175" />
							     </td>
							     <td valign="top" class="name">
							        <label for="destination"><warehouse:message code="destination.label" default="Destination" /></label>
							    </td>
							    <td valign="top" class="value ${hasErrors(bean: routingGuideSearchInstance, field: 'destination', 'errors')}">
							    	<g:autoSuggest id="destination" name="destination"
																	jsonUrl="${request.contextPath}/json/locationLookup"
																	valueId="${destination?.id}"
																	valueName="${destination?.name}"
																	styleClass="text" width="175" />
							     </td>
						    </tr>
						    <tr class="prop">
	                                <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.mot.label" default="Mot" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:select name="mot.id" from="${com.cimbidia.wm.core.Mot.list()}" optionKey="id" value="${routingGuideSearchInstance?.mot?.id}"  noSelection="['null': '']" />
	                                </td>
	                          		<td valign="top">
	                                    <label for="equipment"><warehouse:message code="routingGuide.equipment.label" default="Equipment" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:select name="equipment.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${routingGuideSearchInstance?.equipment?.id}" noSelection="['null': '']" />
	                                </td>
	                                <td valign="top">
	                                    <label for="tempCtrl"><warehouse:message code="routingGuide.tempCtrl.label" default="Temp control" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:selectTempCtrl name="tempCtrl.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${routingGuideSearchInstance?.tempCtrl?.id}" noSelection="['null': '']" />
	                                </td>
	                               	<td valign="top">
	                                    <label for="serviceLevel"><warehouse:message code="routingGuide.serviceLevel.label" default="Service Level" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:selectSL name="serviceLevel.id" value="${routingGuideSearchInstance?.serviceLevel?.id}" noSelection="['null': '']"  />
	                                </td>
	                        
	                         	<tr>
	                                <td valign="top">
	                                    <label for="distance"><warehouse:message code="routingGuide.distance.label" default="Distance" /></label>
	                                </td>
	                                <td valign="top">
								        <g:textField name="distance" value="${routingGuideSearchInstance?.distance}" />
								   	    <g:selectRateUnit name="distanceUom.id" value="${routingGuideSearchInstance?.distanceUom?.id}" noSelection="['null': '']"  />
	                               
								    </td>
								    <td valign="top">
	                                    <label for="weight"><warehouse:message code="routingGuide.weight.label" default="Weight" /></label>
	                                </td>
	                                <td valign="top">
								        <g:textField name="weight" value="${routingGuideSearchInstance?.weight}" />
								   		<g:selectRateUnit name="weightUom.id" value="${routingGuideSearchInstance?.weightUom?.id}" noSelection="['null': '']"  />
	                               
								    </td>
							   	    <td valign="top">
	                                    <label for="numOfStops"><warehouse:message code="routingGuide.numOfStops.label" default="Number of Stops" /></label>
	                                </td>
	                                <td valign="top">
								        <g:textField name="numOfStops" value="${routingGuideSearchInstance?.numOfStops}" />
								    </td>
								    <td valign="top">
	                                    <label for="orderBy"><warehouse:message code="routingGuide.orderBy.label" default="Order By" /></label>
	                                </td>
	                                <td valign="top">
	                                	<g:select name="orderBy" optionKey="key" optionValue="value" value="${routingGuideSearchInstance?.orderBy}" from="['CP': 'Carrier Priority','TC':'Total Cost']"/>
	                               
	                               
	                                </td>
								</tr>
								<tr>	
									
									<td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="commodityClass"><warehouse:message code="routingGuide.commodityClass.label" default="Commodity Class" /></label>
	                                </td>
									 
									 <td valign="top" class="value ${hasErrors(bean: routingGuideSearchInstance, field: 'commodityClass', 'errors')}">
	                                    <g:selectCMDT style="width:150px;" name="commodityClass" value="${routingGuideSearchInstance?.commodityClass}" noSelection="['null': '']" />
	                                </td>
								</tr>	                                
	                            
	                            </tr>
  								<tr class="prop">
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="search" class="btn" action="getMatchingRoutesList" btnPress="getMatchingRoutesList"  value="${warehouse.message(code: 'default.button.go.label', default: 'Go')}" />
				
						                </div>                        	
		                        	</td>
		                        </tr>	                            
					    </tbody>
				   </table>
				   
			   </div>
		   </fieldset>
		   </g:form>
		   <div class="list">
        		<table class="table table-striped">
        			<caption>
						<label class="section-header" for='carriers'>
							<warehouse:message code="default.routingGuideCarrierList.label" default="Carriers"/>
						</label>
					</caption>
					<thead>
						<tr id="carrierHead">
							<th>
			        			Carrier Name
			        		</th>
			        		<th>
			        			Carrier Priority
			        		</th>
			        		<th>
			        			Mode
			        		</th>
			        		<th>
			        			Cost
			        		</th>
						</tr>
					</thead>
					<tbody id="carrierBody">
			            	<g:each in="${routingRatingLookupResultList}" var="routingRatingResult">
				        	<tr>
				        		<td>
				        		${routingRatingResult.routingGuideCarrier.carrier.companyName}
				        		</td>
				        		<td>
				        		${routingRatingResult.routingGuideCarrier.carrierPriority}
				        		</td>
				        		<td>
				        		${routingRatingResult.ratingLaneCarrier.mot?.description}
				        		</td>
				        		<td>
				        			<a href="#"	funct="rateDtlsLink" ratingLaneCarrierId="${routingRatingResult.routingGuideCarrier.id}" id="rateDtlsLink" ratingLaneCarrier="${routingRatingResult.ratingLaneCarrier}">
						        		 ${routingRatingResult.ratingLaneCarrier.totalCost} ${routingRatingResult.ratingLaneCarrier.currency.name}
						        	</a>
				        		</td>
				        	</tr>
			        		</g:each>  
					</tbody>
				</table>
            </div>

        </div>
        </div>
        
        
            <div id="dialog-rateDtls" title="Cost Details">
				<table>
					<tr>
						    <td valign="top" class="name"><warehouse:message code="ratingLaneCarrier.rateType.label" default="Rate Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneCarrierInstance?.rateType?.id}">${ratingLaneCarrierInstance?.rateType?.encodeAsHTML()}</g:link></td>
                            
						    <td valign="top" class="name"><warehouse:message code="ratingLaneCarrier.rate.label" default="Rate" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneCarrierInstance, field: "rate")}</td>
                            
                            <td valign="top" class="name"><warehouse:message code="ratingLaneCarrier.rateUnit.label" default="Rate Unit" /></td>
                            
                            <td valign="top" class="value"><g:link controller="constants" action="show" id="${ratingLaneCarrierInstance?.rateUnit?.id}">${ratingLaneCarrierInstance?.rateUnit?.encodeAsHTML()}</g:link></td>
                   
            		</tr>	
				
				</table>
			</div>
            
            
        </div>
    </body>
</html>