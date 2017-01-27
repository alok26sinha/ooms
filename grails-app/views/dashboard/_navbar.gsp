<%@page import="com.cimbidia.wm.core.ActivityCode"%>
<%@page import="com.cimbidia.wm.shipment.Shipment"%>
<%@ page import="com.cimbidia.wm.core.RoleType" %>
<%@ page import="com.cimbidia.wm.booking.BookingStatus" %>
<nav class="nav_back">
            <section class="header_inner">
            	<ul class="nav" >
		
		<g:isUserNotCarrier>
	     
	
	<g:authorize activity="[ActivityCode.PLACE_ORDER,ActivityCode.FULFILL_ORDER]">	
		<li >
			<g:link  data-toggle="dropdown" controller="order" action="list" class="list">			
				
				<warehouse:message code="po.label" default="Purchase Orders"/>
			</g:link>
			<ul  style=" z-index:9999999;">
			  <li>
			    <g:link controller="purchaseOrderWorkflow" action="index" class="create">
				Create Purchase Order
			    </g:link>
			    </li>
			    
			
				<li>
						<g:link controller="order" action="list"  class="list"><warehouse:message code="order.list.label"/></g:link>
					</li>
					<g:each in="${incomingOrders}" var="orderStatusRow">
						<li >
							<g:link controller="order" action="list"  class="order-status-${orderStatusRow[0] }">
								<format:metadata obj="${orderStatusRow[0]}"/> (${orderStatusRow[1]})
							</g:link>
						</li>					
					</g:each>
			</ul>
		</li>
	</g:authorize>
	<g:if test="${session.companyTypeId == 8}">
	<g:authorize activity="[ActivityCode.PLACE_ORDER,ActivityCode.FULFILL_ORDER]">	
		<li style="z-index:9999999;">
			<g:link  data-toggle="dropdown" controller="customerOrder" action="list" class="list">			
				
				<warehouse:message code="so.label" default="Order Fufillment"/>
			</g:link>
			<ul style=" z-index:9999999;" >
			  <li >
			    <g:link controller="customerOrder" action="create" class="create">
				<warehouse:message code="order.create.label"/>
			    </g:link>
			  </li>
			  <li style= >
				<g:link controller="customerOrder" action="list"  class="list"><warehouse:message code="customerOrder.list.label"/></g:link>
			  </li>
					<g:each in="${incomingOrders}" var="orderStatusRow">
						<li >
							<g:link controller="order" action="list" params="[status:orderStatusRow[0]]" class="order-status-${orderStatusRow[0] }">
								<format:metadata obj="${orderStatusRow[0]}"/> (${orderStatusRow[1]})
							</g:link>
						</li>					
					</g:each>
			  
			  <li >
			    <g:link controller="fulfillmentType" action="list" >
				<warehouse:message code="fulfillmentType.list.label" default="Fulfillment Types" style="z-index:9999999;"/>
			    </g:link>
			  </li>
			  <li >
			    <g:link controller="sourcingRuleHdr" action="list" >
				<warehouse:message code="sourcingrule.list.label" default="Sourcing Rules" style="z-index:9999999;"/>
			    </g:link>
			  </li>
			  <li >
			    <g:link controller="allocationRule" action="list" >
				<warehouse:message code="allocationRule.list.label" default="Allocation Rules" style="z-index:9999999;"/>
			    </g:link>
			  </li>
			  <li >
			    <g:link controller="allocationTemplate" action="create" >
				<warehouse:message code="allocationTemplate.create.label" default="Allocation Template"/>
			    </g:link>
			  </li>
			
				
			</ul>
		</li>
	</g:authorize>
	</g:if>		
		
		
	<g:if test="${session.companyTypeId != 9}">	
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li >
			<g:link data-toggle="dropdown" controller="shipment" action="list" >
				
				<warehouse:message code="shipments.label" default="Transportation Planning" />
			</g:link>
			<ul style=" z-index:9999999;" >
			<li >
			    <g:link controller="rsDetail" action="list"  class="create"><warehouse:message code="shipping.rsdetail.label" default="Resource Selection"/></g:link>
			</li>
			<g:if test="${session.companyTypeId == 8}">
			<li >
						<g:link controller="shipment" action="list"  class="list">
				    <warehouse:message code="shipping.listOutgoing.label"  default="List outgoing shipments"/>
			    </g:link>
			</li>
			</g:if>
			
			<g:if test="${session.companyTypeId == 10}">
			<li >
				<g:link controller="shipment" action="carrierShiplist"  class="list">
				    <warehouse:message code="CarrierShipping.carrierShipment.label"  default="Carrier shipments"/>
			    </g:link>
			</li>
			</g:if>
			
			
			<li >
			    <g:link controller="shipment" action="transportationOrdersList"  class="create"><warehouse:message code="transportations.label"/></g:link>
			</li>
			
			<li >
			    <g:link controller="shipment" action="filterTOList"  class="create"><warehouse:message code="transportationsFilter.label"/></g:link>
			</li>
			</ul>

		</li>
	</g:authorize>
	</g:if>
	
	<g:authorize activity="[ActivityCode.CREATE_EDIT_BOOKING, ActivityCode.CONFIRM_BOOKING]">
		<li >
			<g:link data-toggle="dropdown" controller="booking" action="list">
				 
				<warehouse:message code="booking.label" default="Multi Modal"/>
			</g:link>
			<ul style=" z-index:9999999;" >
				<li>
				     <g:link controller="booking" action="list">
					Bookings
			   		</g:link>
		    	</li>
			  	<li>
				     <g:link controller="booking" action="create" params="[bookingStatus:BookingStatus.NEW]">
					Create Booking
			   		</g:link>
		    	</li>
		    	<li>
				     <g:link controller="bookingForecast" action="summary">
					Booking Forecast
			   		</g:link>
		    	</li>
			  	<li>
				     <g:link controller="bookingForecast" action="createBookingFromForecast">
					Create Bookings from Forecast
			   		</g:link>
		    	</li>
			  	
		  	</ul>
		</li>
	</g:authorize>
	
	
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li >
			<g:link data-toggle="dropdown" controller="shipment" action="list" >
				 
				<warehouse:message code="invoice.label" default="Visibility"/>
			</g:link>
			<ul style=" z-index:9999999;" >
				<li>
				     <g:link controller="location" action="showMap" id="${session.companyId}">
					<warehouse:message code="location.inventoryVisibility.label" default="Visibility"/>
			   		</g:link>
		    	</li>
		    	<li>
				     <g:link controller="inventory" action="list" id="${session.companyId}">
					<warehouse:message code="inventory.invlist.label" default="Inventory List"/>
			   		</g:link>
		    	</li>
		    	<li>
				     <g:link controller="inventory" action="aggregatedValueList" id="${session.companyId}">
					<warehouse:message code="inventory.aggregated.label" default="Aggregated Inventory By Value"/>
			   		</g:link>
		    	</li>
		    	<li>
				     <g:link controller="inventory" action="safetyStockAssociatedCost" id="${session.companyId}">
					<warehouse:message code="inventory.detailed.label" default="Detailed Inventory By Value"/>
			   		</g:link>
		    	</li>
		    	<li>
				     <g:link controller="inventory" action="safetyStockList" id="${session.companyId}">
					<warehouse:message code="inventory.safetystock.label" default="Inventory with Safety Stock"/>
			   		</g:link>
		    	</li>
		    	
		    	<li>
				     <g:link controller="inventory" action="safetyStockAssociatedList" id="${session.companyId}">
					<warehouse:message code="inventory.safetystock.label" default="Time Phased Inventory View"/>
			   		</g:link>
		    	</li>
		    	
		    	
			  	
		  	</ul>

		</li>
	</g:authorize>
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li >
			<g:link data-toggle="dropdown" controller="shipment" action="list" >
				 
				<warehouse:message code="invoice.label" default="Supply Chain Network"/>
			</g:link>
			<ul style=" z-index:9999999;" >
				<li>
				     <g:link controller="location" action="showMap" id="${session.companyId}">
					<warehouse:message code="location.node.label" default="Node Map"/>
			   		</g:link>
		    	</li>
		    	<li >
						<g:link controller="locationGroup" action="list" class="site">
							<warehouse:message code="location.sites.label" />
						</g:link>
					</li>
					<li >
						<g:link controller="location" action="list" class="location">
							<warehouse:message code="locations.label" />
						</g:link>
					</li>
					<li >
						<g:link controller="locationType" action="list"
							class="locationType">
							<warehouse:message code="location.locationTypes.label" />
						</g:link>
					</li>
			  		<li >
						<g:link controller="routingGuide" action="list" class="routingGuide">
							Routing Guide
						</g:link>
					</li>
					<li >
						<g:link controller="ratingLane" action="list" class="ratingLane">
							Rating Lane
						</g:link>
					</li>
					<li >
						<g:link controller="routingGuide" action="routeLookup" class="ratingLane">
							Rate Lookup
						</g:link>
					</li>
					<li >
						<g:link controller="routingGuide" action="fedexRateLookup" class="ratingLane">
							Fedex Route Lookup
						</g:link>
					</li>
		  	</ul>

		</li>
	</g:authorize>
		
	
	
	<li ><a data-toggle="dropdown" href="javascript:void(0)"> 
			
				<warehouse:message code="setting.label" default="Settings"/></a>
				<ul style=" z-index:9999999;" >
                    
					

                   

					
					
					<li >
						<g:link controller="company" action="list" class="shipper">
							Companies
						</g:link>
					</li>
					
					<li >
						<g:link controller="shipper" action="list" class="shipper">
							Carriers
						</g:link>
					</li>
					
					<li >
						<g:link controller="equipment" action="list"
							class="locationType">
							<warehouse:message code="equipment.label" default="Equipment" />
						</g:link>
					</li>
		             

					<li >
						<g:link controller="person" action="list" class="people">
							<warehouse:message code="contacts.list.label" default="Contacts" />
						</g:link>
					</li>					
					<li >
						<g:link controller="user" action="list" class="user">
							<warehouse:message code="users.label" />
						</g:link>
					</li>
                  
														
		</ul>
            </section>
            </g:isUserNotCarrier>
      </nav>