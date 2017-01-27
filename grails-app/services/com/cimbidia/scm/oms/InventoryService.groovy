package com.cimbidia.scm.oms

import java.text.SimpleDateFormat
import java.util.Date;
import java.util.List;
import com.cimbidia.scm.oms.Inventory
import com.cimbidia.scm.admin.Company


class InventoryService {

	boolean transactional = true
	
	Inventory getInventory(InventoryItem inv) {
		
		def itemLocations = ItemLocation.withCriteria{
			eq("product", inv.product)
			eq("location", inv.location)
		}
		
		def inventory = getTodaysPositionForItemLoc(itemLocations.get(0));
			
		return inventory
		
	}
	
	void persistInventories(HashMap<String,Inventory> map){
		Set keys = map.keySet();
		Iterator iter  = keys.iterator();

		while(iter.hasNext()){
			InventoryItem key  = (InventoryItem)iter.next();
			persistInventory(map.get(key));
		}
	
	}
	
	void persistInventory(Inventory inventory){
		inventory?.errors?.allErrors?.each{
			println it
			};
			
		
		if(!inventory?.merge()){
			println("error"+inventory.errors)
			
		}else{
			//inventory?.save(true)
			println("inventory persisted"+inventory)
			
			
		}
		
	}
	
	
	def getTodaysPositionForItemLoc(ItemLocation itemLocation){
		
		Date date = new Date();
		Inventory inventory = new Inventory();
		Inventory inv = findInventoryOH(itemLocation);
		Inventory objInv = findInventoryInTransit(itemLocation,date )
		if(inv!=null){
			inventory.id=inv.id
			inventory.company = inv.company
			inventory.inventoryIdentifier = inv.inventoryIdentifier
			inventory.averageCost = inv.averageCost
			inventory.inventoryStatus = inv.inventoryStatus
			inventory.version = inv.version
		}else if(objInv !=null){
			inventory.id=objInv.id
			inventory.company = objInv.company
			inventory.inventoryIdentifier = objInv.inventoryIdentifier
			inventory.objectType = objInv.objectType
			inventory.objectId = objInv.objectId
			inventory.objectDtlId = objInv.objectDtlId
			inventory.startDate = objInv.startDate
			inventory.endDate = objInv.endDate
			inventory.averageCost = objInv.averageCost
			inventory.inventoryStatus = objInv.inventoryStatus
			inventory.version = objInv.version
		}
		inventory.quantity=(inv?.quantity!=null?inv?.quantity:0.0)+(objInv?.quantity!=null?objInv?.quantity:0.0);
		inventory.allocQty=(inv?.allocQty!=null?inv?.allocQty:0.0)+(objInv?.allocQty!=null?objInv?.allocQty:0.0);
		inventory.itemLocation = itemLocation;
		InventoryDemand iDemand = findDemand(inventory.itemLocation, date);
		InventorySupply iSupply = findSupply(inventory.itemLocation, date);
		Double demand = (iDemand==null? 0.0: iDemand.quantity);
		Double supply = (iSupply==null? 0.0: iSupply.quantity);
		Double safetyStock = inventory.itemLocation?.safetyStock!=null?inventory.itemLocation?.safetyStock:0.0
		inventory.unitCost= inv?.unitCost;
		inventory.q = inventory.quantity-inventory.allocQty/*-safetyStock*/ - demand + supply;
		
		return inventory;
	}
	
	
	String getDailyData(List<Inventory> inventories, Date date, String sku, HashSet<String> skuList)
	{
		String chartdate = "[ ['Day', 'SKU','country', 'Qty', 'Avl', 'Oh', 'allocQty', 'inTransit', 'demand', 'supply', 'safety'], \n";
		skuList =  new HashSet<String>()
		for(int i=0; i<inventories.size(); i++){
		
				Inventory inv = inventories.get(i);
				def d = new Date().parse("MM/dd/yyyy", inv.dateToShowOnUI)
				String strDate  = d.getAt(Calendar.YEAR)+","+(d.getAt(Calendar.MONTH))+","+(d.getAt(Calendar.DAY_OF_MONTH))+",0";
				skuList.add(inv.itemLocation.product);
				if(sku.equals(inv.itemLocation.product)){
					chartdate = chartdate + "[new Date("+strDate+"),'"+inv.itemLocation.product+"','"+inv.itemLocation.location+"',"+inv.net+","+inv.avl+","+inv.oh+","+inv.allocQty+","+inv.inTransit+","+inv.demand+","+inv.supply+","+inv.itemLocation.safetyStock+"], \n"
				}
				else {
					chartdate = chartdate + "[new Date("+strDate+"),'"+inv.itemLocation.product+"','"+inv.itemLocation.location+"',"+inv.net+","+inv.avl+","+inv.oh+","+inv.allocQty+","+inv.inTransit+","+inv.demand+","+inv.supply+","+inv.itemLocation.safetyStock+"], \n"
				}
		}
		
		chartdate = chartdate + "]";
		
		
		return chartdate;
	}
	InventorySupply findSupply(ItemLocation itemLocation, Date date){
		def inventories = InventorySupply.createCriteria().list {
				and  {
					lt("startDate", date)
					ge("endDate", date)
					eq("itemLocation", itemLocation)
					}
			}
		
		if(inventories !=null && inventories.size()>0){
			return inventories.get(0)
		}
		else {
			return null
		}
	}
	
	InventoryDemand findDemand(ItemLocation itemLocation, Date date){
		def inventories = InventoryDemand.createCriteria().list {
				and  {
					lt("demandStartDate", date)
					ge("demandEndDate", date)
					eq("itemLocation", itemLocation)
					}
			}
		
		if(inventories !=null && inventories.size()>0){
			return inventories.get(0)
		}
		else {
			return null
		}
	}
	
	def findInventoryOH(String product, String location){
		def inventories = new ArrayList<Inventory>();
		def itemLocations = ItemLocation.createCriteria().list{
			
			and  {
				if(product!=null && product.length()>0){
				eq("product.id", product)
				}
				if(location!=null && location.length()>0){
					eq("location.id", location)
				}
			}
			
		}
		
		for(int i=0; i< itemLocations.size(); i++){
			Inventory inv = findInventoryOH(itemLocations.get(i));
			if(inv!=null)
			inventories.add(inv);
		}
		return inventories;
	}
	
	Inventory findInventoryOH(ItemLocation itemLocation){
		
		InventoryStatus status = InventoryStatus.get(3);
	//	println "Status "+status +" itemLocation "+itemLocation.toString()
		def inventories = Inventory.createCriteria().list {
				and  {
				if(itemLocation)
					eq("itemLocation", itemLocation)
				if(status)
					eq("inventoryStatus", status)
					}
			}
	//	println "Inventory "+inventories.toString()
		
			if(inventories !=null && inventories.size()>0){
				Inventory inv = inventories.get(0);
				inv.q=inv.quantity;
				return inv
			}
			else {
				return null;
			}
		
	}
	
	Inventory findInventoryInTransit(ItemLocation itemLocation, Date date){
		
		def inv  = new Inventory();
		InventoryStatus status = InventoryStatus.get(3);
		def inventories = Inventory.createCriteria().list {
				projections {
					
					sum("quantity","quantity" )
					property("itemLocation", "itemLocation")
					property("unitCost", "unitCost")
					groupProperty("itemLocation");
				}
				and  {
					lt("startDate", date)
					ge("endDate", date)
					eq("itemLocation", itemLocation)
					or {
						ne("inventoryStatus", status)
						isNull("inventoryStatus")
					}
					}
				resultTransformer(org.hibernate.transform.AliasToEntityMapResultTransformer.INSTANCE)
			}
		
		
		if(inventories !=null && inventories.size()>0){
		return inventories.get(0);
		}else{
		return null;
		}
	}
	// do not use
	List<Inventory> findTodaysInventories(Company company, Date date, String product, String location)
	{	
		
		def itemLocations = ItemLocation.createCriteria().list{
			projections {
				property("id", "id")
			}
			and  {if(product!=null && product.length()>0){
				eq("product.id", product)
			}
			if(location!=null && location.length()>0){
				eq("location.id", location)
			}
			}
		}
		
		
		def inventories = Inventory.createCriteria().list {
			
			projections {
					
					sum("availQty","availQty" )
					property("itemLocation", "itemLocation")
					property("unitCost", "unitCost")
					groupProperty("itemLocation");
			}
			
			and  {
				lt("startDate", date)
				ge("endDate", date)
				eq("company", company)
				'in'("itemLocation.id", itemLocations)
				}
			
			resultTransformer(org.hibernate.transform.AliasToEntityMapResultTransformer.INSTANCE)
			
			
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		for(int i=0; i<inventories.size(); i++){
			Inventory inv  =  inventories.get(i);
			inv.dateToShowOnUI=formatter.format(date)
			inventories.set(i, inv)
			
		}
		
		return inventories;
	}
	
	List<Inventory> getInventory(List<ItemLocation> itemLocations)
	{
		Date date = new Date();
		
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		for(int i=1; i<15; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int x=0; x<itemLocations.size(); x++){
			oh = map.get(itemLocations.get(x))
			Inventory inv = getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
			oh=inv.net;
			map.put(itemLocations.get(x), oh)
			inventories.add(inv);
			}
		}
		
		return inventories;
	}
	
	List<Inventory> getAggregatedInventoryByValue(List<ItemLocation> itemLocations)
	{
		Date date = new Date();
		
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
				
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		for(int i=1; i<15; i++){
			def innerInventories = new ArrayList<Inventory>();
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int j=0; j<itemLocations.size(); j++){
				
				String ilId =  itemLocations.get(j);
			//	println "Itemlocation Id "+ilId
				ItemLocation il = ItemLocation.get(ilId)
				//println "Itemlocation Id "+il.toString()
				Inventory inv = getSafetyStockForDateSequence(stringDate, il, oh);
				
				oh=inv.net;
				//map.put(itemLocations.get(x), oh)
				if(innerInventories.empty){
						innerInventories.add(inv);
				}
				else{
					Inventory inv0 = innerInventories.get(0);
					if(!inv0.itemLocation?.product.equals(inv.itemLocation?.product)){
						inv0.itemLocation.product=null
					}
					if(!inv0.itemLocation?.location.equals(inv.itemLocation?.location)){
						inv0.itemLocation.location=null
					}
					if(inv0 != null && inv != null){
						if(inv0.oh != null && inv.oh!=null)
							inv0.oh += inv?.oh
						if(inv0.allocQty != null && inv.allocQty!=null)
							inv0.allocQty += inv?.allocQty
						if(inv0.inTransit != null && inv.inTransit!=null)
							inv0.inTransit += inv?.inTransit
						if(inv0.supply != null && inv.supply!=null)
							inv0.supply += inv?.supply
						if(inv0.demand != null && inv.demand!=null)
							inv0.demand = inv?.demand
						if(inv0.itemLocation?.safetyStock != null && inv.itemLocation?.safetyStock!=null)
							inv0.itemLocation?.safetyStock += inv.itemLocation?.safetyStock
						if(inv0.net != null && inv.net!=null)
							inv0.net += inv.net
						innerInventories.putAt(0,inv0);
					}
				}
			
			}
			inventories.add(innerInventories.get(0))
		}
		
		return inventories;
	}
	
	List<Inventory> getAggregatedInventory(List<ItemLocation> itemLocations)
	{
		Date date = new Date();
		
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		for(int i=1; i<15; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			def dateInv = new ArrayList<Inventory>();
			for(int x=0; x<itemLocations.size(); x++){
				oh = map.get(itemLocations.get(x))
				Inventory inv = getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
				oh=inv.net;
				map.put(itemLocations.get(x), oh)
				
				dateInv.add(inv);
			}
			def processedInv = invProcessed(dateInv);
			for(int k; k <processedInv.size(); k++){
				
				inventories.add(processedInv.get(k));
			}
		}
		
		return inventories;
	}
	
	List<Inventory> invProcessed(ArrayList<Inventory> dateInv){
		
		def inventory = new ArrayList<Inventory>();
		if(dateInv.size() ==1)
			return dateInv
		else {
			def dataSize = dateInv.size();
			for(int i=0;  i<  dataSize; i++){
				Inventory inv = dateInv.get(i)
				boolean flag = checkAddedList(inventory,inv)
				if(flag == true){
					for(int j=i+1;j<dataSize; j++)
					{
						Inventory invj = dateInv.get(j)
						if(inv.itemLocation.product.equals(invj.itemLocation.product)){
							inv.oh += invj.oh
							inv.allocQty += invj.allocQty
							inv.inTransit += invj.inTransit
							inv.supply += invj.supply
							inv.itemLocation.safetyStock += invj.itemLocation.safetyStock
							inv.net += invj.net						
						}
					}
					inventory.add(inv);
				}
			}			
		}
		
		return inventory;
			
	}
	
	boolean checkAddedList(ArrayList<Inventory> inventory, Inventory inv)
	{
		boolean flag = true;
		if(inventory != null && inventory.size() >0){
			for(int i=0; i<inventory.size();i++)
			{
				Inventory invs = inventory.get(i)
				if(inv.itemLocation.product.equals(invs.itemLocation.product)){
					flag = false;
				}
			}
		}
		return flag
	}
	Inventory getSafetyStockForDateSequential(String paramDate, String itemLocation, Double oh ){
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		Date date  =  formatter.parse(paramDate)
		ItemLocation il = ItemLocation.get(itemLocation)
		
		def invTemp = findInventoryOH(il);
		def inventory = new Inventory();
		if(invTemp != null){
			inventory.quantity = invTemp.quantity;
			if(date-new Date()==0)
			inventory.allocQty = invTemp.allocQty;
			inventory.inTransit = invTemp.inTransit;
			inventory.unitCost = invTemp.unitCost
			
			
		}else{
			
		}
		if(oh==null){
		inventory.oh=inventory.quantity;
		}else{
		inventory.oh=oh;
		}
		inventory.dateToShowOnUI  = paramDate;
		
		def inv  =findInventoryInTransit(il, date);
		
		inventory.inTransit +=  inv!=null?inv.quantity:0.0;
		inventory.allocQty +=  inv!=null?inv.allocQty:0.0;
		Double supp = findSupply(il, date)?.quantity
		inventory.supply  += (supp==null?0.0:supp);
		
		inventory.demand  = findDemand(il, date)?.quantity;
		if(inventory.demand == null){
			inventory.demand = 0.0;
		}
		inventory.itemLocation = il
		inventory.net = inventory.oh + inventory.inTransit-inventory.allocQty+inventory.supply/*-il.safetyStock*/-inventory.demand;
		
		return inventory;
	}
	
	Inventory getSafetyStockForDateSequence(String paramDate, ItemLocation il, Double oh ){
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		Date date  =  formatter.parse(paramDate)
		//ItemLocation ils = ItemLocation.get(il?.id)
		//println "Item Location hgg "+il.toString()
		def invTemp = findInventoryOH(il);
		def inventory = new Inventory();
		if(invTemp != null){
			inventory.quantity = invTemp.quantity;
			if(date-new Date()==0)
			inventory.allocQty = invTemp.allocQty;
			inventory.inTransit = invTemp.inTransit;
			inventory.unitCost = invTemp.unitCost
			
			
		}else{
			
		}
		if(oh==null){
		inventory.oh=inventory.quantity;
		}else{
		inventory.oh=oh;
		}
		inventory.dateToShowOnUI  = paramDate;
		
		def inv  =findInventoryInTransit(il, date);
		
		inventory.inTransit +=  inv!=null?inv.quantity:0.0;
		inventory.allocQty +=  inv!=null?inv.allocQty:0.0;
		Double supp = findSupply(il, date)?.quantity
		inventory.supply  += (supp==null?0.0:supp);
		
		inventory.demand  = findDemand(il, date)?.quantity;
		if(inventory.demand == null){
			inventory.demand = 0.0;
		}
		inventory.itemLocation = il
		inventory.net = inventory.oh + inventory.inTransit-inventory.allocQty+inventory.supply/*-il.safetyStock*/-inventory.demand;
		
		return inventory;
	}
	
	
}
