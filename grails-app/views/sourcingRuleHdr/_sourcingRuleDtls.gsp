<script type="text/javascript">

    var childCount = ${sourcingRuleHdr?.sourcingRuleDtls?.size()} + 0;
    
    var lineNum = childCount + 1;
 	
    function addSourcingRuleDtl(){
      var clone = $("#sourcingRuleDtl_clone").clone()
      var htmlId = 'sourcingRuleDtls['+childCount+'].';
      var auid = 'sourcingRuleDtls'+childCount+'';
      var sourcingRuleDtlInput = clone.find("input[id$=number]");
 	
      
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
      
      
     

    	clone.find("select[id$=fromLocation]")
        .attr('id',htmlId + 'fromLocation')
        .attr('name',htmlId + 'fromLocation');
        
    	       
      
      clone.find("input[id$=priority]")
      .attr('id',htmlId + 'priority')
      .attr('name',htmlId + 'priority');
      
      
    
      sourcingRuleDtlInput.attr('id',htmlId + 'number')
            .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');
 
      clone.attr('id', 'sourcingRuleDtl'+childCount);
     
      $("#childList").append(clone);
      clone.show();
     // orderItemInput.focus();
      childCount++;
      lineNum++;
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-sourcingRuleDtl').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".sourcingRuleDtl-div");
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
    <g:each var="sourcingRuleDtl" in="${sourcingRuleHdr?.sourcingRuleDtls}" status="i">
   		
        <!-- Render the sourcingRuleDtl template (_sourcingRuleDtl.gsp) here -->
        <g:render template='sourcingRuleDtl' model="['sourcingRuleDtl':sourcingRuleDtl,'i':i,'hidden':false]"/>
        <!-- Render the sourcingRuleDtl template (_sourcingRuleDtl.gsp) here -->
    </g:each>
    
</div>
<div style="float:right;margin-left:98%"><input type='button' value="Add" onclick="addSourcingRuleDtl();" /></div>
<script>
$(function() {
	var url = window.location.pathname;
    
    var urlParts = url.split('/');
    
    var action = urlParts[3];
   
	if(action == "create"){
		
	addSourcingRuleDtl();
	}
	});

</script>