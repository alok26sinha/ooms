<script type="text/javascript">
function addTO(){
	var childCount = ${shipmentInstance?.transportationOrders?.size()} + 0;
	var clone = $("#transportationOrder_clone").clone()
      var htmlId = 'transportationOrder['+childCount+'].';
      var toInput = clone.find("input[id$=number]");
 
      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
      		 .attr('id',htmlId + 'deleted')
             .attr('name',htmlId + 'deleted');
	  clone.find("input[id$=new]")
      		 .attr('id',htmlId + 'new')
      		 .attr('name',htmlId + 'new')
      		 .attr('value', 'true');
	  clone.find("input[id$=productName]")
    		 .attr('id',htmlId + 'productName')
		 	 .attr('name',htmlId + 'productName');

	  clone.find("input[id$=pc]")
             .attr('id',htmlId + 'pc')
			 .attr('name',htmlId + 'pc');

	  clone.find("input[id$=description]")
			 .attr('id',htmlId + 'description')
			 .attr('name',htmlId + 'description');

	 clone.find("input[id$=quantity]")
		     .attr('id',htmlId + 'quantity')
             .attr('name',htmlId + 'quantity');

	 clone.find("input[id$=sizes]")
            .attr('id',htmlId + 'sizes')
            .attr('name',htmlId + 'sizes');

	 clone.find("input[id$=uom]")
            .attr('id',htmlId + 'uom')
            .attr('name',htmlId + 'uom');

	 clone.find("input[id$=priceuom]")
			.attr('id',htmlId + 'priceuom')
		 	.attr('name',htmlId + 'priceuom');

		clone.find("input[id$=tempctrl]")
			.attr('id',htmlId + 'tempctrl')
			.attr('name',htmlId + 'tempctrl');
	
		clone.find("input[id$=perishable]")
			.attr('id',htmlId + 'perishable')
			.attr('name',htmlId + 'perishable');

		clone.find("input[id$=hazmat]")
			.attr('id',htmlId + 'hazmat')
			.attr('name',htmlId + 'hazmat');


      toInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');
 
      clone.attr('id', 'transportationOrder'+childCount);
      $("#childListTO").append(clone);
      clone.show();
      toInput.focus();
      childCount++;
    }
</script>


<div id="childListTO">
	<g:each var="transportationOrder" in="${shipmentInstance.transportationOrders}" status="i">

		<!-- Render the orderItem template (_transportationOder.gsp) here -->
		<g:render template='../transportationOrder/transportationOrder' model="['transportationOrder':transportationOrder,'i':i,'hidden':false]" />
		<!-- Render the orderItem template (_transportationOder.gsp) here -->
	</g:each>
	
</div>
<div style="float: right; margin-left: 98%">
	<%--<input type='button' value="Add" onclick="addTO();" />
	--%><a onclick="addTO()"><label>Add</label></a>
</div>
