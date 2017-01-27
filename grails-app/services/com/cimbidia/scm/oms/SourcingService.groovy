package com.cimbidia.scm.oms

import java.util.ArrayList;
import java.util.List;

import com.cimbidia.wm.customerOrder.CustomerOrder;
import com.cimbidia.wm.customerOrder.CustomerOrderItem
import com.cimbidia.scm.admin.Company
class SourcingService {
	HashMap<String, SourcingHelper> sourcingHelpers = new HashMap<String, SourcingHelper>();
	def inventoryService
	def source(List<CustomerOrder> custOrders, Map<Inventory, Double> inventoryMap){
		for(int i=0; i<custOrders.size(); i++){
			List<CustomerOrderItem> custItems = custOrders.get(i).getOrderItems();
			
			for(int j=0; j<custItems.size(); j++){
				SourcingHelper sh = new SourcingHelper(custItems.get(j));
				
				sourcingHelpers.put(custItems.get(j).id, sh);
				List<SourcingRuleHdr> hdrs = findSources(sh.hdr)
				//todo logic of sourcing expand
				
				for(int x; x< hdrs.size(); x++){
				   for(int y=0; y<hdrs.get(x).sourcingRuleDtls.size(); y++){
					   //sh.sources.add(hdrs.get(x).sourcingRuleDtls.get(y).fromLocation);
					   InventoryItem inv = new InventoryItem();
					   inv.company = Company.findById(custItems.get(j).order.companyId)
					   inv.product = custItems.get(j).product;
					   inv.location =  hdrs.get(x).sourcingRuleDtls.get(y).fromLocation;
					   sh.source = hdrs.get(x).sourcingRuleDtls.get(y).fromLocation;
					  
					   if(!inventoryMap.containsKey(inv)){
						  
						  Inventory inventory = inventoryService.getInventory(inv);
						  inventoryMap.put(inv, inventory);
						  
					   }
				   }
				}
			}
		}
		return sourcingHelpers;
	}
	
	
	List<SourcingRuleHdr> findSources(SourcingRuleHdr hdr) {
		
		
		def sourcingRuleHdrs = SourcingRuleHdr.withCriteria {
			and {
				
				eq("company", hdr.company)
				
				eq("product", hdr.product)
				eq("toLocation", hdr.toLocation)
				//if(hdr.customer)eq("customer", hdr.customer)
			
			}
		
		}
		
		return sourcingRuleHdrs
	}
	
}
