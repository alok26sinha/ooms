
<div class="boostrap">
<div class="panel panel-primary">
	
	<div class="panel-heading panel-primary">		
		<div class="dropdown pull-right">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<img src="${resource(dir: 'images/icons/silk', file: 'cog.png')}" style="vertical-align: middle"/>
		</a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation" class="action-menu-item">
                        <g:link controller="dashboard" action="index" class="${!params.daysToInclude || params.daysToInclude.equals('3')?'selected':''}" params="[daysToInclude:3]">
                            <img src="${createLinkTo(dir:'images/icons/silk',file:'application_view_list.png')}" alt="View requests" style="vertical-align: middle" />
                            <warehouse:message code="dashboard.lastThreeDays.label" default="Edit My Watch List"/></g:link>
                    </li>
                </ul>
               </div>
		<h5><warehouse:message code="inventory.alerts.label" default="My Watch List"/></h5>
	</div>	    			
	<div class="widget-content" style="padding:0; margin:0">	    					    			
		<div id="alertSummary">	

    		<table class="zebra">
    			<tbody>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/exclamation.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="shipment" action="list">
                                <warehouse:message code="shipment.delayed.label" default="Delayed Shipments"/>
                            </g:link>
                        </td>
                        <td class="right">
                        		5
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/exclamation.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="order" action="list" params="[sort: 'description', order: 'asc',status: 'PENDING']">
                                <warehouse:message code="shipment.delayed.label" default="Orders waiting to be approved"/>
                            </g:link>
                        </td>
                        <td class="right">
                        		3
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/exclamation.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="order" action="listNewMessages" params="[sort: 'description', order: 'asc',status: 'ACCEPTED']">
                                <warehouse:message code="shipment.delayed.label" default="Orders with new messages"/>
                            </g:link>
                        </td>
                        <td class="right">
                        	2
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/exclamation.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="shipment" action="list">
                                <warehouse:message code="shipment.delayed.label" default="Shipments with new messages"/>
                            </g:link>
                        </td>
                        <td class="right">
                        	0
                        </td>
                    </tr>

                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/exclamation.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="inventory" action="listOutOfStock">
                                <warehouse:message code="inventory.listOutOfStock.label" default="Items that have stocked out"/>
                            </g:link>
                        </td>
                        <td class="right">
                            <div id="outOfStockCount"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>

                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/error.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="inventory" action="listLowStock">
                                <warehouse:message code="inventory.listLowStock.label" default="Items that are below minimum level"/>
                            </g:link>
                        </td>
                        <td class="right">
                            <div id="lowStockCount"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>
                        </td>
                    </tr>

					<tr>
						<td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/creditcards.png')}" class="middle"/>
						</td>
						<td>
                            <g:link controller="inventory" action="listReorderStock">
                                <warehouse:message code="inventory.listReorderStock.label" default="Items that are below reorder level"/>
							</g:link>
						</td>
						<td class="right">
							<div id="reorderStockCount"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>
						</td>
					</tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/package.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="inventory" action="listOverStock">
                                <warehouse:message code="inventory.listOverStock.label" default="Items that are over stocked"/>
                            </g:link>
                        </td>
                        <td class="right">
                            <div id="overStockCount"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/box.png')}" class="middle"/>
                        </td>
                        <td>
                            <g:link controller="inventory" action="listQuantityOnHandZero">
                                <warehouse:message code="inventory.listQuantityOnHandZero.label" default="Items that have QoH equal to zero"/>
                            </g:link>
                        </td>
                        <td class="right">
                            <div id="onHandQuantityZeroCount"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>

                        </td>
                    </tr>

				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

