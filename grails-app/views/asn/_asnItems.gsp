<script type="text/javascript">

    var childCount = ${asnInstance?.asnItems?.size()} + 0;
    
    var lineNum = childCount + 1;
 	
    function addAsnItem(){
       
      var clone = $("#asnItem_clone").clone()
      var htmlId = 'asnItems['+childCount+'].';
      var auid = 'asnItems'+childCount+'';
      var asnItemInput = clone.find("input[id$=number]");
 	
      
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
      
     // attr('id',htmlId + 'id')
     // .attr('name',htmlId + 'id')
     // .attr('value', childCount+1);

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
 	     	 
 	         .replace('_clone', childCount)
 	                 
 	         .replace('_clone', childCount)
 	                  
 	         .replace('_clone', childCount)
 	                  
 	         .replace('_clone', childCount)
 	               
 	         .replace('_clone', childCount)
 	             
 	         .replace('_clone', childCount)
 	         
 	         .replace('_clone', childCount)
 	           
 	         .replace('_clone', childCount)
    
 	         
 	         
 	});
     /* clone.find("span[id$=orderItem-span]")
      .attr('id',htmlId + 'orderItem-span')
      //.attr('name',htmlId + 'origin-span');
	 
      clone.find("input[id$=orderItem-value]")
     .attr('id',htmlId + 'orderItem-value')
     .attr('name',htmlId + 'orderItem.id');

      clone.find("input[id$=orderItem-suggest]")
      .attr('id',htmlId + 'orderItem-suggest')
      .attr('name',htmlId + 'orderItem.product');
      clone.find("script").text(function (i, old) {
 	     return old
 	     	 
 	         .replace('_clone', childCount)
 	                 
 	         .replace('_clone', childCount)
 	                  
 	         .replace('_clone', childCount)
 	                  
 	         .replace('_clone', childCount)
 	               
 	         .replace('_clone', childCount)
 	             
 	         .replace('_clone', childCount)
 	         
 	         .replace('_clone', childCount)
 	           
 	         .replace('_clone', childCount)
    
 	         
 	         
 	});*/
     
      clone.find("select[id$=order\\.id]")
      .attr('id',htmlId + 'order.id')
      .attr('name',htmlId + 'order.id');
      
      clone.find("select[id$=orderItem\\.id]")
      .attr('id',htmlId + 'orderItem.id')
      .attr('name',htmlId + 'orderItem.id');
        
      clone.find("select[id$=pc\\.id]")
      .attr('id',htmlId + 'pc.id')
      .attr('name',htmlId + 'pc.id');


      clone.find("select[id$=pricePerUom]")
      .attr('id',htmlId + 'pricePerUom')
      .attr('name',htmlId + 'pricePerUom');  

      clone.find("select[id$=volumeUOM\\.id]")
      .attr('id',htmlId + 'volumeUOM.id')
      .attr('name',htmlId + 'volumeUOM.id');  

      
      clone.find("input[id$=order\\.company]")
      .attr('id',htmlId + 'order.company')
      .attr('name',htmlId + 'order.company');
      
       
      
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
     
      clone.find("select[id$=quantityUom]")
      .attr('id',htmlId + 'quantityUom')
      .attr('name',htmlId + 'quantityUom');
      
      clone.find("select[id$=weightUom]")
      .attr('id',htmlId + 'weightUom')
      .attr('name',htmlId + 'weightUom');
      
      clone.find("select[id$=volumeUom]")
      .attr('id',htmlId + 'volumeUom')
      .attr('name',htmlId + 'volumeUom');

      clone.find("input[id$=pricePerUom]")
      .attr('id',htmlId + 'pricePerUom')
      .attr('name',htmlId + 'pricePerUom');

      clone.find("select[id$=priceCurrency]")
      .attr('id',htmlId + 'priceCurrency')
      .attr('name',htmlId + 'priceCurrency');

      clone.find("input[id$=perishable]")
      .attr('id',htmlId + 'perishable')
      .attr('name',htmlId + 'perishable');

      clone.find("input[id$=hazmat]")
      .attr('id',htmlId + 'hazmat')
      .attr('name',htmlId + 'hazmat');
    
      asnItemInput.attr('id',htmlId + 'number')
            .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');
 
      clone.attr('id', 'asnItem'+childCount);
     
      $("#childList").append(clone);
      clone.show();
     // asnItemInput.focus();
      childCount++;
      lineNum++;
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-asnItem').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".asnItem-div");
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
    <g:each var="asnItem" in="${asnInstance.asnItems}" status="i">
   		
        <!-- Render the asnItem template (_asnItem.gsp) here -->
        <g:render template='asnItem' model="['asnItem':asnItem,'i':i,'hidden':false]"/>
        <!-- Render the asnItem template (_asnItem.gsp) here -->
    </g:each>
    
</div>
<div style="float:right;margin-left:98%"><input type='button' value="Add" onclick="addAsnItem();" /></div>