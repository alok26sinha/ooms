<script type="text/javascript">
var childCount = ${shipmentInstance?.shipmentSizes.size()} + 0;

    function addSize(){
        
      var clone = $("#shipmentSize_clone").clone()
      var htmlId = 'shipmentSize['+childCount+'].';
      var shipmentSizesInput = clone.find("input[id$=number]");
 	
      
      clone.find("input[id$=quantity]")
              .attr('id',htmlId + 'quantity')
              .attr('name',htmlId + 'quantity');

      clone.find("input[id$=id]")
      .attr('id',htmlId + 'id')
      .attr('name',htmlId + 'id');
      
      clone.find("select[id$=uom\\.id]")
              .attr('id',htmlId + 'uom.id')
              .attr('name',htmlId + 'uom.id')
              .attr('value', 'true');
     
    
      shipmentSizesInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      
      clone.attr('id', 'shipmentSize'+childCount);
      $("#childList1").append(clone);
      clone.show();
      shipmentSizesInput.focus();
      childCount++;
      
    }
 
    
 
</script>
<div id="childList1">
<g:each var="shipmentSize" in="${shipmentInstance.shipmentSizes}" status="i">
    
        <!-- Render the shipment size template (_shipmentSize.gsp) here-->
        <g:render template='shipmentSize' model="['shipmentSize':shipmentSize,'i':i,'hidden':false]"/>
        <!-- Render the shipment size template (_shipmentSize.gsp) here -->
    </g:each>
</div>
<table><tr><td>
<div><a onclick="addSize()"><label><warehouse:message code="shipping.addSize.label"/></label></a></div>
</td>
</tr></table>