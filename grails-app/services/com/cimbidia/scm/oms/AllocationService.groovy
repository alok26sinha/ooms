package com.cimbidia.scm.oms

import java.util.List;
import com.cimbidia.wm.customerOrder.CustomerOrder
import com.cimbidia.wm.customerOrder.CustomerOrderItem
import com.cimbidia.wm.customerOrder.CustomerOrderStatus
class AllocationService {
	boolean transactional = true
	def inventoryService
	Map<Inventory, Double> inventoryMap
	HashMap<String, SourcingHelper> sourcingHelpers
	def allocate(HashMap<String, SourcingHelper> sourcingHelpers, Map<Inventory, Double> inventoryMap, String ruleId){
		this.inventoryMap = inventoryMap
		this.sourcingHelpers = sourcingHelpers
		AllocationRule rule = AllocationRule.findById(ruleId)
		//handle prioritization

		TreeMap<String,SourcingHelper> sortedMap=null;
		Set keys = null;
		if(rule.optimizationType.id.equals("4")){
			//pass sourcingHelpers n inventoryMap call LP
			new CostOptimization().execute(sourcingHelpers, inventoryService);
		}else{
			//rev maximization=5
			if(rule.optimizationType.id.equals("5")){

				ValueComparator bvc	= new ValueComparator(sourcingHelpers);
				sortedMap = new TreeMap<String,SourcingHelper>(bvc);
				sortedMap.putAll(sourcingHelpers);
			}
			else{
				sortedMap  = sourcingHelpers
			}

			keys = sortedMap.keySet();
			Iterator iter  = keys.iterator();

			while(iter.hasNext()){
				String key  = (String)iter.next();

				SourcingHelper sh = sortedMap.get(key);

				if(sh!=null){
					//allocate complete order from single source
					if(rule.shipComplete && rule.shipSingleLocation){
						try{
							allocateOrder(sh.custItem.order)
						}
						catch(Exception e){
							println("Allocation complete single source is not possible!");
							break;
						}
					}

					//else allocate normally

					if(!sh.isAllocated){

						allocateSingleLine(sh);
					}

				}
			}
		}
		//finalization
		Iterator iter2  = keys.iterator();
		while(iter2.hasNext()){
			String key  = (String)iter2.next();
			SourcingHelper sh = sourcingHelpers.get(key);

			if(sh.custItem.quantity != sh.custItem.allocQty){

				if(rule.cancelOrderOnFail){
					//sh.custItem.status=CustomerOrderStatus.CANCELLED;
					//todo: write logic for status propagation
					sh.custItem.order.status= CustomerOrderStatus.CANCELLED;
				}else{
					//sh.custItem.status=CustomerOrderStatus.BACKORDERED;
					//todo: write logic for status propagation
					sh.custItem.order.status= CustomerOrderStatus.BACKORDERED;
				}
			}else{
				//sh.custItem.status=CustomerOrderStatus.ALLOCATED;
				//todo: write logic for status propagation
				sh.custItem.order.status= CustomerOrderStatus.ALLOCATED;
			}
			sh.custItem.order.errors?.allErrors?.each{ println it };

			sh.custItem.order.merge();

		}


		inventoryService.persistInventories(inventoryMap)
		println("allocation completed!")
	}

	void allocateOrder(CustomerOrder order){
		List<CustomerOrderItem> items  = order.orderItems;
		for(int i=0; i<items.size(); i++){
			String key  = items.get(i).id;
			SourcingHelper sh  = sourcingHelpers.get(key);

			InventoryItem inv = new InventoryItem();
			inv.company = sh.hdr.company
			inv.product = sh.custItem.product;
			inv.location = sh.source;


			Inventory inventory  = inventoryMap.get(inv);

			if(inventory !=null && ((inventory?.q-inventory?.itemLocation?.safetyStock) >= sh.custItem.quantity)){
				inventory.allocQty+=sh.custItem.quantity;
				sh.custItem.allocQty = sh.custItem.quantity;
				sh.custItem.origin =  sh.source;
				sh.isAllocated=true;
			}else{
				throw new Exception();

			}

		}
	}
	void allocateSingleLine(SourcingHelper sh){

		InventoryItem inv = new InventoryItem();
		inv.company = sh.hdr.company
		inv.product = sh.custItem.product;
		inv.location = sh.source;


		Inventory inventory  = inventoryMap.get(inv);

		if(inventory !=null && ((inventory?.q-inventory?.itemLocation?.safetyStock) >= sh.custItem.quantity)){

			inventory.allocQty+=sh.custItem.quantity;
			sh.custItem.allocQty = sh.custItem.quantity;
			sh.custItem.origin =  sh.source;
			sh.isAllocated=true;

		}

	}

}
//handles revenue maximization
class ValueComparator implements Comparator<String> {

	Map<String, SourcingHelper> base;
	public ValueComparator(Map<String, SourcingHelper> base) {
		this.base = base;
	}

	public int compare(String a, String b) {
		if (base.get(a).custItem.quantity > base.get(b).custItem.quantity ) {
			return -1;
		} else if (base.get(a).custItem.quantity < base.get(b).custItem.quantity ) {
			return 1;
		}
		return 0;
	}
}

