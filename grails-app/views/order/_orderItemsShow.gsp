<script type="text/javascript">
    var childCount = ${orderInstance?.orderItems.size()} + 0;
 	
    function addOrderItem(){
      var clone = $("#orderItem_clone").clone()
      var htmlId = 'orderItems['+childCount+'].';
      var orderItemInput = clone.find("input[id$=number]");
 	
      
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      clone.find("input[id$=product]")
      .attr('id',htmlId + 'product')
      .attr('name',htmlId + 'product');
     
      clone.find("input[id$=pc]")
      .attr('id',htmlId + 'pc')
      .attr('name',htmlId + 'pc');
      
      clone.find("input[id$=description]")
      .attr('id',htmlId + 'description')
      .attr('name',htmlId + 'description');
     
      clone.find("input[id$=size1]")
      .attr('id',htmlId + 'size1')
      .attr('name',htmlId + 'size1');
      
      clone.find("input[id$=size4Uom]")
      .attr('id',htmlId + 'size4Uom')
      .attr('name',htmlId + 'size4Uom');

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
    
      orderItemInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');
 
      clone.attr('id', 'orderItem'+childCount);
      $("#childList").append(clone);
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
 
<div id="childList">
    <g:each var="orderItem" in="${orderInstance.orderItems}" status="i">
   		
        <!-- Render the orderItem template (_orderItem.gsp) here -->
        <g:render template='orderItemShow' model="['orderItem':orderItem,'i':i,'hidden':false]"/>
        <!-- Render the orderItem template (_orderItem.gsp) here -->
    </g:each>
    
</div>
