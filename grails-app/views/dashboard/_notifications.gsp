<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Notification</title>

</head>
<body>
<style>
ul li ul {
    display: none;
}
</style>
	<script>

$(document).ready(function(){  
	
	$('.notification_list >li label').click(function(e){
		
	 if($(this).parent().find('ul').css('display')=='none'){
		
           $('.notification_list > li > ul').hide();
		 
        $(this).parent().find('ul').show();
		$(this).parent().find('label').addClass('impact_head');
		//$(this).parent().addClass('impact');
		//$(this).parent().find('label').attr('style', 'background-color: red !important');
		$(this).parent().attr('style', 'background-image: linear-gradient(to bottom, #0c98df 0%,#0b74ae 38%,#0b74ae 98%); width:100%; padding:0px');
		$(this).parent().find('label').attr('style','background:url(/cimbidiaSCM/images/down_arrow.png)  no-repeat right 12px; background-image: red !important');
		        
    }else{
            $('.notification_list > li > ul').hide();
			//$(this).parent().removeClass('impact');
			$(this).parent().find('label').removeClass('impact_head');
			$(this).parent().find('label').attr('style','background:url(/cimbidiaSCM/images/arrow-rgt.png) no-repeat right; color:white;');
			
			$(this).parent().attr('style', 'background-image: linear-gradient(to bottom, #93b4bc 0%,#9fc4cc 100%);');
    }
});
});
</script>
	
           <ul class="notification_list">
           <li>
           <span class="doller red">!</span>
           <label style="color:white">Potential West Coast Port Labor Strike</label>
				<ul>
	    	  
				
			   <section class="impact_box">
			   <section class="impact_box_inner">
				<strong>Ports Impacted</strong></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Long Beach</span></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Los Angels</span></br>
				<strong>Shipments Impacted/Week</strong></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; 100 Container Loads</span></br>
					</br>
				<strong>Potential Alternate Ports</strong></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Puerto Vallarta </span></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; San Carlos</span></br>
					</br>
				<strong>Customers Impacted</strong></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Amazon </span></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Best Buy</span></br>
					</br>	
					<p>
					
					</p>
					<%--<section class="more">
					<a href="#">More Detail...</a>
					<span class="comment note" >
					<img alt="" src="/cimbidiaSCM/images/comment.png">
					</span>
				--%></ul>
           </li>
           <li>
           <span class="doller red">!</span>
           <label style="color:white">Shipment Delay in Customs  - Long Beach Port</label>
				<ul>
	    	  
				
			   <section class="impact_box">
			   <section class="impact_box_inner">
				<strong>Shipments Impacted</strong></br>

					<span style="font:century-gothic; font-size:14px;color:blue">Click </span><span>here to view list of Shipments</span></br>
					
				<strong>Products Impacted</strong></br>

					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Nexus 4</span></br>
					<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Nexus 5</span></br>
					</br>
				<strong>Customers Impacted</strong></br>

				<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Amazon </span></br>
				<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Best Buy</span></br>
					<%--<p>
					
					</p>
					<section class="more">
					<a href="#">More Detail...</a>
					<span class="comment note" >
					<img alt="" src="/cimbidiaSCM/images/comment.png">
					</span>
				--%></ul>
           </li>
           <li>
           <span class="doller red">!</span>
           <label style="color:white">Items below Safety Stock</label>
				<ul>
	    	  <section class="impact_box">
			   <section class="impact_box_inner">
				<table>
				<tr><th>Item</th><th>Location</th><th>Safety Stock</th><th>Available</th></tr>
				<tr><td>Nexus 10</td><td>Kuehne Nagel GA</td><td>200</td><td>180</td></tr>
				<tr><td>Nexus 7</td><td>Damco Shen Zhen</td><td>300</td><td>250</td></tr>
				<tr><td>Chromecast</td><td>Menlo Shanghai</td><td>40</td><td>39</td></tr>
				
				</table>
			   </section></section>
				</ul>
           </li>
           <li>
             <span class="doller red">!</span>
			 <label style="color:white">Chromecast In the News</label>
           <ul>
	    	  
				
			   <section class="impact_box">
			   <section class="impact_box_inner">
				
					<p>
					<img src="/cimbidiaSCM/images/chromecast.png" alt="" width="300px"/>
					 
					</p>
					<section class="more">
					<a href="https://www.google.co.in/?gfe_rd=cr&ei=OCdOU474BYnV8gfamIHIDw#q=google+news+chromecast+&tbm=nws">More Detail...</a>
					
				</ul>
			   </li>
			 
			   <li>
			   <span class="doller red">!</span>
			   <label style="color:white">Payments Overdue from Customers</label>
			   <ul>
	    	  
				
			   <section class="impact_box">
			   <section class="impact_box_inner">
				<strong>Total Invoices Overdue</strong></br>

					<span style="font:century-gothic; font-size:14px">$136M</span></br></br>
				<strong>Customers</strong></br>

				<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; Best Buy</span></br>
				<span style="font:century-gothic; font-size:14px">.&nbsp;&nbsp;&nbsp;&nbsp; DNS</span></br></br>
				<strong>Contacts</strong></br>

					<span style="font:century-gothic; font-size:14px;color:blue">.&nbsp;&nbsp;&nbsp;&nbsp;Jack Grahm </span><span>– Best Buy</span></br>
					<span style="font:century-gothic; font-size:14px;color:blue">.&nbsp;&nbsp;&nbsp;&nbsp;Lynda Jones</span><span> – DNS</span></br>
					</br>
				<%--<strong>Customers</strong></br>

				<span style="font:century-gothic; font-size:14px">. Best Buy</span></br>
				
					<p>
					<img src="http://www.tropicalstormrisk.com/tracker/dynamic/images/201405W.png" alt="" width="300px"/>
					 
					</p>
					<section class="more">
					<a href="http://www.naturaldisastersnews.net/alert-monitoring/currents-alerts-warnings/1968-tropical-storm-activity-report-north-western-pacific-ocean-tropical-storm-peipath">More Detail...</a>
					<span class="comment note" >
					<img alt="" src="/cimbidiaSCM/images/comment.png">
					</span>
				--%></ul>
			   </li>
			   
           </ul>
           <section class="down_list">
           <img src="/cimbidiaSCM/images/down-list.jpg" alt="" />
           </section>
            
</body>
</html>