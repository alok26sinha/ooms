
<%@ page import="com.cimbidia.wm.booking.Booking" %>
<%@ page import="com.cimbidia.wm.booking.BookingStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'booking.label', default: 'Booking')}" />
        <title><h1><warehouse:message code="default.list.label" args="[entityName]" /></h1></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
		<script>
			$(function() {
			
			$("input[name='id']").change(function() { 
   		
		   		switch($(this).attr("status")) {
		   		case 'NEW':
		   		$("#acceptAction").attr("disabled","true")
		   		$("#rejectAction").attr("disabled","true")
		   		$("#submitToCarrierAction").removeAttr("disabled");
		   		$("#deleteAction").removeAttr("disabled");
		   		break;
		   		
		   		case 'REQUESTED':
		   		$("#submitToCarrierAction").attr("disabled","true");
		   		$("#rejectAction").removeAttr("disabled");
		   		$("#acceptAction").removeAttr("disabled");
		   		$("#deleteAction").removeAttr("disabled");
		   		break;
		   		
		   		case 'CONFIRMED':
		   		$("#rejectAction").attr("disabled","true");
		   		$("#acceptAction").attr("disabled","true")
		   		$("#submitToCarrierAction").attr("disabled","true");
		   		$("#deleteAction").attr("disabled","true");
		   		break;
		   		
		   		case 'REJECTED':
		   		$("#acceptAction").attr("disabled","true")
		   		$("#rejectAction").attr("disabled","true")
		   		$("#submitToCarrierAction").removeAttr("disabled");
		   		$("#deleteAction").attr("disabled","true");
		   		break;
		   		
		   		case 'AMMENDED':
		   		$("#acceptAction").removeAttr("disabled")
		   		$("#rejectAction").removeAttr("disabled")
		   		$("#submitToCarrierAction").attr("disabled","true")
		   		$("#deleteAction").attr("disabled","true");
		   		break;
		   		
		   		}
		   })
		   
				  $(".btn").click(function(){
				  	var $input = $( this );
				  	var btnPress = $input.attr("btnPress");
				  	//alert('btnPress='+btnPress);
					$("#actionPerformed").val(btnPress);
				});
			});
		</script>
    </head>
    <body>
        <div class="boostrap">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:form role="form" method="post">
            <div class="content_inner">
				<label class="pagetitle">${warehouse.message(code: 'bookingList.label', default: 'Bookings')}</label>
			</div>
            <div class="list">
                <table class="table table-striped table-hover table-condensed">
                    <thead>
                        <tr>
                        	<th/>
                        	
                            <g:sortableColumn property="bookingNumber" title="${warehouse.message(code: 'booking.bookingNumber.label', default: 'Booking Number')}" />
                        
                            <g:sortableColumn property="bookingStatus" title="${warehouse.message(code: 'booking.bookingStatus.label', default: 'Booking Status')}" />
                        
                        	<g:sortableColumn property="originPort" title="${warehouse.message(code: 'booking.originPort.label', default: 'Departure Port')}" />
                        
                        	<g:sortableColumn property="destinationPort" title="${warehouse.message(code: 'booking.destinationPort.label', default: 'Arrival Port')}" />
                        
                            <g:sortableColumn property="plannedDepartureDate" title="${warehouse.message(code: 'booking.plannedDepartureDate.label', default: 'Departure Date')}" />
                        
                        	<g:sortableColumn property="plannedArrivalDate" title="${warehouse.message(code: 'booking.plannedArrivalDate.label', default: 'Arrival Date')}" />
                        
                            <g:isUserNotCarrier>
                            	<g:sortableColumn property="carrier" title="${warehouse.message(code: 'booking.carrier.label', default: 'Carrier')}" />
                        	</g:isUserNotCarrier>
                        	
                        	<g:sortableColumn property="vessel" title="${warehouse.message(code: 'booking.vesselvoyage.label', default: 'Vessel-Voyage#')}" />
                        
                        	<g:sortableColumn property="shipFrom" title="${warehouse.message(code: 'booking.shipFrom.label', default: 'Origin')}" />
                        	
                        	<g:sortableColumn property="shipTo" title="${warehouse.message(code: 'booking.shipTo.label', default: 'Destination')}" />
                        
                           %{-- <th><warehouse:message code="booking.numOfContainers.label" default="# of containers" /></th> --}%
                           
                           <th/>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:form action="list" method="post">
                    	<tr>
                    		<td/>
	                    	<td>
	                    		<g:textField style="width:50px" id="bookingNumber" name="bookingNumberFilter" value="${bookingNumberFilter}"/>
	                    	</td>
	                    	<td>
	                    		<g:select style="width:75px" id="bookingStatus" name="statusFilter" value="${statusFilter}" from="${com.cimbidia.wm.booking.BookingStatus}" noSelection="['': '']"/>
	                    	</td>
	                    	<td>
	                    		<g:selectPort style="width:100px" id="originPort" name="originPortFilter" value="${originPortFilter}" noSelection="['': '']"/>
	                    	</td>
	                    	<td>
	                    		<g:selectPort style="width:100px" id="destinationPort" name="destinationPortFilter" value="${destinationPortFilter}" noSelection="['': '']"/>
	                    	</td>
	                    	<td style="width:30px">
	                    		<g:jqueryDatePicker size="10" showOn="focus" id="plannedDepartureDate" name="plannedDepartureDateFilter" value="${plannedDepartureDateFilter}" format="MM/dd/yyyy"/>
	                    		
	                    	</td>
	                    	<td>
	                    		<g:jqueryDatePicker size="10" showOn="focus" showTrigger="false" id="plannedArrivalDate" name="plannedArrivalDateFilter" value="${plannedArrivalDateFilter}" format="MM/dd/yyyy"/>
	                    		
	                    	</td>
	                    	 <g:isUserNotCarrier>
		                    	<td>
		                    		 <g:selectOceanCarrier style="width:75px" id="carrier" name="carrierFilter" value="${carrierFilter}"  noSelection="['': '']"/>
		                    	</td>
	                    	 </g:isUserNotCarrier>
	                    	<td>
	                    		<g:textField style="width:100px" id="vessel" name="vesselFilter" value="${vesselFilter}"  />
	                    	</td>
	                    	<td>
	                    		<g:autoSuggest width="125" id="shipFrom" name="shipFromFilter"
										jsonUrl="${request.contextPath}/json/locationLookup"
										valueId="${shipFromFilterId}"
										valueName="${shipFromFilterName}"
										styleClass="text"/>
	                    	</td>
	                    	<td>
	                    		<g:autoSuggest width="125" id="shipTo" name="shipToFilter"
										jsonUrl="${request.contextPath}/json/locationLookup"
										valueId="${shipToFilterId}"
										valueName="${shipToFilterName}"
										styleClass="text"/>
	                    	</td>
	                    	<td>
	                    		<button name="filter" class="btn btn-success">
									<warehouse:message code="default.button.filter.label"/>
								</button>
	                    	</td>
                    	</tr>
                    </g:form>
                    <g:each in="${bookingInstanceList}" status="i" var="bookingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td>
								<input type="radio" id="bookingInstance_${i}" value="${bookingInstance.id}" status="${bookingInstance.bookingStatus}" name="id"/>
								
							</td>
							
                           <td>${fieldValue(bean: bookingInstance, field: "bookingNumber")}</td>
                        
                            <td>${fieldValue(bean: bookingInstance, field: "bookingStatus")}</td>
                            
                            <td>${fieldValue(bean: bookingInstance, field: "originPort")}</td>
                            
                            <td>${fieldValue(bean: bookingInstance, field: "destinationPort")}</td>
                            
                            <td>${fieldValue(bean: bookingInstance, field: "plannedDepartureDate")}</td>
                            
                            <td>${fieldValue(bean: bookingInstance, field: "plannedArrivalDate")}</td>
                            
                            <g:isUserNotCarrier>
                            	<td>${fieldValue(bean: bookingInstance, field: "carrier")}</td>
                        	 </g:isUserNotCarrier>
                        	 
                            <td>${fieldValue(bean: bookingInstance, field: "vessel")}- ${fieldValue(bean: bookingInstance, field: "voyageNumber")}</td>
                        
                            <td>${fieldValue(bean: bookingInstance, field: "shipFrom")}</td>
                            
                             <td>${fieldValue(bean: bookingInstance, field: "shipTo")}</td>
                        
                          %{--  <td>${fieldValue(bean: bookingInstance, field: "numOfContainers")}</td> --}%
                          	<td/>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookingInstanceTotal}" />
            </div>
            <div id="delete" class="right">
           		<input type="hidden" id="actionPerformed" name="actionPerformed"/>
				<g:hiddenField name="fromPage" value="list"/>		
				<g:if test="${bookingInstanceList?.size() > 0}">				
					<g:actionSubmit id="deleteAction" class="btn" btnPress="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'delete')}" />
					<g:actionSubmit id="rejectAction" class="btn" btnPress="reject" action="reject" value="${warehouse.message(code: 'default.button.reject.label', default: 'reject')}" />
				%{--	<g:actionSubmit  id="acceptAction" class="btn" btnPress="accept" action="accept" value="${warehouse.message(code: 'default.button.accept.label', default: 'accept')}" /> --}%
					<g:actionSubmit  id="submitToCarrierAction" class="btn" btnPress="submitToCarrier" action="submitToCarrier" value="${warehouse.message(code: 'default.button.submitToCarrier.label', default: 'Submit To Carrier')}" />
					<g:actionSubmit id="editAction"class="btn" btnPress="edit"  action="edit" value="${warehouse.message(code: 'default.button.edit.label', default: 'edit')}" />
				</g:if>
			</div>
			</g:form>
        </div>
    </body>
</html>