<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cimbidia</title>
<link rel="stylesheet" type="text/css" media="all" href="${createLinkTo(dir:'css',file:'style.css')}" >

<meta name="layout" content="index" />

</head>
<body>
    	
        <section class="content">
        	<section class="content_inner">
            <section class="header_inner">
            <span class="dashboard">
            Dashboard
            </span>
            <span class="work">
            My Work
            </span>
            <span class="message">
           	Cim Collab
            </span>
            </section>
            </section>
            
            <section class="header_inner">
            <section class="inventory">
            
       		<div id="chart" style="height:600px">
       		 <g:render template="chart" />
       		</div>
       		
            </section>
            <section class="work_content">
            <ul>
            <li><a href="/cimbidiaSCM/customerOrder/list?status=ACKNOWLEDGED" style="text-decoration: none !important;">
            	<figure class="count_no">${dashboard.unCommittedCustomerOrderCount}</figure>
                <p>Uncommitted <br />Customer<br />Orders</p></a>
            </li>
            <li class="rgt"><a href="/cimbidiaSCM/order/list?status=NEW" style="text-decoration: none !important;">
                <figure class="count_no">${dashboard.newOrderCount}</figure>
                <p>POs<br />Waiting <br />Release</p></a>
            </li>
            <li><figure class="count_no">4</figure>
                <p>Delayed<br/>Orders</p>
            </li>
            <li class="rgt"><a href="/cimbidiaSCM/inventory/safetyStockList" style="text-decoration: none !important;">
            
                <p>Inventory<br />Safety<br/>Stock<br/>Information</p></a>
            </li><%--
            <li><a href="/cimbidiaSCM/order/list?status=NEW" style="text-decoration: none !important;">
            	<figure class="count_no">${dashboard.newOrderCount}</figure>
                <p>POs<br />Awaiting<br />Release</p></a>
            </li>
                
            <li><a href="/cimbidiaSCM/shipment/intransitShipment" style="text-decoration: none !important;">
              	<figure class="count_no">${dashboard.inTansitShipCount}</figure>
              	<p>Shipments<br />In-Transit<br /></p></a>
                </li>--%>
             <li><a href="/cimbidiaSCM/shipment/noAssignCarrierList" style="text-decoration: none !important;">
            	<figure class="count_no">${dashboard.unassignedShipmentCount}</figure>
                <p>Unassigned<br />Shipments<br /></p>
            </li>
            
            <li class="rgt"><a href="/cimbidiaSCM/order/listByDaysOpen" style="text-decoration: none !important;">
            	<figure class="count_no">${dashboard.daysOpen}</figure>
                <p>POs  <br />open for<br />30 days or more</p></a>
            </li>
                
            <li><a href="/cimbidiaSCM/customerOrder/list?status=BACKORDERED" style="text-decoration: none !important;">
            	<figure class="count_no">${dashboard.backOrderedCustomerOrderCount}</figure>
                <p>Backordered <br />Customer<br />Orders</p></a>
            </li>
                <li class="rgt"><a href="/cimbidiaSCM/customerOrder/list?status=NEW" style="text-decoration: none !important;"><figure class="count_no">${dashboard.acknowledgeCustOrderCount}</figure>
                <p>Customer  <br />
Order To<br />
Acknowledge
                </p></a></li>
            </ul>
            <span class="plus">
            +
            </span>
             
            </section>
             <section class="">
            
            <g:render template="/message/messages"/>
              	
                      
           
            </section>
        </section>
        
       
 		<div id="dialog-msgtrail" title="Messages" style="display:none">
 		 	 <g:render template="/message/msgtrail" />
		</div>
		
		
</body>
</html>
