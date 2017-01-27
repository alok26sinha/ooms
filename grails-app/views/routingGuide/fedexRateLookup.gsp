
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
            <g:hasErrors bean="${fedexRoutingGuideSearchCriteria}">
	            <div class="errors">
	                <g:renderErrors bean="${fedexRoutingGuideSearchCriteria}" as="list" />
	            </div>
            </g:hasErrors>
            <div class="content_inner">
				<label class="pagetitle">${warehouse.message(code: 'rgLookup.label', default: 'Rate Lookup')}</label>
			</div>
            <g:form action="getFedexMatchingRoutesList" method="post" >

            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        	<tr>
	                        	 <td valign="top" class="name">
							        <label for="origin"><warehouse:message code="origin.label" default="Origin" /></label>
							    </td>
							    <td valign="top" class="value ${hasErrors(bean: fedexRoutingGuideSearchCriteria, field: 'origin', 'errors')}">
							    	<g:autoSuggest id="origin" name="origin"
																	jsonUrl="${request.contextPath}/json/locationLookup"
																	valueId="${origin?.id}"
																	valueName="${origin?.name}"
																	styleClass="text" width="175" />
							     </td>
							     <td valign="top" class="name">
							        <label for="destination"><warehouse:message code="destination.label" default="Destination" /></label>
							    </td>
							    <td valign="top" class="value ${hasErrors(bean: fedexRoutingGuideSearchCriteria, field: 'destination', 'errors')}">
							    	<g:autoSuggest id="destination" name="destination"
																	jsonUrl="${request.contextPath}/json/locationLookup"
																	valueId="${destination?.id}"
																	valueName="${destination?.name}"
																	styleClass="text" width="175" />
							     </td>
							    <td style=""><label for='dateRequest'>
											Request Date</label></td>
								<td>
								<input type="text" name="dateRequest" id="dateRequest" 
								value="${formatDate(format:'MM/dd/yyyy')}">
									<script type="text/javascript">
										$(function(){
										$('*[name=dateRequest]').datepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y'
											 });
										});
									</script>
								</td>
						    </tr>
						    <tr class="prop">
	                                <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.groupPackage.label" default="Group Package Count" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:textField name="groupPackageCount" />
	                                </td>
	                          		 <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.packageCount.label" default="Package Count" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:textField name="packageCount" />
	                                </td>
	                                
	                                 <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.packageCount.label" default="Drop Type" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:select name="dropType" from="${['BUSINESS_SERVICE_CENTER','DROP_BOX','REGULAR_PICKUP','REQUEST_COURIER','STATION'] }" value="${fedexRoutingGuideSearchCriteria?.dropType}" />
	                                </td>
	                                
	                        
	                         	<tr>
	                               
								    <td valign="top">
	                                    <label for="weight"><warehouse:message code="routingGuide.weight.label" default="Weight" /></label>
	                                </td>
	                                <td valign="top">
								        <g:textField name="weight" value="${fedexRoutingGuideSearchCriteria?.weight?.value}" />								   		
								    	<g:select name="weightUnit" from="${['LB','KG']}" value="${fedexRoutingGuideSearchCriteria?.weightUnit }"/>
								    </td>
								     <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.packageCount.label" default="Service Type" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:select name="serviceType" from="${['SAME_DAY','SAME_DAY_CITY','SMART_POST','STANDARD_OVERNIGHT','PRIORITY_OVERNIGHT'] }" value="${fedexRoutingGuideSearchCriteria?.serviceType}" />
	                                </td>
							   	     <td valign="top">
	                                    <label for="mot"><warehouse:message code="routingGuide.packageCount.label" default="Packaging Type" /></label>
	                                </td>
	                                <td valign="top">
	                                    <g:select name="packagingType" from="${['FEDEX_10KG_BOX','FEDEX_25KG_BOX','FEDEX_BOX','FEDEX_ENVELOPE','FEDEX_PAK','FEDEX_TUBE','YOUR_PACKAGING'] }" value="${fedexRoutingGuideSearchCriteria?.packagingType}" />
	                                </td>
							   	   
	                                
								</tr>
								<tr>	
									
									 <td valign="top" colspan="5">
	                                    <table><tr><td rowspan="2"><warehouse:message code="routingGuide.numOfStops.label" default="Dimension" /></td>
	                                   				<td> Length</td>
	                                   				<td> Width </td>
	                                   				<td> Height</td>
	                                   				<td> Units</td>
	                                   			</tr><tr>
	                                   			 
	                                   			   <td><g:textField name="dimLength" value="${fedexRoutingGuideSearchCriteria?.dimLength }"/></td>
	                                   			   <td><g:textField name="dimWidth" value="${fedexRoutingGuideSearchCriteria?.dimWidth }"/></td>
	                                   			   <td><g:textField name="dimHeight" value="${fedexRoutingGuideSearchCriteria?.dimHeight }"/></td>
	                                   			   <td><g:select name="dimUnit" from="${['CM','IN']}" value="${fedexRoutingGuideSearchCriteria?.dimUnit }"/></td>
	                                    </table>
	                                </td>
								</tr>	                                
	                            
	                            </tr>
  								<tr class="prop">
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="search" class="btn" action="getFedexMatchingRoutesList" btnPress="getFedexMatchingRoutesList"  value="${warehouse.message(code: 'default.button.go.label', default: 'Go')}" />
				
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
			        			Base charge
			        		</th>
			        		<th>
			        			Total surcharges
			        		</th>
			        		<th>
			        			Total charges
			        		</th>
			        		
						</tr>
					</thead>
					<tbody id="carrierBody">
			            	<g:each in="${fedexRateList}" var="frl">
				        	<tr>
				        		<td>
				        		${frl.carrier}
				        		</td>
				        		<td>
				        		${frl.baseCharge.amount}	${frl.baseCharge.currency}
				        			
				        		</td>
				        		<td>
				        		${frl.totalSurcharges.amount}	${frl.totalSurcharges.currency}
				        		</td>
				        		
				        		<td>
				        		${frl.totalCharge.amount}	${frl.totalCharge.currency}
				        			
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