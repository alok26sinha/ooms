                                            
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="index" />
         <title><warehouse:message code="createProductFromTemplate.label"/></title>  
    </head>
    <body>
    	<div class="body">
    	
			<g:render template="header" model="['currentState':'showProduct']"/>			
						 	
			<g:form action="create" method="post" >
			
				<div class="buttonBar">
					<span class="linkButton">
						<g:link controller="inventoryItem" action="showStockCard" class="stockCard" params="['product.id':productInstance?.id]">
							Show stock card
						</g:link>
					</span>
					<span class="linkButton">
						<g:link controller="product" action="edit" id="${productInstance?.id }" class="edit">
							Edit product
						</g:link>
					</span>
					<span class="linkButton">
						<g:link controller="createProductFromTemplate" action="index" class="create">
							Create another product
						</g:link>
					</span>					
					
					<%--
                    <g:submitButton class="back" name="back" value="Back" />
                    <g:submitButton class="next" name="next" value="Next" />
                    <g:submitButton class="cancel" name="cancel" value="Cancel" />
					 --%>
				</div>			
				<div class="dialog box">
					<table>
						<tbody>
							<tr class="prop">
								<td class="name">
									<label class="clear">Name:</label>
								</td>
								<td class="value">
									${product.title }
								</td>
							</tr>										
							<tr class="prop">
								<td class="name">
									<label class="clear">Category:</label>
								</td>
								<td class="value">
									<g:if test="${product?.category }">
										<format:category category="${product?.category}"/>
									</g:if>
									<g:else>
										<span class="fade"><warehouse:message code="default.none.label"/></span>
									</g:else>
								</td>
							</tr>	
							<tr class="prop">
								<td class="name">
									<label class="clear">Description:</label>
								</td>
								<td class="value">
									${product.description }
								</td>
							</tr>			
							<tr class="prop">
								<td class="name">
									<label class="clear">Application:</label>
								</td>
								<td class="value">		
									${product.application }
								</td>
							</tr>				
							<tr class="prop">
								<td class="name">
									<label class="clear">Latex:</label>
								</td>
								<td class="value">		
									${product.latex }
								</td>
							</tr>				
							<tr class="prop">
								<td class="name">
									<label class="clear">Powder:</label>
								</td>
								<td class="value">		
									${product.powder }
								</td>
							</tr>				
							<tr class="prop">
								<td class="name">
									<label class="clear">Sterility:</label>
								</td>
								<td class="value">		
									${product.sterility }
								</td>
							</tr>				
							
							<tr class="prop">
								<td class="name">
									<label class="clear">Size:</label>
								</td>
								<td class="value">		
									${product.size }
								</td>
							</tr>									
																
								
						</tbody>								
					</table>				
				</div>			
				
            </g:form>
        </div>
        
        
        
		<script>			
			//$(document).ready(function() {
			//});
		</script> 				
    </body>
</html>
