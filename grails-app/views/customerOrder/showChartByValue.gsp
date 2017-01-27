<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta name="layout" content="index" />
    <gui:resources components="['tabView']"/>

<style>
#myTab{
position : absolute;
width:200px;
top:150px;
}
#showData{
position : absolute;
width:300px;
Height:300px;
top:350px;
left:500px;
}
</style>
   
    <!--Load the AJAX API-->
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
    	  var dayData = google.visualization.arrayToDataTable([
    	                                                    ['year', 'SKU','country', 'Qty', 'Avl'],
    	                                                    [new Date(2011, 5, 1, 0) , '${productList[0].name}','Bolivia', 12, 5],
    	                                                    [new Date(2011, 5, 2, 0), '${productList[1].name}','Ecuador', 20, 7],
    	                                                    [new Date(2011, 5, 3, 0), '${productList[0].name}','Madagascar', 7, 3],
    	                                                    [new Date(2011, 5, 4, 0), '${productList[1].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2011, 5, 5, 0), '${productList[0].name}','Rwanda', 22, 6],
    	                                                    [new Date(2011, 5, 6, 0), '${productList[1].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2011, 5, 7, 0), '${productList[0].name}','Rwanda2', 42, 8],
    	                                                	[new Date(2011, 5, 8, 0), '${productList[1].name}','Papua New Guinea', 54, 2],
    	                                                    [new Date(2011, 5, 9, 0), '${productList[1].name}','Rwanda', 22, 6],
    	                                                    [new Date(2011, 5, 10, 0), '${productList[0].name}','Rwanda1', 3, 1],
    	                                                    [new Date(2011, 5, 11, 0), '${productList[0].name}','Rwanda2', 42, 8]
    	                                                  ]);


  
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
        google.visualization.events.addListener(dayComboChart, 'select', selectHandler);
        google.visualization.events.addListener(yearComboChart, 'onmouseout', selectHandler);
        function selectHandler(e) {
        	 $(".showData").show();
        	  var s = $('.google-visualization-controls-rangefilter-thumblabel').html();
    			alert(s);
        }
        
        new google.visualization.Dashboard(document.getElementById('yearDashboard')).bind(yearRangeSlider, yearComboChart).draw(yearData);
        new google.visualization.Dashboard(document.getElementById('yearDashboard')).bind(yearskuPicker, yearComboChart).draw(yearData);
        
        new google.visualization.Dashboard(document.getElementById('monthDashboard')).bind(monthRangeSlider, monthComboChart).draw(monthData);
        new google.visualization.Dashboard(document.getElementById('monthDashboard')).bind(monthskuPicker, monthComboChart).draw(monthData);
        new google.visualization.Dashboard(document.getElementById('weekDashboard')).bind(weekRangeSlider, weekComboChart).draw(weekData);
        new google.visualization.Dashboard(document.getElementById('weekDashboard')).bind(weekskuPicker, weekComboChart).draw(weekData);
        new google.visualization.Dashboard(document.getElementById('dayDashboard')).bind(dayRangeSlider, dayComboChart).draw(dayData);
        new google.visualization.Dashboard(document.getElementById('dayDashboard')).bind(dayskuPicker, dayComboChart).draw(dayData);
      }
		
			
      
    </script>
  </head>
  <body>
     <div style="padding-left:100px;width:300px;top:350px">
     
<gui:tabView id="myTab">
<gui:tab label="Yearly" active="true">
<!--Div that will hold the dashboard-->
    ${location.name}
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
          
          <td style='width: 600px'>
          	   
          		<div style="float: left;width: 800px;height: 300px" id="monthChart"></div>
                
            
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
          
          <td style='width: 600px'>
          
          	<div style="float: left;width: 800px;height: 300px" id="weekChart"></div>
           
            
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
          
          <td style='width: 600px'>
          	<div style="float: left;width: 800px;height: 300px" id="dayChart"></div>
          </td>
        </tr>
        <tr><td> <div id="dayFilter"></div></td></tr>
      </table>
    </div>

</gui:tab>
</gui:tabView>
<div id="showData" class="showData">
<table border="1">

<tr><td>On Hand</td><td>50,000 units</td></tr>
<tr><td>Committed to Orders</td><td>10,000 units</td></tr>
<tr><td>Available</td><td>40,000 units</td></tr>
<tr><td>Ordered</td><td>20,000 units</td></tr>
<tr><td>Expected Demand</td><td>40,000 units</td></tr>
<tr><td>Expected Receipts</td><td>20,000 units</td></tr>
<tr><td>Projected On Hand</td><td>40,000 units</td></tr>
</table>
</div>
</div>

<script type="javascript">
YAHOO.util.Event.onDOMReady(function(){
var buttons = ['button0','button1','button2','button3'];
for (i in buttons) {
YAHOO.util.Event.on(buttons[i], 'click', function(e) {
GRAILSUI.myTabView.set('activeIndex', e.target.value);
});
};
});
</script></body>
</html>