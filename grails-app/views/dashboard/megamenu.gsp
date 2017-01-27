<%@page import="com.cimbidia.wm.core.ActivityCode"%>
<%@page import="com.cimbidia.wm.shipment.Shipment"%>
<%@ page import="com.cimbidia.wm.core.RoleType" %>
<%@ page import="com.cimbidia.wm.booking.BookingStatus" %>
<style>

 
.menu-header {
    -moz-box-sizing: border-box;
	width: 100% !important;
	height: 100%;
	background-color: lightblue;
}
.trademark {
	
	margin-left: 2px;
	font-size: larger;
	font-weight: bolder;
	font-style: italic;
	font-family: cambria(body);
		
}
.dropdown a{
color: white !important;
height: 20px;
}
.dropdown{
padding-bottom: 12px;

}
.dropdown-menu{
background-color: lightblue;
padding : 0px 0px !important;
}
.dropdown-menu li{
background-color: lightblue;

}
.dropdown-menu ul{
background-color: lightblue;

}
.dropdown-toggle{
background-color: #ADD8E6;

}
.megaButton{
background-color: lightblue;

}
.nav navbar-nav dropdown dropdown-menu{
background-color: lightblue;
}
div.boostrap .navbar-inverse .navbar-nav > .open > a,
div.boostrap .navbar-inverse .navbar-nav > .open > a:hover,
div.boostrap .navbar-inverse .navbar-nav > .open > a:focus {
color: lightblue;
background-color: #4f81bd; 
}
div.boostrap hr {
margin-top: 0px;
margin-bottom: 0px;
border: 1px;
border-top: 2px solid white;

 }
 .action-menu-item {
 z-index: 999 !important;
 }
</style>





<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
	<div style="position: relative; overflow: hidden;"
		class="menu-header">
		
			<div style="height: 100%; width: 100%;">
				<div class="v-expand" style="padding-top: 0px;">
					<div style="height: 50%; margin-top: 0px;">
						<g:link controller="dashboard" action="index" id="${session.user.id }" style="color: #666;">
						<img src="${resource(dir: 'images', file: 'cimbidia.png')}">
						</g:link>
						<input type="text" tabindex="0" style="width: 350px; margin-left: 200px;">
						<button style="top:4px;height:24px">Search</button>
					
					<ul class="nav navbar-nav" style="float:right; z-index:1000">
						<g:if test="${session.user}">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" style="background-color: #ADD8E6;"> <i class="fa fa-user"></i>&nbsp;&nbsp;
									<span id="username">
										${session?.user?.name}
								</span> <span id="userrole">: <g:userRole user="${session.user}" /></span>
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="dropdownMenu1">

									<li class="action-menu-item"><a id="fullscreen-button"
										href="#">Full Screen</a></li>
									<li class="action-menu-item"><g:link controller="user"
											action="show" id="${session.user.id }" style="color: #666;">
											<img
												src="${resource(dir: 'images/icons/silk', file: 'user.png')}" />
											<warehouse:message code="editProfile.label"
												default="Edit profile" />
										</g:link></li>
									<li class="action-menu-item"><g:link
											controller="dashboard" action="index" style="color: #666;">
											<img
												src="${resource(dir: 'images/icons/silk', file: 'application_view_tile.png')}" />
											<warehouse:message code="dashboard.label" default="Dashboard" />
										</g:link></li>
									<g:isUserAdmin>
										<g:if test="${session._showTime}">
											<li class="action-menu-item"><g:link
													controller="dashboard" action="index"
													params="[showTime:'off']" style="color: #666;">
													<img
														src="${resource(dir: 'images/icons/silk', file: 'clock_delete.png')}" />
													<warehouse:message code="dashboard.disableShowTime.label"
														default="Disable show time" />
												</g:link></li>
										</g:if>
										<g:else>
											<li class="action-menu-item"><g:link
													controller="dashboard" action="index"
													params="[showTime:'on']" style="color: #666;">
													<img
														src="${resource(dir: 'images/icons/silk', file: 'clock_add.png')}" />
													<warehouse:message code="dashboard.enableShowTime.label"
														default="Enable show time" />
												</g:link></li>
										</g:else>
										<g:if test="${session.useDebugLocale }">
											<li class="action-menu-item"><g:link controller="user"
													action="disableDebugMode" style="color: #666;">
													<img
														src="${resource(dir: 'images/icons/silk', file: 'bug_delete.png')}" />
													${warehouse.message(code:'debug.disable.label', default: 'Disable debug mode')}
												</g:link></li>
										</g:if>
										<g:else>
											<li class="action-menu-item"><g:link controller="user"
													action="enableDebugMode" style="color: #666;">
													<img
														src="${resource(dir: 'images/icons/silk', file: 'bug_add.png')}" />
													${warehouse.message(code:'debug.enable.label', default: 'Enable debug mode')}
												</g:link></li>
										</g:else>
										<li class="action-menu-item"><g:link
												controller="dashboard" action="flushCache"
												style="color: #666">
												<img
													src="${resource(dir: 'images/icons/silk', file: 'arrow_refresh.png')}" />
												${warehouse.message(code:'cache.flush.label', default: 'Flush cache')}
											</g:link></li>
									</g:isUserAdmin>

									<g:if test="${session?.warehouse}">

										<li class="action-menu-item"><a
											href="javascript:void(0);" class="warehouse-switch"
											style="color: #666"> <img
												src="${resource(dir: 'images/icons/silk', file: 'map.png')}" />
												<warehouse:message code="dashboard.changeLocation.label"
													default="Change location" />
										</a> <span id="warehouseMenu"
											title="${warehouse.message(code:'dashboard.chooseLocation.label')}"
											style="display: none; padding: 10px;">

												<div style="max-height: 400px; overflow: auto;">
													<table>
														<g:set var="count" value="${0 }" />

														<g:each var="entry" in="${session.loginLocationsMap}"
															status="i">
															<tr class="prop">
																<td class="name"><g:if test="${!entry?.key }">
																		<h3>
																			${warehouse.message(code: 'default.others.label', default: 'Others')}
																		</h3>
																	</g:if> <g:else>
																		<h3>
																			${entry.key }
																		</h3>
																	</g:else></td>
																<td class="value">
																	<div>
																		<g:each var="warehouse" in="${entry.value.sort() }">
																			<div class="left" style="margin: 1px;">
																				<g:set var="targetUri"
																					value="${(request.forwardURI - request.contextPath) + '?' + (request.queryString?:'') }" />
																				<a class="button"
																					href='${createLink(controller: "dashboard", action:"chooseLocation", id: warehouse.id, params:['targetUri':targetUri])}'>
																					<format:metadata obj="${warehouse}" />

																				</a>
																			</div>
																		</g:each>
																	</div>
																</td>
															</tr>
														</g:each>
													</table>

													<g:unless test="${session.loginLocationsMap }">
														<div style="background-color: black; color: white;"
															class="warehouse button">
															<warehouse:message code="dashboard.noWarehouse.message" />
														</div>
													</g:unless>
												</div>

										</span></li>
									</g:if>
									<li class="action-menu-item">
										<hr />
									</li>
									<li class="action-menu-item"><g:link class="list"
											controller="auth" action="logout" style="color:#666">
											<img
												src="${resource(dir: 'images/icons/silk', file: 'door.png')}"
												class="middle" />
											<warehouse:message code="default.logout.label" />
										</g:link></li>


								</ul></li>


						</g:if>

					</ul>
				</div>
					
					<%--<div class="trademark" style="height: 50%;">
						Cimbidia&trade;
					</div>
					
				--%></div>
				</div>
		
		
	</div>

    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>


 <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation" style="background-color:rgb(79, 129, 189);">

	<ul class="nav navbar-nav" >
		
		<g:isUserNotCarrier>
	     
	
	<g:authorize activity="[ActivityCode.PLACE_ORDER,ActivityCode.FULFILL_ORDER]">	
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link  class="dropdown-toggle" data-toggle="dropdown" controller="order" action="list" class="list">			
				<i class="fa fa-shopping-cart"></i> 
				<warehouse:message code="po.label" default="Purchase Orders"/>
			</g:link>
			<ul  class="dropdown-menu">
			  <li>
			    <g:link controller="purchaseOrderWorkflow" action="index" class="create">
				Create Purchase Order
			    </g:link>
			    </li>
			    <li>
			    <g:link controller="order" action="createshipments" class="create">
				<warehouse:message code="shipment.plan.create.label"/>
			    </g:link>
			    </li>
			<hr/>
				<li>
						<g:link controller="order" action="list" params="[status:'NEW']" class="list"><warehouse:message code="order.list.label"/></g:link>
					</li>
					<g:each in="${incomingOrders}" var="orderStatusRow">
						<li class="megaButton">
							<g:link controller="order" action="list" params="[status:orderStatusRow[0]]" class="order-status-${orderStatusRow[0] }">
								<format:metadata obj="${orderStatusRow[0]}"/> (${orderStatusRow[1]})
							</g:link>
						</li>					
					</g:each>
			</ul>
		</li>
	</g:authorize>
	<g:authorize activity="[ActivityCode.PLACE_ORDER,ActivityCode.FULFILL_ORDER]">	
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link  class="dropdown-toggle" data-toggle="dropdown" controller="order" action="list" class="list">			
				<i class="fa fa-shopping-cart"></i> 
				<warehouse:message code="so.label" default="Customer Orders"/>
			</g:link>
			<ul  class="dropdown-menu">
			  <li>
			    <g:link controller="purchaseOrderWorkflow" action="index" class="create">
				<warehouse:message code="order.create.label"/>
			    </g:link>
			    </li>
			    <li>
			    <g:link controller="order" action="createshipments" class="create">
				<warehouse:message code="shipment.plan.create.label"/>
			    </g:link>
			    </li>
			<hr/>
				<li>
						<g:link controller="order" action="list" params="[status:'PLACED']" class="list"><warehouse:message code="order.list.label"/></g:link>
					</li>
					<g:each in="${incomingOrders}" var="orderStatusRow">
						<li class="megaButton">
							<g:link controller="order" action="list" params="[status:orderStatusRow[0]]" class="order-status-${orderStatusRow[0] }">
								<format:metadata obj="${orderStatusRow[0]}"/> (${orderStatusRow[1]})
							</g:link>
						</li>					
					</g:each>
			</ul>
		</li>
	</g:authorize>
			<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="shipment" action="list" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="transporation.label" default="Transportation Order" />
			</g:link>
			<ul class="dropdown-menu" style="min-width: 200px;">
			<li class="megaButton">
			    <g:link controller="shipment" action="transportationOrdersList"  class="create"><warehouse:message code="transportations.label"/></g:link>
			</li>
			<hr/>
			
			</ul>

		</li>
	</g:authorize>
		</g:isUserNotCarrier>
		<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="shipment" action="list" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="asn.label" default="ASNs"/>
			</g:link>
			<ul class="dropdown-menu" style="min-width: 200px;">
			<li class="megaButton">
			    <g:link controller="createShipmentWorkflow" action="createShipment"  class="create"><warehouse:message code="shipping.createOutgoingShipment.label"/></g:link>
			</li>
			<hr/>
			<li class="megaButton">
						<g:link controller="shipment" action="list"  class="list">
				    <warehouse:message code="shipping.listOutgoing.label"  default="List outgoing shipments"/>
			    </g:link>
			</li>
			
			<li class="megaButton">
			    <g:link controller="shipment" action="list"  class="list">
				All (${outgoingShipmentsCount})
			    </g:link>
			</li>
					<g:each in="${outgoingShipments}" var="statusRow">
						<li class="megaButton">
							<g:link controller="shipment" action="list" params="[status:statusRow.key]" class="shipment-status-${statusRow.key }">
								<format:metadata obj="${statusRow.key}"/> (${statusRow.value.size()})
							</g:link>
						</li>
					</g:each>
				</ul>

		</li>
	</g:authorize>
	<g:if test="${session.companyTypeId != 9}">	
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="shipment" action="list" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="shipment.label" default="Shipments" />
			</g:link>
			<ul class="dropdown-menu" style="min-width: 200px;">
			<li class="megaButton">
			    <g:link controller="shipment" action="create"  class="create"><warehouse:message code="shipping.createOutgoingShipment.label"/></g:link>
			</li>
			<hr/>
			<g:if test="${session.companyTypeId == 8}">
			<li class="megaButton">
						<g:link controller="shipment" action="list"  class="list">
				    <warehouse:message code="shipping.listOutgoing.label"  default="List outgoing shipments"/>
			    </g:link>
			</li>
			</g:if>
			<g:if test="${session.companyTypeId == 10}">
			<li class="megaButton">
						<g:link controller="shipment" action="carrierShiplist"  class="list">
				    <warehouse:message code="CarrierShipping.carrierShipment.label"  default="Carrier shipments"/>
			    </g:link>
			</li>
			</g:if>
			<%--<li class="megaButton">
			    <g:link controller="shipment" action="list"  class="list">
				All (${outgoingShipmentsCount})
			    </g:link>
			</li>
					<g:each in="${outgoingShipments}" var="statusRow">
						<li class="megaButton">
							<g:link controller="shipment" action="list" params="[status:statusRow.key]" class="shipment-status-${statusRow.key }">
								<format:metadata obj="${statusRow.key}"/> (${statusRow.value.size()})
							</g:link>
						</li>
					</g:each>--%>
					</ul>

		</li>
	</g:authorize>
	</g:if>
	
	<g:authorize activity="[ActivityCode.CREATE_EDIT_BOOKING, ActivityCode.CONFIRM_BOOKING]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="booking" action="list">
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="booking.label" default="Bookings"/>
			</g:link>
			<ul  class="dropdown-menu">
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
		  	</ul>
		</li>
	</g:authorize>
	
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="shipment" action="list" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="appointments.label" default="Appointments"/>
			</g:link>
			

		</li>
	</g:authorize>
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="shipment" action="list" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="invoice.label" default="Visibility"/>
			</g:link>
			

		</li>
	</g:authorize>
	<g:authorize activity="[ActivityCode.SEND_STOCK]">
		<li class="dropdown" style="border:solid 1px white; border-radius:5px">
			<g:link class="dropdown-toggle" data-toggle="dropdown" controller="message" action="chat" >
				<i class="fa fa-sign-out"></i> 
				<warehouse:message code="invoice.label" default="CimChat"/>
			</g:link>
			<ul  class="dropdown-menu">
				<li>
				     <g:link controller="message" action="chat">
					Chat
			   		</g:link>
		    	</li>
			  	
		  	</ul>
	
		</li>
	</g:authorize>
	
	
	
	<li class="dropdown" style="border:solid 1px white; border-radius:5px;"><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> 
			<i class="fa fa-check"></i> 
				<warehouse:message code="setting.label" default="Settings"/></a>
				<ul  class="dropdown-menu">
                    <li class="megaButton">
                        <g:link controller="console" action="index" class="list">
                            <warehouse:message code="default.console.label" default="Open console" />
                        </g:link>
                    </li>
                    <li class="megaButton">
                        <g:link controller="admin" action="manage" class="list">
                            <warehouse:message code="default.appinfo.label" default="Show app-info" />
                        </g:link>
                    </li>
                    <li class="megaButton">
                        <g:link controller="admin" action="cache" class="list">
                            <warehouse:message code="default.cache.label" default="Show cache" />
                        </g:link>
                    </li>
                    <li class="megaButton">
                        <g:link controller="admin" action="clickstream" class="list">
                            <warehouse:message code="default.clickstream.label" default="Show clickstream" />
                        </g:link>
                    </li>
                     <li class="megaButton">
                        <g:link controller="message" action="list" class="list">
                            <warehouse:message code="default.message.label" default="Show Messages" />
                        </g:link>
                    </li>
					<g:authorize activity="[ActivityCode.MANAGE_INVENTORY]">
						<li class="megaButton">
							<g:link controller="admin" action="showSettings" class="list">
								<warehouse:message code="default.manage.label"
									args="[warehouse.message(code:'default.settings.label')]" />
							</g:link>
						</li>
					</g:authorize>

                    <div>
                        <hr/>
                    </div>

					<li class="megaButton">
						<g:link controller="locationGroup" action="list" class="site">
							<warehouse:message code="location.sites.label" />
						</g:link>
					</li>
					<li class="megaButton">
						<g:link controller="location" action="list" class="location">
							<warehouse:message code="locations.label" />
						</g:link>
					</li>
					<li class="megaButton">
						<g:link controller="company" action="list" class="shipper">
							Companies
						</g:link>
					</li>
					<li class="megaButton">
						<g:link controller="locationType" action="list"
							class="locationType">
							<warehouse:message code="location.locationTypes.label" />
						</g:link>
					</li>
					<li class="megaButton">
					</li>
					<li class="megaButton">
						<g:link controller="routingGuide" action="list" class="routingGuide">
							Routing Guide
						</g:link>
					</li>
					<li class="megaButton">
						<g:link controller="equipment" action="list"
							class="locationType">
							<warehouse:message code="equipment.label" />
						</g:link>
					</li>
		             <li class="megaButton">
                        <g:link controller="requisitionTemplate" action="list" class="list">
                            <warehouse:message code="requisitionTemplates.label" default="Stock lists" />
                            <%--(${requisitionTemplates.size()})--%>
                        </g:link>
                    </li>

					<div>
						<hr/>
					</div>
					<li class="megaButton">
						<g:link controller="person" action="list" class="people">
							<warehouse:message code="person.list.label" />
						</g:link>
					</li>					
					<li class="megaButton">
						<g:link controller="user" action="list" class="user">
							<warehouse:message code="users.label" />
						</g:link>
					</li>
                    <hr/>
					<li class="megaButton">
						<g:link controller="inventory" action="listAllTransactions" class="list"><warehouse:message code="transactions.label"/></g:link> 
					</li>										
					<li class="megaButton">
						<g:link controller="inventory" action="editTransaction" class="create"><warehouse:message code="transaction.add.label"/></g:link> 				
					</li>
                    <hr/>
					<li class="megaButton">
						<g:link controller="blog" action="list" class="list"><warehouse:message code="blog.label" default="Forums"/></g:link> 
					</li>										
		</ul>
	</li>
	<%--</g:isUserAdmin>



--%></ul>

	

</nav> 
</header>