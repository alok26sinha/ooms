
<%@ page import="com.cimbidia.scm.shipment.ShipmentAccessorial"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<g:set var="entityName"
	value="${warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial')}" />
<title><warehouse:message code="default.list.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle">
<warehouse:message code="default.list.label" args="[entityName]" /></content>
<script type="text/javascript">
	$(document).ready(function() { 
		$("#dialog-cost").dialog({
			autoOpen : false,
			height : 400,
			width : 400,
			modal : true,
			buttons : {
				"Save" : function() {
					var bValid = true;
					if (!matched){
						bValid=false;
						alert("Cannot update accessorials since carrier is not assigned.");
					}
					if (bValid) {
						var currentId = $(this).data('id');
						
						$("input[id=itemid]").val(currentId);

						$.ajax({
							url : "/cimbidiaSCM/shipmentAccessorial/saveAll",
							type : "POST",
							
							data: $('#shpAccForm').serialize(),
							success : function(data) {
								alert('Accessorials saved!');
								location.reload();
								
								$(this).dialog("close");
							},
							error : function(xhr, textStatus, error) {

								console.log(xhr.statusText);
								console.log(textStatus);
								console.log(error);
							}
						});
						$("#dialog-cost").dialog("close");
					}
				},
				Cancel : function() {
					$("#dialog-cost").dialog("close");
				}
			},
			close : function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

		$(".cost-dialog").click(function() {
			matched=true;
			var title = $(this).attr('title');
			var currentId = $(this).attr('id');
			
			var cost = $(this).text();
			$("input[id=totalcost]").val(cost);
			var totalcost = $("input[id=totalcost]").val();
			var shipCarrierId=$(this).attr('name');
			var shipmentId=$("#id").val();
			<g:remoteFunction options="{asynchronous:false}" controller="shipment" action="loadShipAccessorials" params="{ratingLaneCarrierId:currentId,shipmentId:shipmentId,totalcost:totalcost,rate:rate,shipCarrierId:shipCarrierId}" update="dialog-cost"/>	
			$("#dialog-cost").dialog("open");

			var rate = 0.0;
			$("input:text[name=rateid]").each(function() {
				rate = parseFloat(rate) + parseFloat($(this).val());
			});
			var totalcost1 = $("#totalcost").val();
			var grantt = parseFloat(totalcost1) + rate;
			
			$("input[id=grandtotal]").val(grantt)
				
			if(title == shipCarrierId){
				matched=true;
			}else{
				matched=false;
				}	 
			
		});
		 $("input[type='text']").on("change", function() {

			   //var cost = $(this).text();

			   var totalcost = $("input[id=totalcost]").val();
			   var rate = 0.0;

			   $("input:text[name=rateid]").each(function() {
			    rate = parseFloat(rate) + parseFloat($(this).val());
			   });

			   var grantt = parseFloat(totalcost) + parseFloat(rate);
			   $("input[id=grandtotal]").val(grantt);
			  });
		
			//$(".ui-dialog-buttonpane button:contains('Save')").addClass("ui-state-disabled");
		// $(":button:contains('Save')").prop("disabled", true).addClass("ui-state-disabled");
			 
	});
	

</script>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>

		<form id="shpAccForm" name="shpAccForm" action="saveAll" method="post">
			<input type="hidden" id="itemid"/>
			<div  id="dialog-cost" title="Transportation Cost">
			<input type="hidden" id="shipCarrier" name="shipCarrier" value="${shipCarrierId}">
			<table>
				<thead>
					<tr>
						<th>Rating Lane Id</th>
						<th>Cost</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label id="ratinglaneid">${ratingLaneCarrierId}</label></td>
						
						<td><input type="text" id="totalcost" name="totalcost" value="${oldCost}"
							readonly="readonly"></td>
					</tr>
				</tbody>
			</table>

			</br> <br />

			<div class="list">


				<table>
					<thead>
						<tr>

							<th><warehouse:message
									code="shipmentAccessorial.accessorial.label"
									default="Accessorial" /></th>

							<g:sortableColumn property="rate"
								title="${warehouse.message(code: 'shipmentAccessorial.cost.label', default: 'Cost')}" />


						</tr>
					</thead>
					
					 <%--<div id="dialog-ShipAccess">
	   					<g:render template="shipmentAccessorialsList" model="[shipmentAccessorialInstanceList:shipmentAccessorialInstanceList]"/>
	  				 </div>
					
				--%>
				<tbody>
					
						<g:each in="${shipmentAccessorialInstanceList}" status="i"
							var="shipmentAccessorialInstance">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td>
									${shipmentAccessorialInstance?.accessorial?.description}
								</td>

								<td><input type="text" id="rateid${i }" name="rateid"
									value="${fieldValue(bean: shipmentAccessorialInstance, field: "rate")}" /></td>
									<td><input type="hidden" name="id" id="selectedCheck${i }" value="${fieldValue(bean: shipmentAccessorialInstance, field: "id")}"/></td>
									

							</tr>
						</g:each>
					</tbody>
				</table>
			</div>

			<table>

				<tr>
					<td><label><b> Total Cost</b></label></td>
					<td><input type="text" name="grandtotal" id="grandtotal" value="${totalcost}"
						readonly="readonly"></td>
				</tr>

			</table>
			</div>
		</form>
	</div>
</body>
</html>
