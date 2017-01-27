<script type="text/javascript">
 function addStops(){
        alert('add stops');
      var clone = $("#shipmentSize_clone").clone()
      var htmlId = 'shipmentSizes['+childCount+'].';
      var shipmentSizesInput = clone.find("input[id$=number]");
 	
      
      clone.find("input[id$=quantity]")
              .attr('id',htmlId + 'quantity')
              .attr('name',htmlId + 'quantity');
      clone.find("input[id$=uom]")
              .attr('id',htmlId + 'uom')
              .attr('name',htmlId + 'uom')
              .attr('value', 'true');
     
    
      shipmentSizesInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      
      clone.attr('id', 'shipmentSize'+childCount);
      $("#childListStop").append(clone);
      clone.show();
      orderItemInput.focus();
      childCount++;
      
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-orderItem').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".orderItem-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }        
    });
 
</script>
<div id="childListStop">
<%--<g:each var="shipmentStop" in="${shipmentInstance.shipmentStops}" status="i">
    
        <!-- Render the shipment stop template (_shipmentStop.gsp) here-->
        <g:render template='shipmentStop' model="['shipmentStop':shipmentStop,'i':i,'hidden':false]"/>
        <!-- Render the shipment stop template (_shipmentStop.gsp) here -->
    </g:each>--%>
</div>
<div><a onclick="addStops()"><label><warehouse:message code="shipping.addstop.label"/></label></a></div>