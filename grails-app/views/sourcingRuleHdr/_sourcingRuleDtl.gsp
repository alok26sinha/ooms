<style>
<!--
.dtl {
	background-color: white;
	border: 1px solid white !important;
	width: 25%;
	text-align: center;
	float: left;
	
}

.dtl-priority {
	background-color: white;
	border: 1px solid white !important;
	width: 10%;
	text-align: center;
	float: left;
	
}

.dtl-location {
	background-color: white;
	border: 1px solid white !important;
	width: 40%;
	text-align: center;
	float: left;
	
}
.dtl select {
width:100% !important;
}
.dtl-small{
	background-color: white;
	border: 1px solid white !important;
	width: 21%;
	vertical-align: top;
	text-align: center;
	float:left;

}
-->
</style>
<div id="sourcingRuleDtl${i}" class="sourcingRuleDtl-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='sourcingRuleDtls[${i}].deleted' value='false'/>
    </div>
     <div class="dtl-small" style="margin-left:3px" align="left">
    <g:textField style="height:20px;width:100%" readonly="readonly" id="sourcingRuleDtls[${i}].lineNum" name='sourcingRuleDtls[${i}].lineNum' value='${i+1}' />
    </div>
    <div class="dtl-location" style="margin-left:12px">
	
	 <g:select id="fromLocation" style="height:24px;width:100%" name="fromLocation" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${sourcingRuleDtl?.fromLocation?.id}"  />												
																  
	</div>
    <div class="dtl" style="margin-left:12px">
    <g:textField id="priority" style="height:20px;width:100%" name="priority" value="${fieldValue(bean: sourcingRuleDtl, field: 'priority')}" />		
	</div>
    
 	 <div class="dtl-priority" style="margin-left:3px">
    <span class="del-sourcingRuleDtl">
        <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
    </div>
   
     
</div>