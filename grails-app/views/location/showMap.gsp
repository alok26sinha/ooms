<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="index" />
	 <gui:resources components="['tabView']"/>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="javascript">
		YAHOO.util.Event.onDOMReady(function(){
		var buttons = ['button0','button1','button2','button3'];
			for (i in buttons) {
				YAHOO.util.Event.on(buttons[i], 'click', function(e) {
				GRAILSUI.myTabView.set('activeIndex', e.target.value);
			});
		};
	});
</script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the controls package.
      google.load('visualization', '1.0', {'packages':['controls']});

      // Set a callback to run when the Google Visualization API is loaded.
     google.setOnLoadCallback(drawDashboard);

      // Callback that creates and populates a data table,
      // instantiates a dashboard, a range slider and a pie chart,
      // passes in the data and draws it.
      		$(function(){
      			
      			 $('.showData').hide();
      			 $("#inventoryDiv").hide();
				 $("#locationDiv").hide();
      		});
      function drawDashboard() {
    	 
			
		      
    	  var yearData = google.visualization.arrayToDataTable([
    	                                                    ['year', 'SKU','country', 'Qty', 'Avl'],
    	                                                    [new Date(2001, 5, 1, 0) , '${productList[0].name}','Bolivia', 12, 5],
    	                                                    [new Date(2002, 5, 1, 0), '${productList[1].name}','Ecuador', 20, 7],
    	                                                    [new Date(2003, 5, 1, 0), '${productList[1].name}','Madagascar', 7, 3],
    	                                                    [new Date(2004, 5, 1, 0), '${productList[0].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2005, 5, 1, 0), '${productList[1].name}','Rwanda', 22, 6],
    	                                                    [new Date(2006, 5, 1, 0), '${productList[0].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2007, 5, 1, 0), '${productList[0].name}','Rwanda2', 42, 8],
    	                                                	[new Date(2008, 5, 1, 0), '${productList[1].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2009, 5, 1, 0), '${productList[0].name}','Rwanda', 22, 6],
    	                                                    [new Date(2010, 5, 1, 0), '${productList[1].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[0].name}','Rwanda2', 42, 8]
    	                                                  ]);
    	  var monthData = google.visualization.arrayToDataTable([
    	                                                    ['year', 'SKU','country', 'Qty', 'Avl'],
    	                                                    [new Date(2011, 5, 1, 0) , '${productList[0].name}','Bolivia', 12, 5],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[0].name}','Ecuador', 20, 7],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[1].name}','Madagascar', 7, 3],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[0].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[1].name}','Rwanda', 22, 6],
    	                                                    [new Date(2011, 5, 1, 0), '${productList[0].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2011, 8, 1, 0), '${productList[1].name}','Rwanda2', 42, 8],
    	                                                	[new Date(2011, 9, 1, 0), '${productList[0].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2011, 10, 1, 0), '${productList[1].name}','Rwanda', 22, 6],
    	                                                    [new Date(2011, 11, 1, 0), '${productList[1].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2011, 12, 1, 0), '${productList[0].name}','Rwanda2', 42, 8]
    	                                                  ]);
    	  var weekData = google.visualization.arrayToDataTable([
    	    	                                                    ['year', 'SKU','country', 'Qty', 'Avl'],
    	    	                                                    [new Date(2011, 5, 1, 0) , '${productList[0].name}','Bolivia', 12, 5],
    	    	                                                    [new Date(2011, 5, 8, 0), '${productList[1].name}','Ecuador', 20, 7],
    	    	                                                    [new Date(2011, 5, 15, 0), '${productList[0].name}','Madagascar', 7, 3],
    	    	                                                    [new Date(2011, 5, 22, 0), '${productList[1].name}','Papua New Guinea', 54, 2],
    	    	                                                    [new Date(2011, 5, 29, 0), '${productList[0].name}','Rwanda', 22, 6],
    	    	                                                    [new Date(2011, 6, 5 ,0), '${productList[1].name}','Rwanda1', 3, 1],
    	    	                                                    [new Date(2011, 6, 12, 0), '${productList[0].name}','Rwanda2', 42, 8],
    	    	                                                	[new Date(2011, 6, 19, 0), '${productList[1].name}','Papua New Guinea', 54, 2],
    	    	                                                    [new Date(2011, 6, 26, 0), '${productList[1].name}','Rwanda', 22, 6],
    	    	                                                    [new Date(2011, 7, 3, 0), '${productList[1].name}','Rwanda1', 3, 1],
    	    	                                                    [new Date(2011, 7, 10, 0), '${productList[0].name}','Rwanda2', 42, 8]
    	    	                                                  ]);
    	  var dayData = google.visualization.arrayToDataTable(${chartdate});


  
        // Create a dashboard.
        //var dashboard = new google.visualization.Dashboard(
            //document.getElementById('yearDashboard'));

     // Create a range slider, passing some options
        var yearRangeSlider = new google.visualization.ControlWrapper({
          'controlType': 'DateRangeFilter',
          'containerId': 'yearFilter',
          'options': {
		  'formatType' :'short',
            'filterColumnLabel': 'year',
			'ui.step' : 'year',
	  			'ui.label' :''
	  		}
        });
        var monthRangeSlider = new google.visualization.ControlWrapper({
            'controlType': 'DateRangeFilter',
            'containerId': 'monthFilter',
            'options': {
  		  'formatType' :'short',
              'filterColumnLabel': 'year',
  			'ui.step' : 'month',
	  			'ui.label' :''
            }
          });
        var weekRangeSlider = new google.visualization.ControlWrapper({
            'controlType': 'DateRangeFilter',
            'containerId': 'weekFilter',
            'options': {
  		  'formatType' :'short',
              'filterColumnLabel': 'year',
  			'ui.step' : 'week',
  	  			'ui.label' :''
            }
          });
        var dayRangeSlider = new google.visualization.ControlWrapper({
            'controlType': 'DateRangeFilter',
            'containerId': 'dayFilter',
            'options': {
  		  'formatType' :'short',
              'filterColumnLabel': 'year',
  			'ui.step' : 'day',
	  			'ui.label' :''
            }
          });
		var yearskuPicker = new google.visualization.ControlWrapper({
          'controlType': 'CategoryFilter',
          'containerId': 'yearControl',
          'options': {
            'filterColumnLabel': 'SKU',
            'ui': {
              'labelStacking': 'vertical',
              'allowTyping': false,
              'allowMultiple': false
            }
          }
        });
		var monthskuPicker = new google.visualization.ControlWrapper({
	          'controlType': 'CategoryFilter',
	          'containerId': 'monthControl',
	          'options': {
	            'filterColumnLabel': 'SKU',
	            'ui': {
	              'labelStacking': 'vertical',
	              'allowTyping': false,
	              'allowMultiple': false
	            }
	          }
	        });
		var weekskuPicker = new google.visualization.ControlWrapper({
	          'controlType': 'CategoryFilter',
	          'containerId': 'weekControl',
	          'options': {
	            'filterColumnLabel': 'SKU',
	            'ui': {
	              'labelStacking': 'vertical',
	              'allowTyping': false,
	              'allowMultiple': false
	            }
	          }
	        });
		var dayskuPicker = new google.visualization.ControlWrapper({
	          'controlType': 'CategoryFilter',
	          'containerId': 'dayControl',
	          'options': {
	            'filterColumnLabel': 'SKU',
	            'ui': {
	              'labelStacking': 'vertical',
	              'allowTyping': false,
	              'allowMultiple': false
	            }
	          }
	        });
		

        // Create a pie chart, passing some options
        var yearComboChart = new google.visualization.ChartWrapper({
    'chartType': 'ComboChart',
    'containerId': 'yearChart',
    'options': {
      'width': 300,
      'height': 300,
	  vAxis: {title: "Qty"},
          hAxis: {title: "Year"},
          seriesType: "bars",
      'title': 'Inventory per SKU'
    },
    // The pie chart will use the columns 'Name' and 'Donuts eaten'
    // out of all the available ones.
    'view': {'columns': [0, 3]}
  });
        var monthComboChart = new google.visualization.ChartWrapper({
            'chartType': 'ComboChart',
            'containerId': 'monthChart',
            'options': {
              'width': 300,
              'height': 300,
        	  vAxis: {title: "Qty"},
                  hAxis: {title: "Year"},
                  seriesType: "bars",
              'title': 'Inventory per SKU'
            },
            // The pie chart will use the columns 'Name' and 'Donuts eaten'
            // out of all the available ones.
            'view': {'columns': [0, 3]}
          });
        var weekComboChart = new google.visualization.ChartWrapper({
            'chartType': 'ComboChart',
            'containerId': 'weekChart',
            'options': {
              'width': 300,
              'height': 300,
        	  vAxis: {title: "Qty"},
                  hAxis: {title: "Year"},
                  seriesType: "bars",
              'title': 'Inventory per SKU'
            },
            // The pie chart will use the columns 'Name' and 'Donuts eaten'
            // out of all the available ones.
            'view': {'columns': [0, 3]}
          });
        var dayComboChart = new google.visualization.ChartWrapper({
            'chartType': 'ComboChart',
            'containerId': 'dayChart',
            'options': {
              'width': 300,
              'height': 300,
        	  vAxis: {title: "Qty"},
                  hAxis: {title: "Year"},
                  seriesType: "bars",
              'title': 'Inventory per SKU'
            },
            // The pie chart will use the columns 'Name' and 'Donuts eaten'
            // out of all the available ones.
            'view': {'columns': [0, 3]}
            
          });


        // Establish dependencies, declaring that 'filter' drives 'pieChart',
        // so that the pie chart will only display entries that are let through
        // given the chosen slider range.
        //dashboard.bind(yearRangeSlider, yearComboChart);
		//dashboard.bind(yearskuPicker, yearComboChart);

        // Draw the dashboard.
        //dashboard.draw(yearData);
        google.visualization.events.addListener(yearComboChart, 'select', selectHandler);
        google.visualization.events.addListener(monthComboChart, 'select', selectHandler);
        google.visualization.events.addListener(weekComboChart, 'select', selectHandler);
       
        google.visualization.events.addListener(yearComboChart, 'onmouseout', selectHandler);
      

     
      
        
        new google.visualization.Dashboard(document.getElementById('yearDashboard')).bind(yearRangeSlider, yearComboChart).draw(yearData);
        new google.visualization.Dashboard(document.getElementById('yearDashboard')).bind(yearskuPicker, yearComboChart).draw(yearData);
        
        new google.visualization.Dashboard(document.getElementById('monthDashboard')).bind(monthRangeSlider, monthComboChart).draw(monthData);
        new google.visualization.Dashboard(document.getElementById('monthDashboard')).bind(monthskuPicker, monthComboChart).draw(monthData);
        new google.visualization.Dashboard(document.getElementById('weekDashboard')).bind(weekRangeSlider, weekComboChart).draw(weekData);
        new google.visualization.Dashboard(document.getElementById('weekDashboard')).bind(weekskuPicker, weekComboChart).draw(weekData);


        

       	var charty =  new google.visualization.Dashboard(document.getElementById('dayDashboard'));
       	charty.bind(dayRangeSlider, dayComboChart);
       	charty.draw(google.visualization.arrayToDataTable(${chartdate}));
       	
        var chrt = new google.visualization.Dashboard(document.getElementById('dayDashboard'));
        chrt.bind(dayskuPicker, dayComboChart)
    	

        google.visualization.events.addListener(dayComboChart, 'select', function() {
			
      		chartObject = dayComboChart.getChart();
      	
      		alert(dayData.getValue(chartObject.getSelection()[0].row, 0)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 1)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 2)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 3)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 3)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 5)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 6)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 7)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 8)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 9)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 10));
      		//String tblData = "<table><tr class=\"even\"><td>On Hand</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 5)+"</td></tr><tr class=\"odd\"><td>Committed to Orders</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 6)+"</td></tr><tr class=\"even\"><td>Available</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 4)+"</td></tr><tr class=\"odd\"><td>Ordered</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 7)+"</td></tr><tr class=\"even\"><td>Expected Demand</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 8)+"</td></tr><tr class=\"odd\"><td>Expected Receipts</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 9)+"</td></tr><tr class=\"even\"><td>Projected On Hand</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 3)+"</td></tr><tr class=\"even\"><td>Safety Stock</td><td>"+dayData.getValue(chartObject.getSelection()[0].row, 10)+"</td></tr><tr><td><a>More Details</a></td><td></td></tr></table>";
      		
      		var theDiv = document.getElementById("showData");
      		theDiv.innerHTML = "";
      		var table = document.createElement('table');   
      		   
      		var row = table.insertRow(0);
      	
      		var cell1 = row.insertCell(0);
      		var cell2 = row.insertCell(1);
      		cell1.innerHTML = "On Hand";
      		cell2.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 5);

      		var row1 = table.insertRow(1);
      		
      		var cell3 = row1.insertCell(0);
      		var cell4 = row1.insertCell(1);
      		cell3.innerHTML = "Committed to Orders";
      		cell4.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 6);

      		var row2 = table.insertRow(2);
      		var cell5 = row2.insertCell(0);
      		var cell6 = row2.insertCell(1);
      		cell5.innerHTML = "Available";
      		cell6.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 4);

      		var row3 = table.insertRow(3);
      		var cell7 = row3.insertCell(0);
      		var cell8 = row3.insertCell(1);
      		cell7.innerHTML = "Ordered";
      		cell8.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 7);
      		
      		var row4 = table.insertRow(4);
      		var cell9 = row4.insertCell(0);
      		var cell10 = row4.insertCell(1);
      		cell9.innerHTML = "Expected Demand";
      		cell10.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 8);
      		
      		var row5 = table.insertRow(5);
      		var cell11 = row5.insertCell(0);
      		var cell12 = row5.insertCell(1);
      		cell11.innerHTML = "Expected Receipts";
      		cell12.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 9);
      		
      		var row6 = table.insertRow(6);
      		var cell13 = row6.insertCell(0);
      		var cell14 = row6.insertCell(1);
      		cell13.innerHTML = "Projected On Hand";
      		cell14.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 3);
      		
      		var row7 = table.insertRow(7);
      		var cell15 = row7.insertCell(0);
      		var cell16 = row7.insertCell(1);
      		cell15.innerHTML = "Safety Stock";
      		cell16.innerHTML = dayData.getValue(chartObject.getSelection()[0].row, 10);
      		
      		var row8 = table.insertRow(8);
      		var cell17 = row8.insertCell(0);
      		var cell18 = row8.insertCell(1);
      		cell17.innerHTML = "<a>More details</a>";
      		cell18.innerHTML = "";
      		
      		row.style ="background: none repeat scroll 0% 0% #1AB7EA;";
      		row1.style ="background: none repeat scroll 0% 0% #D0D8E8 !important;";
      		row2.style ="background: none repeat scroll 0% 0% #1AB7EA;";
      		row3.style ="background: none repeat scroll 0% 0% #D0D8E8 !important;";
      		row4.style ="background: none repeat scroll 0% 0% #1AB7EA;";
      		row5.style ="background: none repeat scroll 0% 0% #D0D8E8 !important;";
      		row6.style ="background: none repeat scroll 0% 0% #1AB7EA;";
      		row7.style ="background: none repeat scroll 0% 0% #D0D8E8 !important;";
      		row8.style ="background: none repeat scroll 0% 0% #1AB7EA;";
      		
      		theDiv.appendChild( table )
      		 $("#showData").show();
  		});
    
      chrt.draw(google.visualization.arrayToDataTable(${chartdate}));
       


     
        function selectHandler(e) {
        	alert('A table row was selected');

        }

     
    }
		
			
      
    </script>
    <script type="text/javascript">
    $(document).ready(function() {	
  	  $("#inventory").hide();
    });
  
      google.load("visualization", "1", {packages:["map"]});
      google.setOnLoadCallback(drawMap);
      function drawMap() {
    	   
    	  
    	  
        var data = google.visualization.arrayToDataTable([
          ['Lat', 'Lon', 'Name'],
		<g:each var="location" in="${locations}" status="i">
		[${location.latitude }, ${location.longitude }, '${location.address.address }  ${location.address.city }  ${location.address.country }'],
		</g:each>
         ]);
         
        var map = new google.visualization.Map(document.getElementById('map_div'));
        map.draw(data, {showTip: true});
        google.visualization.events.addListener(map, 'select', selectHandler);
        <g:each var="location" in="${locations}" status="i">
        function selectHandler(e) {
        	$('.locationId').val('${location.id}');
            window.open(document.URL.replace("location/showMap","customerOrder/showChart"),"_self");
        } 
        </g:each>
      }
      function showInventory(value){
			if(value=='Inventory'){
				 $("#inventory").show();
				 $("#inventoryDiv").show();
				 $("#locationDiv").hide();
				}else if(value=='Locations/Nodes'){
					 $("#inventory").hide();
					 $("#inventoryDiv").hide();
					 $("#locationDiv").show();
				}else{
					 $("#inventoryDiv").hide();
					 $("#locationDiv").hide();
				}
          }
     
     
   </script>
    <style>
    #map_div{
    position:absolute;
    top:200px;
    left:100px;
    }
    label.select {
    color: #0C7EBB;
    font-family: Century Gothic,Arial,Helvetica,sans-serif;
    font-size: 12px;
    font-weight: bold;
}
#myTab{
position : absolute;
width:200px;
top:20px;
}
#showData{
position : absolute;
width:300px;
Height:300px;
top:450px;
position:relative;
}

    </style>
  </head>

  <body>
 
  <form>
  <input type="hidden" name="locationId" class="locationId" value="">
  <span class="content_inner">
  		<div class="pagetitle">
		<label>Supply Chain Visibility</label></div>
		</span>
		<%--<div class="right">

					<span class="plus">
			            +
			        </span>&nbsp;
			        	<span class="comment note" >
				            <img class="top" src="${resource(dir: 'images', file: 'comment.png')}">
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
	--%><div><table><tr><td style="width:35%"><table>
							<tr>
							<td align="right"><label class="select">VIEW MAP Of</label></td>
							<td><g:select name="viewType" from="${['Locations/Nodes', 'Inventory']}" value=""
          												valueMessagePrefix="viewType"noSelection="['':'']" onchange="showInventory(this.value)"/></td>
          												
							</tr>
							<tr>
							<td align="right"><label class="select">Select Product Group</label></td>
							<td><g:select name="productGroup" from="${['A42322344', 'A42322344','A42322344','A42322344']}"
          												valueMessagePrefix="productGroup" noSelection="['':'']"/></td>
          					
							</tr>
							<tr>
							<td align="right"><label class="select">Select SKU</label></td>
							<td><g:selectProduct  name="product.id" optionKey="id" value='' noSelection="['':'']" />	
							</td>
							</tr>
							</table>
							</td><td align="left">
							<div style="width:55%" id="locationDiv">
							<table><tr><td></td></tr>
							<tr>
							<td style="width:35%" align="left"><label class="select">Select Location Type</label></td>
							<td style="width:35%"><g:selectLocationType name="locationType" optionKey="id" value="" noSelection="['':'']"/></td>	
          					</tr>
							<tr>
							<td style="width:35%" align="left"><label class="select">Select Business Unit</label></td>
							<td style="width:35%"><g:selectBU name="bu" optionKey="bu" value="" noSelection="['':'']"/></td>		
							</tr>
							
							</table></div>
							<div style="width:55%" id="inventoryDiv">
							<table><tr><td></td></tr>
							<tr>
							<td style="width:35%" align="left"><label class="select">Location</label><g:selectLocation name="location" optionKey="id" value="" noSelection="['':'']"/></td>	
          					</tr>
							<tr>
							<td style="width:35%" align="left"><label class="select">Channel</label><g:select name="channel" from="${['channel', 'online','catalog','channel2']}"
          												valueMessagePrefix="channel" noSelection="['':'']"/></td>		
							</tr>
							
							</table></div>
							</td></table>
							</div>
							
							<div id="map_div" style="width: 800px; height: 600px;top:250px;"></div>
							
	<div style="width: 90%;position:relative;top:650px;left:100px">	
	<table><tr><td><label class="section-header">LOCATION INFORMATION</label></td></tr></table>				
    <table>
	<tr class="dtl-header">
	<td style="border:2px solid white !important;align:center"> 
	<input type="checkbox" name="shipmentCheck"  class="checkForId" id="" onchange="" />
	</td>
	<td style="border:2px solid white !important;"> <label></label></td>
	<td style="border:2px solid white !important;"> <label>Location Id</label></td>
	<td style="border:2px solid white !important;"> <label>Location Name</label></td>
	<td style="border:2px solid white !important;"> <label>Location Type</label></td>
	<td style="border:2px solid white !important;"> <label>Business Unit</label></td>
	<td style="border:2px solid white !important;"> <label>Contact</label></td>	
	<td style="border:2px solid white !important;"> <label>Location Status</label></td>					   
	</tr>
	<g:if test="${locations.size() != 0}">
	<g:each var="location" in="${locations}" status="i">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" class="prop" id="location${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
	<td style="border:2px solid white !important;align:center">
	<input type="checkbox" name="shipmentCheck"  class="checkForId" id="" onchange="" />
	</td>
	<td style="border:2px solid white !important;"></td>
	<td style="border:2px solid white !important;">${location?.name}</td>
    <td style="border:2px solid white !important;">${location?.address?.address}</td>
    <td style="border:2px solid white !important;">${location?.locationType?.name}</td>
    <td style="border:2px solid white !important;"></td>
    <td style="border:2px solid white !important;"></td>
    <td style="border:2px solid white !important;"></td>
    </tr>
    </g:each>
    </g:if>

</table>
    </div>
    
    <div  id="inventory" style="left:72%;top:27%;position:absolute;width:28%;height:80%">
   
        <table bgcolor="#0C7EBB"><tr><td><label style="color:white">Inventory DashBoard</label></td></tr></table>
    
<gui:tabView id="myTab">
<gui:tab label="Yearly" active="true">
<!--Div that will hold the dashboard-->
    ${location?.name}
    <div id="yearDashboard">
      <table>
      <tr><td> <div id="yearControl"></div></td></tr>
        <tr style='vertical-align: top'>
          
          <td>
          	
            <div style="float: left;" id="yearChart"></div>
           
          </td>
          
        </tr>
        <tr><td> <div id="yearFilter"></div></td></tr>
      </table>
    </div>
</gui:tab>
<gui:tab label="Monthly">
<div id="monthDashboard">
      <table>
      <tr><td> <div id="monthControl"></div></td></tr>
        <tr style='vertical-align: top'>
          
          <td style='width: 300px'>
          	   
          		<div style="float: left;" id="monthChart"></div>
                
            
          </td>
        </tr>
        <tr><td><div id="monthFilter"></div></td></tr>
      </table>
    </div>
</gui:tab>
<gui:tab label="Weekly">
<div id="weekDashboard">
      <table>
      <tr><td>	<div id="weekControl"></div></td></tr>
        <tr style='vertical-align: top'>
          
          <td style='width: 300px'>
          
          	<div style="float: left;" id="weekChart"></div>
           
            
          </td>
        </tr>
        <tr><td> <div id="weekFilter"></div></td></tr>
      </table>
    </div>
</gui:tab>
<gui:tab label="Daily">

<div id="dayDashboard">
      <table>
      <tr><td><div id="dayControl"></div></td></tr>
        <tr style='vertical-align: top'>
          
          <td style='width: 300px'>
          	<div style="float: left;" id="dayChart"></div>
          </td>
        </tr>
        <tr><td> <div id="dayFilter"></div></td></tr>
      </table>
    </div>

</gui:tab>
</gui:tabView>
<div id="showData" class="showData">

</div>
    </div>
    
  </form>
  </body>
</html>