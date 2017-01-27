/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm

// import java.text.SimpleDateFormat;

class AutoSuggestSearchableTagLib {
		

	def autoSuggestSearchable = { attrs, body ->
		def id = (attrs.id) ? attrs.id : "autoSuggest_" + (new Random()).nextInt()
		def name = attrs.name
		def styleClass = attrs.styleClass
		def valueId = (attrs.valueId)?:"";
		def valueName = (attrs.valueName)?:"";
		def width = (attrs.width) ?: '200px';
		def minLength = (attrs.minLength) ?: 1;
		def jsonUrl = (attrs.jsonUrl) ?: "";

		// def showValue = (valueName && valueId) ? true : false;
		// def spanDisplay = (showValue) ? "inline" : "none";
		// def suggestDisplay = (showValue) ? "none" : "inline";
	    // def spanDisplay = "none";
		def suggestDisplay = "inline";
		
		def html = """
			<span>
				<style>
					#${id}-suggest {
						background-image: url('${request.contextPath}/images/icons/silk/magnifier.png');
						background-repeat: no-repeat;
						background-position: center left;
						padding-left: 20px;						
					}				
					.ui-autocomplete-term { font-weight: bold; color: #DDD; }
				</style>
				
				<input id="${id}-suggest" type="text" name="${name}.name" 
					value="${valueName}" style="width: ${width}; display: ${suggestDisplay};" class="${styleClass}"> 	
				
				<script>
				\$(document).ready(function() {
				      	\$("#${id}-suggest").autocomplete({
				            width: '${width}',
				            minLength: ${minLength},
				            dataType: 'json',
				            highlight: true,
				            selectFirst: true,
				            scroll: true,
				            autoFocus: true,
				            autoFill: true,
				            //scrollHeight: 300,
				            	    open: function(){
				            	    	alert ( 'Inside 1' );
						        \$(this).autocomplete('widget').css('z-index', 1000002);
						        return false;
    						    },
							//define callback to format results
							source: function(request, response){			
								alert( 'Here 1');
								\$.getJSON('${jsonUrl}', request, function(data) {
									var suggestions = [];
									\$.each(data, function(i, item) {
										console.log( 'Json = ' + item.lotNumber );
										\$("#lotNumber-text").html(item.lotNumber);
										\$("#product-text").html(item.productName);
										\$("#quantity-text").html(item.quantity);
										\$("#expirationDate-text").html(item.expirationDate);

										// set hidden values
										\$("#productId").val(item.productId);
										\$("#lotNumber-suggest").val(item.lotNumber);
										\$("#inventoryItemId").val(item.id)
										//\$("#quantity").val(item.quantity);

										// Update on hand quantity
										updateQuantityOnHand();			

										\$("#itemFoundForm").show();
										\$("#itemSearchForm").hide();
										\$("#quantity").focus();

										suggestions.push(item);
									});
									
									response(suggestions);
									return;
								});
					      		},
							select: function(event, ui) {
								// set text display
								console.log( 'Here 1212' );
								\$("#lotNumber-text").html(ui.item.lotNumber);
								\$("#product-text").html(ui.item.productName);
								\$("#quantity-text").html(ui.item.quantity);
								\$("#expirationDate-text").html(ui.item.expirationDate);

								// set hidden values
								\$("#productId").val(ui.item.productId);
								\$("#lotNumber-suggest").val(ui.item.lotNumber);
								\$("#inventoryItemId").val(ui.item.id)
								//\$("#quantity").val(ui.item.quantity);

								// Update on hand quantity
								updateQuantityOnHand();			

								\$("#itemFoundForm").show();
								\$("#itemSearchForm").hide();
								\$("#quantity").focus();
								
							}
					});
				});
					
				</script>
			</span>		
		""";
			
		
		out << html; 
	}
	
}