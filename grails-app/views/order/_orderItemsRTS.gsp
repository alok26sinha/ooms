<script type="text/javascript">
    var childCount = ${orderInstance?.orderItemsRTS.size()} + 0;
 	
    function addOrderItemRTS(){
      var clone = $("#orderItemRTS_clone").clone()
      var htmlId = 'orderItemsRTS['+childCount+'].';
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
      
      clone.find("input[id$=rtsSize4Uom]")
      .attr('id',htmlId + 'rtsSize4Uom')
      .attr('name',htmlId + 'rtsSize4Uom');

      clone.find("input[id$=priceuom]")
      .attr('id',htmlId + 'priceuom')
      .attr('name',htmlId + 'priceuom');

      clone.find("input[id$=startdt]")
      .attr('id',htmlId + 'startdt')
      .attr('name',htmlId + 'startdt');

      clone.find("input[id$=enddt]")
      .attr('id',htmlId + 'enddt')
      .attr('name',htmlId + 'enddt');

       clone.find("input[id$=dialog-form]")
      .attr('id',htmlId + 'dialog-form')
      .attr('name',htmlId + 'dialog-form');
    
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
 

$(document).ready(function() {  
	$( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      buttons: {
		"Save": function() {
		  var bValid = true;

		  if ( bValid ) {
		  	var currentId = $(this).data('itemid');
		  	$("input[id=itemid]").val(currentId)
		  	
			$.ajax({
				url: "/cimbidiaSCM/order/saveOrderItemRTS",
				type: "POST",
				
				data: $('#rtsForm').serialize(),
				success: function(data) {
					alert ( 'RTS Line saved!' );
					location.reload();
				    $("#orderItemRTSTable tbody").append("");
				    $(this).dialog("close");
				},
				error: function(xhr, textStatus, error){
				  
				   console.log(xhr.statusText);
				   console.log(textStatus);
				   console.log(error);
				}
        		});		    
        		$( "#dialog-form" ).dialog( "close" );
		  }
		},
		Cancel: function() {
		  $( "#dialog-form" ).dialog( "close" );
		}
	      },
	      close: function() {
		//allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });


	$( ".open-dialog" ).click(function() {
		var currentId = $(this).attr('id');
		
		$( "#dialog-form" ).data('itemid', currentId );
		$( "#dialog-form" ).dialog( "open" );
	      });
	  
});






$(document).ready(function() {  
	$( "#dialog-form-delivery" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 350,
	      modal: true,
	      buttons: {
		"Save": function() {
		  var bValid = true;

		  if ( bValid ) {
		  	var currentId = $(this).data('itemid');
		  	$("input[id=itemid]").val(currentId)
		  	//alert ('Here1 ' + currentId);
		  	//alert('dialog serialise val='+$('#deliveryForm').serialize());
			$.ajax({
				url: "/cimbidiaSCM/order/saveOrderDelivery",
				type: "POST",
				//data: {itemid: currentId, rtsQuantity: rtsQuantity, pickupStartDt: pickupStartDt, pickupEndDt: pickupEndDt},
				data: $('#deliveryForm').serialize(),
				success: function(data) {
					//alert ( 'ABOOOO' );
				    $("#orderItemRTSTable tbody").append("");
				    $(this).dialog("close");
				},
				error: function(xhr, textStatus, error){
				   //whatever you need to do here - output errors etc
				   //alert( 'Bobbbbbb' + error);
				   console.log(xhr.statusText);
				   console.log(textStatus);
				   console.log(error);
				}
        		});		    
        		$( this ).dialog( "close" );
		  }
		},
		Cancel: function() {
		  $( this ).dialog( "close" );
		}
	      },
	      close: function() {
		//allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });


	$( ".open-dialog-delivery" ).click(function() {
		var currentId = $(this).attr('id');
		
		$( "#dialog-form-delivery" ).data('itemid', currentId );
		$( "#dialog-form-delivery" ).dialog( "open" );
	      });
	  
});

</script>
<div id="childList">
    <g:each var="orderItemRTS" in="${orderInstance.orderItemsRTS}" status="i">
   		
        <!-- Render the orderItem template (_orderItem.gsp) here -->
        <g:render template='orderItemRTS' model="['orderItemRTS':orderItemRTS,'i':i,'hidden':false]"/>
        <!-- Render the orderItem template (_orderItem.gsp) here -->
    </g:each>
    
</div>
