<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load('visualization', '1.1', {packages: ['controls']});
google.setOnLoadCallback(drawVisualization);

function drawVisualization() {
    // Prepare the data
    var dayData =  google.visualization.arrayToDataTable(${chartdate});/* google.visualization.arrayToDataTable([
        ['Year', 'Name','Lname', 'VarX', 'VarY'],
        ['2008', 'Paul','a', 12, 5],
        ['2008', 'Ann', 's',20, 7],
        ['2009', 'Paul','D', 7, 3],
        ['2009', 'Ann','G', 54, 2],
        ['2010', 'Ann', 'H',22, 6],
        ['2010', 'Paul', 'J',3, 1],
        ['2011', 'Ann', 'R',42, 8],
        ['2011', 'Paul', 'S',33, 6]
    ]);*/
    
    // Define a category picker control for the Name column
    var categoryPicker = new google.visualization.ControlWrapper({
        controlType: 'CategoryFilter',
        containerId: 'control1',
        options: {
            filterColumnLabel: 'SKU',
            ui: {
                labelStacking: 'vertical',
                allowTyping: false,
                allowMultiple: true
            }
        }
    });
    
    // Define a Column chart
    var column = new google.visualization.ChartWrapper({
        chartType: 'ColumnChart',
        containerId: 'chart1',
        options: {
            width: 300,
            height: 300,
            legend: 'none',
            title: 'Quantity',
            chartArea: {
                left: 15,
                top: 15,
                right: 0,
                bottom: 0
            }
        }
    });

    // Define a table
    var table = new google.visualization.ChartWrapper({
        dataTable: dayData,
        chartType: 'Table',
        containerId: 'chart2',
        options: {
            width: '300px'
         
        }

    });

    // create event handler for updating ColumnChart
    google.visualization.events.addListener(table, 'ready', function () {
        var newData = table.getDataTable();
        var grouped = google.visualization.data.group(newData, [0], [{
            column:3,
            aggregation: google.visualization.data.sum,
            type:'number'
        }]);
        column.setDataTable(grouped);
        column.draw();
    });
    
    // Create a dashboard
    var dashboard = new google.visualization.Dashboard(document.getElementById('dashboard'));
    // Establish bindings, declaring the both the slider and the category
    // picker will drive both charts.
    // edit: drive only the table from the picker
    dashboard.bind(categoryPicker, [table]);
    
    // create event handler to set the column chart's columns based on the checkboxes
 /*   google.visualization.events.addListener(dashboard, 'ready', function () {
        var form = document.getElementById('selectform');
        for (var i = 0; i < form['varCheck'].length; i++) {
            form['varCheck'][i].onclick = function () {
                var selectedCols = [0];
                for (var j = 0; j < form['varCheck'].length; j++) {
                    if (form['varCheck'][j].checked) {
                        selectedCols.push(parseInt(form['varCheck'][j].value));
                    }
                }
                if (selectedCols.length == 1) {
                    alert('You must select at least one variable to chart!');
                }
                else {
                    column.setView({columns: selectedCols});
                    column.draw();
                }
            };
        }
    });
*/

	google.visualization.events.addListener(column, 'select', function() {
		
  		chartObject = column.getChart();
  		dispDivChartDetail(chartObject);
  	});
    google.visualization.events.addListener(table, 'select', function() {
		
  		chartObject = table.getChart();
  		dispDivChartDetail(chartObject);
  	});

    function dispDivChartDetail(chartObject) {
  		//alert(dayData.getValue(chartObject.getSelection()[0].row, 0)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 1)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 2)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 3)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 3)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 5)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 6)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 7)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 8)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 9)+" ,"+dayData.getValue(chartObject.getSelection()[0].row, 10));
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
  		// $("#showData").show();
		}
    
    // Draw the entire dashboard.
    dashboard.draw(dayData);
}
</script>
<style>
.chart2
{
    display: none;
}
</style>
</head>
<body>
<div id="dashboard">
    <table>
        <tr style='vertical-align: top'>
            <td style='width: 300px; font-size: 0.9em;'>
                <div id="control1"></div>
                <form id="selectform">
                  <%-- Quantity: <input id="VarX" type="checkbox" name="varCheck" value="1" checked="checked" />
                   Available: <input id="VarY" type="checkbox" name="varCheck" value="2" checked="checked" />
                --%></form>
            </td>
            
        </tr>
         <tr style='vertical-align: top'>
        <td style='width: 300px'>
                <div style="float: left;" id="chart1"></div>
                 <div style="float: left;display:none" id="chart2"></div>
                <div style="float: left;" id="chart3"></div>
            </td>
            </tr>
    </table>
</div>

<div id="showData" class="showData">

</div>
</body>
</html>