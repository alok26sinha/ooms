<script type="text/javascript">

    var childCount = ${customerOrderInstance?.orderItems?.size()} + 0;
    
    var lineNum = childCount + 1;
 	
    function addOrderItem(){
      var clone = $("#orderItem_clone").clone()
      var htmlId = 'orderItems['+childCount+'].';
      var auid = 'orderItems'+childCount+'';
      var orderItemInput = clone.find("input[id$=number]");
 	
      
      clone.find("input[id$=total]")
              .attr('id',htmlId + 'total')
              .attr('name',htmlId + 'total');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      clone.find("input[id$=lineNum]")
      .attr('id',htmlId + 'lineNum')
      .attr('name',htmlId + 'lineNum')
      .attr('value', lineNum);
      
      clone.find("span[id$=product-span]")
      .attr('id',htmlId + 'product-span')
      //.attr('name',htmlId + 'origin-span');
	 
      clone.find("input[id$=product-value]")
     .attr('id',htmlId + 'product-value')
     .attr('name',htmlId + 'product.id');

      clone.find("input[id$=product-suggest]")
      .attr('id',htmlId + 'product-suggest')
      .attr('name',htmlId + 'product.name');
      clone.find("script").text(function (i, old) {
 	     return old
 	     	 
 	         .replace('_clone', itemChildCount)
 	                 
 	         .replace('_clone', itemChildCount)
 	                  
 	         .replace('_clone', itemChildCount)
 	                  
 	         .replace('_clone', itemChildCount)
 	               
 	         .replace('_clone', itemChildCount)
 	             
 	         .replace('_clone', itemChildCount)
 	         
 	         .replace('_clone', itemChildCount)
 	           
 	         .replace('_clone', itemChildCount)
    
 	         
 	         
 	});
        
      clone.find("span[id$=origin-span]")
      .attr('id',htmlId + 'origin-span');
      //.attr('name',htmlId + 'origin-span');
	 
      clone.find("input[id$=origin-value]")
     .attr('id',htmlId + 'origin-value')
     .attr('name',htmlId + 'origin.id');

      clone.find("input[id$=origin-suggest]")
      .attr('id',htmlId + 'origin-suggest')
      .attr('name',htmlId + 'origin.name');
      clone.find("script").text(function (i, old) {
 	     return old
 	     	 
 	         .replace('_clone', itemChildCount)
 	                 
 	         .replace('_clone', itemChildCount)
 	                  
 	         .replace('_clone', itemChildCount)
 	                  
 	         .replace('_clone', itemChildCount)
 	               
 	         .replace('_clone', itemChildCount)
 	             
 	         .replace('_clone', itemChildCount)
 	         
 	         .replace('_clone', itemChildCount)
 	           
 	         .replace('_clone', itemChildCount)
    
 	         
 	         
 	});
      
      clone.find("select[id$=origin\\.id]")
      .attr('id',htmlId + 'origin.id')
      .attr('name',htmlId + 'origin.id');
     
     clone.find("select[id$=product\\.id]")
     .attr('id',htmlId + 'product.id')
     .attr('name',htmlId + 'product.id');
     
        
      clone.find("select[id$=pc\\.id]")
      .attr('id',htmlId + 'pc.id')
      .attr('name',htmlId + 'pc.id');

       
      
      clone.find("input[id$=description]")
      .attr('id',htmlId + 'description')
      .attr('name',htmlId + 'description');
      
      clone.find("input[id$=quantity]")
      .attr('id',htmlId + 'quantity')
      .attr('name',htmlId + 'quantity');
      
      clone.find("input[id$=weight]")
      .attr('id',htmlId + 'weight')
      .attr('name',htmlId + 'weight');
      
      clone.find("input[id$=volume]")
      .attr('id',htmlId + 'volume')
      .attr('name',htmlId + 'volume');
     
      clone.find("select[id$=quantityUom\\.id]")
      .attr('id',htmlId + 'quantityUom.id')
      .attr('name',htmlId + 'quantityUom.id');
      
      clone.find("select[id$=weightUom\\.id]")
      .attr('id',htmlId + 'weightUom.id')
      .attr('name',htmlId + 'weightUom.id');
      
      clone.find("select[id$=volumeUom\\.id]")
      .attr('id',htmlId + 'volumeUom.id')
      .attr('name',htmlId + 'volumeUom.id');

      clone.find("input[id$=pricePerUom]")
      .attr('id',htmlId + 'pricePerUom')
      .attr('name',htmlId + 'pricePerUom');

      clone.find("select[id$=priceCurrency\\.id]")
      .attr('id',htmlId + 'priceCurrency.id')
      .attr('name',htmlId + 'priceCurrency.id');

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
     // orderItemInput.focus();
      childCount++;
      lineNum++;
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
    <g:each var="orderItem" in="${customerOrderInstance?.orderItems}" status="i">
   		
        <!-- Render the orderItem template (_orderItem.gsp) here -->
        <g:render template='orderItem' model="['orderItem':orderItem,'i':i,'hidden':false]"/>
        <!-- Render the orderItem template (_orderItem.gsp) here -->
    </g:each>
    
</div>
<div style="float:right;margin-left:98%"><input type='button' value="Add" onclick="addOrderItem();" /></div>