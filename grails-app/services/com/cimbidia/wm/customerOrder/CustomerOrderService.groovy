/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.customerOrder

import com.cimbidia.wm.core.Mot

import java.util.Date;
import java.util.List;

import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.ListCommand
import com.cimbidia.wm.core.Constants
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.ShipmentException
import com.cimbidia.wm.shipment.ShipmentItem
import com.cimbidia.wm.shipment.ShipmentStops
import com.cimbidia.wm.shipment.TransportationOrder
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.EventType;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.LocationType;
import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.order.Order;
import com.cimbidia.wm.order.OrderCommand;
import com.cimbidia.wm.order.OrderException;
import com.cimbidia.wm.order.OrderItem;
import com.cimbidia.wm.order.OrderItemCommand;
import com.cimbidia.wm.order.OrderShipment;
import com.cimbidia.wm.order.OrderStatus;
import com.cimbidia.wm.util.DomainObjectClone;
import com.cimbidia.scm.admin.Company;
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.IdentifierService
import com.cimbidia.wm.core.rg.RoutingGuide
import com.cimbidia.wm.core.rg.RoutingGuideService
import com.cimbidia.wm.product.Product;

class CustomerOrderService {

	boolean transactional = true
	
	def productService
	def shipmentService;
	def identifierService
	def userService
	def routingGuideService
	def transportationOrderService
	
	
	
	List<Order> getOrdersPlacedByLocation(Integer companyId, String description, Location origin, Location destination, CustomerOrderStatus status, Date orderedFromDate, Date orderedToDate, String orderBy,String colName) {
		
		def companyInstance = Company.findById(companyId)
		def orders = Order.withCriteria {
			
			and {
				if(companyId && companyInstance.type.id==8){ eq("companyId", companyId)}
				
				if(companyId && companyInstance.type.id==9){ eq("seller.id", companyId)}
				if(description) { ilike("description", "%" + description + "%")}
				if (origin) { eq("origin", origin) } 
				if (destination) { eq("destination", destination) } 
				
				if (status) { eq("status", status) }
				if (orderedFromDate) { ge("dateOrdered", orderedFromDate) }
				if (orderedToDate) { le("dateOrdered", orderedToDate) }
				if (userService.isUserSupplier(AuthService.currentUser.get())){ ne("status", CustomerOrderStatus.NEW) }
				
			}
			if( colName) {order(colName, orderBy)}
		}
		 
		return orders
   }


	
	List<Order> getOrders(Integer companyId, String orderNumber, String seller, java.util.List<Location> locations,CustomerOrderStatus status,Date orderedFromDate, Date orderedToDate, String orderBy,String colName) {
			
		println "Status : "+status
		
		log.info "INSIDE ORDERSERVICE IA  AM HERE " + locations
		def companyInstance = Company.findById(companyId)
		
		def orders = CustomerOrder.withCriteria {
			and {
				
				
				if(companyId && companyInstance.type.id==8){ eq("companyId", companyId)}
				
				if(companyId && companyInstance.type.id==9){ eq("seller.id", companyId)}
				
				if(orderNumber) { ilike("orderNumber", "%" + orderNumber + "%")}
				
				//if(seller) { eq("seller.id", seller)}
				if (locations) { 
					or {
						'in'("origin", locations)
						'in'("destination", locations)
					}
				}
							
				if (status) { eq("status", status) }
				
				/*if (orderedFromDate) { ge("dateOrdered", orderedFromDate) }
				if (orderedToDate) { le("dateOrdered", orderedToDate) }*/
				//if (userService.isUserSupplier(AuthService.currentUser.get())){ ne("status", OrderStatus.PENDING) }
			}
			
			if( colName) {order(colName, orderBy)}
		}
		return orders
   }
   
   
   
   	/**
	 * @param location
	 * @return	a list of pending incoming order into the given location
	 */
	List<Order> getIncomingOrders(Location location) { 
		return Order.findAllByDestination(location);//.findAll { it.isPending() }
	}

	
	/**
	 * @param location
	 * @return	a list of pending outgoing order from the given location
	 */
	List<Order> getOutgoingOrders(Location location) { 
		return Order.findAllByOrigin(location);//.findAll { it.isPending() }
	}
	
	/**
	 * @return	a list of suppliers
	 */
	List<Location> getSuppliers() { 
		def suppliers = []
		LocationType supplierType = LocationType.findById(Constants.SUPPLIER_LOCATION_TYPE_ID);
		if (supplierType) { 
			suppliers = Location.findAllByLocationType(supplierType);
		}
		return suppliers;
		
	}
	
	/**
	 * @param id	an identifier for the order
	 * @param recipientId
	 * @return	an command object based on an order with the given  
	 */
	OrderCommand getOrder(String id, String recipientId) { 
		def orderCommand = new OrderCommand();
		
		def orderInstance = Order.get(id)
		if (!orderInstance)
			throw new Exception("Unable to locate order with ID " + id)
			
		if (recipientId) {
			orderCommand.recipient = Person.get(recipientId)
		}
		
		orderCommand.origin = Location.get(orderInstance?.origin?.id)
		orderCommand.via = Location.get(orderInstance?.via?.id)
		orderCommand.destination = Location.get(orderInstance?.destination?.id)
		orderCommand.orderedBy = Person.get(orderInstance?.orderedBy?.id)
		orderCommand.dateOrdered = orderInstance?.dateOrdered
		orderCommand.order = orderInstance;
		orderInstance?.orderItems?.each {
			def orderItemCommand = new OrderItemCommand();
			orderItemCommand.primary = true;
			orderItemCommand.orderItem = it
			orderItemCommand.type = it.orderItemType
			orderItemCommand.description = it.description
			orderItemCommand.productReceived = it.product
			orderItemCommand.quantityOrdered = it.quantity;
			//orderItemCommand.quantityReceived = it.quantity
			orderCommand?.orderItems << orderItemCommand
		}
		return orderCommand;
	}
	
	/**
	 * 
	 * @param orderCommand
	 * @return
	 */
	OrderCommand saveOrderShipment(OrderCommand orderCommand) { 
		def shipmentInstance = new Shipment()
		def shipments = orderCommand?.order?.shipments();
		def numberOfShipments = (shipments) ? shipments?.size() + 1 : 1;
		
		shipmentInstance.name = orderCommand?.order?.description + " - " + "Shipment #"  + numberOfShipments 
		shipmentInstance.shipmentType = orderCommand?.shipmentType;
		shipmentInstance.origin = orderCommand?.order?.origin;
		shipmentInstance.destination = orderCommand?.order?.destination;		
		shipmentInstance.expectedDeliveryDate = orderCommand?.deliveredOn;
		shipmentInstance.expectedShippingDate = orderCommand?.shippedOn;
		
		orderCommand?.shipment = shipmentInstance
		orderCommand?.orderItems.each { orderItemCommand ->
			
			// Ignores any null order items and makes sure that the order item has a product and quantity
			if (orderItemCommand && orderItemCommand.productReceived && orderItemCommand?.quantityReceived) {
				def shipmentItem = new ShipmentItem();
				shipmentItem.lotNumber = orderItemCommand.lotNumber
				shipmentItem.expirationDate = orderItemCommand.expirationDate
				shipmentItem.product = orderItemCommand.productReceived;
				shipmentItem.quantity = orderItemCommand.quantityReceived;
				shipmentItem.recipient = orderCommand?.recipient;
				shipmentInstance.addToShipmentItems(shipmentItem)
				
				def orderShipment = new OrderShipment(shipmentItem:shipmentItem, orderItem:orderItemCommand?.orderItem)
				shipmentItem.addToOrderShipments(orderShipment)
				orderItemCommand?.orderItem.addToOrderShipments(orderShipment)
			}
		}
		
		// Validate the shipment and save it if there are no errors
		if (shipmentInstance.validate() && !shipmentInstance.hasErrors()) { 
			shipmentService.saveShipment(shipmentInstance);
		}
		else { 
			log.info("Errors with shipment " + shipmentInstance?.errors)
			throw new ShipmentException(message: "Validation errors on shipment ", shipment: shipmentInstance)
		}

		// Send shipment, receive shipment, and add 
		if (shipmentInstance) { 
			// Send shipment 
			log.info "Sending shipment " + shipmentInstance?.name
			shipmentService.sendShipment(shipmentInstance, "", orderCommand?.currentUser, orderCommand?.currentLocation, orderCommand?.shippedOn);
						
			// Receive shipment
			log.info "Receiving shipment " + shipmentInstance?.name
			Receipt receiptInstance = shipmentService.createReceipt(shipmentInstance, orderCommand?.deliveredOn)
			
			// FIXME 
			// receiptInstance.validate() && !receiptInstance.hasErrors()
			if (!receiptInstance.hasErrors() && receiptInstance.save()) { 
				shipmentService.receiveShipment(shipmentInstance, "", orderCommand?.currentUser, orderCommand?.currentLocation, true);
			}
			else { 
				throw new ShipmentException(message: "Unable to save receipt ", shipment: shipmentInstance)
			}
			
			saveOrder(orderCommand?.order);
		}
		return orderCommand;
	}
	
	/**
	 * 
	 * @param order
	 * @return
	 */	
	CustomerOrder saveOrder(CustomerOrder customerOrder) { 		
		// update the status of the order before saving
		
		customerOrder.updateStatus()
		
		if (!customerOrder.orderNumber) {
			
			customerOrder.sequence = identifierService.generateOrderIdentifier(customerOrder.companyId)
			customerOrder.orderNumber = Company.get(customerOrder.companyId).companyName + customerOrder.sequence
		}
		

		if (!customerOrder.hasErrors() && customerOrder.save(flush: true,validate:false)) {
			
			return customerOrder;
		}
		else {
            println customerOrder.errors
			throw new OrderException(message: "Unable to save order due to errors", order: customerOrder)
		}
	}
	
	
	/**
	 *
	 * @param location
	 * @return
	 */
	List<Order> getPendingOrders(Location location) {
		def orders = Order.withCriteria { 
			or { 
				eq("origin", location) 
				eq("destination", location) 
			}
		}			
		return orders; //.findAll { it.isPending() }
	}

	/**
	 *
	 * @param location
	 * @param product
	 * @return
	 */
	List<OrderItem> getPendingOrderItemsWithProduct(Location location, Product product) {
		def orderItems = []
		def orders = getPendingOrders(location);
		orders.each {
			def orderItemList = it.orderItems.findAll { it.product == product }
			orderItemList.each { orderItems << it; }
		}

		return orderItems;
	}
	
	List<CustomerOrder> getCustomerOrderByFilter(Integer companyId,String orderNumber,String destination,String status,Integer customer,Date dueDate){
		
				
				def companyInstance = Company.findById(companyId)
				println("customer instance parameter "+companyId+" "+orderNumber+" "+destination);
				def customerOrders = CustomerOrder.withCriteria {
					and {
						if(orderNumber) { like("orderNumber","%"+orderNumber+"%")}
						if (status) { eq("status", status) }
						if (destination) { eq("destination.id", destination) }
						if (customer) { eq("customer", Company.findById(customer)) }
						if (dueDate) { eq("dueDate", dueDate) }
						}
				}
				println("customerOrders"+customerOrders)
				return customerOrders
			
	}
	List<CustomerOrder> getCustomerOrderByFilter(Integer companyId,String orderNumber,Location destination,CustomerOrderStatus status,Integer customer,Date dueDate){

		
		def companyInstance = Company.findById(companyId)
		
		def customerOrders = CustomerOrder.withCriteria {
			and {
				if(orderNumber) { like("orderNumber","%"+orderNumber+"%")}
				if (status) { eq("status", status) }
				if (destination) { eq("destination", destination) }
				if (customer) { eq("customer", Company.findById(customer)) }
				if (dueDate) { eq("dueDate", dueDate) }
				}
		}
		return customerOrders
	
	}
	
	/**
	 *
	 * @param location
	 * @return
	 */
	Map getIncomingQuantityByProduct(Location location, List<Product> products) {
		return getQuantityByProduct(getIncomingOrders(location), products)
	}

	/**
	 * Returns a list of outgoing quantity per product given location.
	 * @param location
	 * @return
	 */
	Map getOutgoingQuantityByProduct(Location location, List<Product> products) {
		return getQuantityByProduct(getOutgoingOrders(location), products)
	}
  
	
	/**
	 * Returns a map of order quantities per product given a list of orders.
	 * 
	 * @param orders
	 * @return
	 */
	Map getQuantityByProduct(def orders, List<Product> products) {
		def quantityMap = [:]
		orders.each { order ->
			order.orderItems.each { orderItem ->
				def product = orderItem.product
				if (product) {
                    if (products.contains(product)) {
                        def quantity = quantityMap[product];
                        if (!quantity) quantity = 0;
                        quantity += orderItem.quantity;
                        quantityMap[product] = quantity
                    }
				}
			}
		}
		return quantityMap;
	}
	
	/**
	*
	* @param shipments
	* @return
	*/
   Map<EventType, ListCommand> getOrdersByStatus(List orders) {
	   def orderMap = new TreeMap<OrderStatus, ListCommand>();
	   
	   OrderStatus.list().each {
		   orderMap[it] = [];
	   }
	   	   
	   orders.each {
		   def key = it.status;
		   def orderList = orderMap[key];
		   if (!orderList) {
			   orderList = new ListCommand(category: key, objectList: new ArrayList());
		   }
		   orderList.objectList.add(it);
		   orderMap.put(key, orderList)
	   }
	   return orderMap;
   }

	
   Order cloneOrder( Order order ) {
   	def neworder = DomainObjectClone.deepClone( order );
   	

   	saveOrder( neworder );
   } 
    
   public void createTOFromCustomerOrder(CustomerOrder customerOrder){
	   def customerOrderItem = customerOrder.getOrderItems()
	   for(int i=0;i<customerOrderItem.size();i++){
			   transportationOrderService.addTransportationOrderFromCO(customerOrder,customerOrderItem.get(i));
		}
   }
   
   public List<CustomerOrder> committedCustomerOrder(CustomerOrderStatus commit){
	   return CustomerOrder.withCriteria {
					eq("status",commit)
		}
   }
}
