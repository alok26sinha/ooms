/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.shipment

import java.util.List;

import grails.validation.ValidationException

import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.*
import com.cimbidia.wm.inventory.*
import com.cimbidia.wm.order.RTS;
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.receiving.ReceiptItem
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.EventType;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.customerOrder.CustomerOrder
import com.cimbidia.wm.customerOrder.CustomerOrderItem
import com.cimbidia.wm.shipment.Container;
import com.cimbidia.wm.shipment.ItemCommand;
import com.cimbidia.wm.shipment.ItemListCommand;
import com.cimbidia.wm.shipment.ReceiptException;
import com.cimbidia.wm.shipment.Shipment;
import com.cimbidia.wm.shipment.ShipmentException;
import com.cimbidia.wm.shipment.ShipmentItem;
import com.cimbidia.wm.shipment.ShipmentItemException;
import com.cimbidia.wm.shipment.ShipmentStatusCode;
import com.cimbidia.wm.shipment.ShipmentType;
import com.cimbidia.wm.shipment.ShipmentWorkflow;
import com.cimbidia.wm.shipment.TrackingMessage
import com.cimbidia.wm.shipment.CarrierShipment
import com.cimbidia.scm.admin.Company;
import com.cimbidia.wm.util.DomainObjectClone;
// import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

class TransportationOrderService {
	boolean transactional = true
	def sessionFactory;
	def identifierService
	def shipmentService
	
	
	public void addTransportationOrder(RTS order,String  orderid){
		System.out.println "test" + order.mot + "::" + order.mot == Mot.OCEAN
		
		if (order.mot == Mot.findById(Mot.OCEAN)){
			addTransportationOrderForOcean( order,  orderid)
		}else{
		Float weight = order.rtsWeight
		Float volume = order.rtsVolume
		Float quantity = order.rtsQuantity
		Float equipWeight = Mot.MAX_EQP_WT
		Float equipVol = Mot.MAX_EQP_VOL
		float numTOsWt = weight==null?0:(weight/equipWeight);
		float numTOsVol =(volume ==null) ? 0: (volume/equipVol);// (volume?/equipVol);//
		Float maxQty = Mot.MAX_EQP_QTY;
		if (order.product.stackability?.equalsIgnoreCase(Product.STACKABLE)){
			 // check stackability of product and determine size
			 //TODO to check what to do with Top stackable -- guessing top means it can go on top of something else
			 //but capacity doesn't double because of it. Unless there is something to go at the bottom.
			 // for now just doubling qty if stackable
			//Wt & Vol remaining feasible, twice the number of pallets can be accomodated
			maxQty = 2 * maxQty;
		}
		float numTOsQty =  (quantity ==null) ? 0:(quantity/maxQty);
		int numTOs;
		//Float leftOver;
//		Float max;
		if (numTOsWt >= numTOsVol){
			numTOs = numTOsWt
//			leftOver = leftOverWeight
//			max = equipWeight
		}else{
			numTOs = numTOsVol
//			leftOver = leftOverVolume
//			max = equipVol
		}
		if (numTOsQty > numTOs){
			numTOs = numTOsQty
//			leftOver=leftOverQty
//			max = maxQty
		}
		Float leftOverWeight =weight==null?0:( weight - equipWeight*numTOs);
		Float leftOverVolume = (volume ==null) ? 0:(volume - equipVol*numTOs);
		Float leftOverQty = (quantity ==null) ? 0: (quantity - maxQty*numTOs);
		System.out.println("numTOs=" + numTOs)
		System.out.println("leftOverWeight=" + leftOverWeight)
		System.out.println("leftOverVolume=" + leftOverVolume)
		System.out.println("leftOverQty=" + leftOverQty)
		if (numTOs >= 1){
				for (int i=0; i<numTOs; i++){
					def transportationOrder = new TransportationOrder();
					transportationOrder.weight = equipWeight
					transportationOrder.volume = equipVol
					transportationOrder.quantity = maxQty	
					transportationOrder.poId = orderid
					createTOFromRTS(transportationOrder, order, true);
				}
			}
			if (leftOverWeight > 0 || leftOverVolume >0 || leftOverQty >0){
				def transportationOrder = new TransportationOrder();
				transportationOrder.weight = leftOverWeight>0?leftOverWeight:0
				transportationOrder.volume = leftOverVolume>0?leftOverVolume:0
				transportationOrder.quantity = leftOverQty>0?leftOverQty:0
				
				transportationOrder.poId = orderid
				boolean createShipment = true;
				if (( (transportationOrder.weight < (Mot.MIN_PERC * Mot.MAX_EQP_WT)))
					&&((transportationOrder.volume < (Mot.MIN_PERC * Mot.MAX_EQP_VOL)) )
					&&((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
					)
					{
						createShipment = false;
					}
				if (! createShipment &&   (transportationOrder.weight <= Mot.MAX_PCL_WT)){
					Float dimensionalWeight = Math.round(transportationOrder.volume * 1728/139);
					//set higher of weight and dimWeight as billable weight in shipment
					  transportationOrder.dimWeight = 	(dimensionalWeight > transportationOrder.weight) ?dimensionalWeight:transportationOrder.weight;
					  if (transportationOrder.dimWeight <= Mot.MAX_PCL_WT)
								  createShipment = true;
				}
				createTOFromRTS(transportationOrder, order, createShipment);
			}

				}
	}
	
	private void addTransportationOrderForOcean(RTS order,String  orderid){
		
		
		Float weight = order.rtsWeight
		Float volume = order.rtsVolume
		Float quantity = order.rtsQuantity
		Float equipWeight = 44000//Mot.MAX_EQP_WT
		Float equipVol = 2377//Mot.MAX_EQP_VOL
		float numTOsWt = weight==null?0:(weight/equipWeight);
		float numTOsVol =(volume ==null) ? 0: (volume/equipVol);// (volume?/equipVol);//
		Float maxQty = Mot.MAX_EQP_QTY;
		if (order.product.stackability?.equalsIgnoreCase(Product.STACKABLE)){
			 // check stackability of product and determine size
			 //TODO to check what to do with Top stackable -- guessing top means it can go on top of something else
			 //but capacity doesn't double because of it. Unless there is something to go at the bottom.
			 // for now just doubling qty if stackable
			//Wt & Vol remaining feasible, twice the number of pallets can be accomodated
			maxQty = 2 * maxQty;
		}
		float numTOsQty =  (quantity ==null) ? 0:(quantity/maxQty);
		int numTOs;
		//Float leftOver;
//		Float max;
		if (numTOsWt >= numTOsVol){
			numTOs = numTOsWt
//			leftOver = leftOverWeight
//			max = equipWeight
		}else{
			numTOs = numTOsVol
//			leftOver = leftOverVolume
//			max = equipVol
		}
		if (numTOsQty > numTOs){
			numTOs = numTOsQty
//			leftOver=leftOverQty
//			max = maxQty
		}
		Float leftOverWeight =weight==null?0:( weight - equipWeight*numTOs);
		Float leftOverVolume = (volume ==null) ? 0:(volume - equipVol*numTOs);
		Float leftOverQty = (quantity ==null) ? 0: (quantity - maxQty*numTOs);
		System.out.println("numTOs=" + numTOs)
		System.out.println("leftOverWeight=" + leftOverWeight)
		System.out.println("leftOverVolume=" + leftOverVolume)
		System.out.println("leftOverQty=" + leftOverQty)
		if (numTOs >= 1){
				for (int i=0; i<numTOs; i++){
					def transportationOrder = new TransportationOrder();
					transportationOrder.weight = equipWeight
					transportationOrder.volume = equipVol
					transportationOrder.quantity = maxQty
					transportationOrder.poId = orderid
					createTOFromRTSForOcean(transportationOrder, order, true);
				}
			}
			if (leftOverWeight > 0 || leftOverVolume >0 || leftOverQty >0){
				def transportationOrder = new TransportationOrder();
				transportationOrder.weight = leftOverWeight>0?leftOverWeight:0
				transportationOrder.volume = leftOverVolume>0?leftOverVolume:0
				transportationOrder.quantity = leftOverQty>0?leftOverQty:0
				
				transportationOrder.poId = orderid
				boolean createShipment = true;
				if (( (transportationOrder.weight < (Mot.MIN_PERC * equipWeight)))
					&&((transportationOrder.volume < (Mot.MIN_PERC * equipVol)) )
					&&((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
					)
					{
						createShipment = false;
					}
				createTOFromRTSForOcean(transportationOrder, order, createShipment);
			}

				}
	

	private void createTOFromRTSForOcean(TransportationOrder transportationOrder, RTS order, boolean createShipment){
		transportationOrder = getNewTransportationOrderObject(transportationOrder, order)

		//1st leg
		transportationOrder.origin = order.origin
		transportationOrder.origin.id = order.origin.id
		transportationOrder.fromAddress = order.fromAddress
		transportationOrder.destination = Location.findById("33")
		transportationOrder.destination.id = "33"
		transportationOrder.toAddress = Address.findById("61");

		if (createShipment)
			shipmentService.createShipmentFromTOForOcean(transportationOrder);
		else
			transportationOrder.save(failOnError: true)
		//2nd leg
		transportationOrder = getNewTransportationOrderObject(transportationOrder, order)
		transportationOrder.origin =  Location.findById("33")
		transportationOrder.origin.id = "33"
		transportationOrder.fromAddress = Address.findById("61");
		transportationOrder.destination = Location.findById("31")
		transportationOrder.destination.id = "31"
		transportationOrder.toAddress = Address.findById("59")

		if (createShipment)
			shipmentService.createShipmentFromTOForOcean(transportationOrder);
		else
			transportationOrder.save(failOnError: true)
		//3rd leg
		transportationOrder = getNewTransportationOrderObject(transportationOrder, order)
		transportationOrder.origin = Location.findById("31")
		transportationOrder.origin.id ="31"
		transportationOrder.fromAddress =  Address.findById("59")
		transportationOrder.destination = order.destination
		transportationOrder.destination.id = order.destination.id
		transportationOrder.toAddress = order.toAddress

		if (createShipment)
			shipmentService.createShipmentFromTOForOcean(transportationOrder);
		else
			transportationOrder.save(failOnError: true)
	}

	private getNewTransportationOrderObject(TransportationOrder transportationOrder1, RTS order) {
		def transportationOrder = new TransportationOrder()
		transportationOrder.weight = transportationOrder1.weight
		transportationOrder.volume = transportationOrder1.volume
		transportationOrder.quantity =transportationOrder1.quantity
		
		transportationOrder.poId = transportationOrder1.poId
		transportationOrder.toStatus="Open"
		transportationOrder.toNumber="TO_" +identifierService.generateIdentifier('NNNLLL')
		transportationOrder.orderLineNum = order.orderLineNum
		transportationOrder.productClass = order.pc
		transportationOrder.bu = Company.findById(order.bu)
		transportationOrder.companyId=  Company.findById(order.companyId)
		transportationOrder.poNumber = order.orderNumber

		transportationOrder.incoterm = order.incoterm
		transportationOrder.mot = order.mot
		transportationOrder.transResp = order.transResp
		transportationOrder.mst = order.mst
		transportationOrder.pickupStart = order.pickupStart
		transportationOrder.pickupEnd = order.pickupEnd
		transportationOrder.deliveryStart = order.deliveryStart
		transportationOrder.deliveryEnd = order.deliveryEnd
		transportationOrder.carrier = order.carrier
		return transportationOrder;
	}

	public void createTOFromRTS(TransportationOrder transportationOrder, RTS order, boolean createShipment){
		transportationOrder.toStatus="Open"
		transportationOrder.toNumber="TO_" +identifierService.generateIdentifier('NNNLLL')
		transportationOrder.origin = order.origin
		transportationOrder.destination = order.destination
		transportationOrder.origin.id = order.origin.id
		transportationOrder.destination.id = order.destination.id
		transportationOrder.orderLineNum = order.orderLineNum
		transportationOrder.productClass = order.pc
		transportationOrder.bu = Company.findById(order.bu)
		transportationOrder.companyId=  Company.findById(order.companyId)
		transportationOrder.poNumber = order.orderNumber
		
		transportationOrder.incoterm = order.incoterm
		transportationOrder.mot = order.mot
		transportationOrder.transResp = order.transResp
		transportationOrder.mst = order.mst
		transportationOrder.fromAddress = order.fromAddress
		transportationOrder.toAddress = order.toAddress
		transportationOrder.pickupStart = order.pickupStart
		transportationOrder.pickupEnd = order.pickupEnd
		transportationOrder.deliveryStart = order.deliveryStart
		transportationOrder.deliveryEnd = order.deliveryEnd
		transportationOrder.carrier = order.carrier
		
		if (createShipment)
			shipmentService.createShipmentFromTO(transportationOrder);
		else
			transportationOrder.save(failOnError: true)
	}
	
	public void addTransportationOrderFromCO(CustomerOrder customerOrder,CustomerOrderItem customerOrderItem){
		
		Float weight = customerOrderItem.weight
		Float volume = customerOrderItem.volume
		Float quantity = customerOrderItem.quantity
		customerOrder.origin = customerOrderItem.origin
		customerOrder.origin?.id = customerOrderItem.origin?.id
		customerOrder.fromAddress = customerOrderItem.origin?.address
		customerOrder.fromAddress?.id = customerOrderItem.origin?.address?.id
		Float equipWeight = Mot.MAX_EQP_WT
		Float equipVol = Mot.MAX_EQP_VOL
		float numTOsWt = weight==null?0:(weight/equipWeight);
		float numTOsVol =(volume ==null) ? 0: (volume/equipVol);// (volume?/equipVol);//
		Float maxQty = Mot.MAX_EQP_QTY;
		if (customerOrderItem.product.stackability?.equalsIgnoreCase(Product.STACKABLE)){
			 // check stackability of product and determine size
			 //TODO to check what to do with Top stackable -- guessing top means it can go on top of something else
			 //but capacity doesn't double because of it. Unless there is something to go at the bottom.
			 // for now just doubling qty if stackable
			//Wt & Vol remaining feasible, twice the number of pallets can be accomodated
			maxQty = 2 * maxQty;
		}
		float numTOsQty =  (quantity ==null) ? 0:(quantity/maxQty);
		int numTOs;
		//Float leftOver;
//		Float max;
		if (numTOsWt >= numTOsVol){
			numTOs = numTOsWt
//			leftOver = leftOverWeight
//			max = equipWeight
		}else{
			numTOs = numTOsVol
//			leftOver = leftOverVolume
//			max = equipVol
		}
		if (numTOsQty > numTOs){
			numTOs = numTOsQty
//			leftOver=leftOverQty
//			max = maxQty
		}
		Float leftOverWeight =weight==null?0:( weight - equipWeight*numTOs);
		Float leftOverVolume = (volume ==null) ? 0:(volume - equipVol*numTOs);
		Float leftOverQty = (quantity ==null) ? 0: (quantity - maxQty*numTOs);
		System.out.println("numTOs=" + numTOs)
		System.out.println("leftOverWeight=" + leftOverWeight)
		System.out.println("leftOverVolume=" + leftOverVolume)
		System.out.println("leftOverQty=" + leftOverQty)
		if (numTOs >= 1){
				for (int i=0; i<numTOs; i++){
					def transportationOrder = new TransportationOrder();
					transportationOrder.weight = equipWeight
					transportationOrder.volume = equipVol
					transportationOrder.quantity = maxQty
					//transportationOrder.poId = customerOrderItem.id
					createTOFromCustomerOrder(transportationOrder, customerOrder, true);
					
				}
			}
			if (leftOverWeight > 0 || leftOverVolume >0 || leftOverQty >0){
				def transportationOrder = new TransportationOrder();
				transportationOrder.weight = leftOverWeight>0?leftOverWeight:0
				transportationOrder.volume = leftOverVolume>0?leftOverVolume:0
				transportationOrder.quantity = leftOverQty>0?leftOverQty:0
				
				//transportationOrder.poId = customerOrderItem.id
				boolean createShipment = true;
				if (( (transportationOrder.weight < (Mot.MIN_PERC * Mot.MAX_EQP_WT)))
					&&((transportationOrder.volume < (Mot.MIN_PERC * Mot.MAX_EQP_VOL)) )
					&&((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
					)
					{
						createShipment = false;
					}
				if (! createShipment &&   (transportationOrder.weight <= Mot.MAX_PCL_WT)){
					Float dimensionalWeight = Math.round(transportationOrder.volume * 1728/139);
					//set higher of weight and dimWeight as billable weight in shipment
					  transportationOrder.dimWeight = 	(dimensionalWeight > transportationOrder.weight) ?dimensionalWeight:transportationOrder.weight;
					  if (transportationOrder.dimWeight <= Mot.MAX_PCL_WT)
								  createShipment = true;
				}
				createTOFromCustomerOrder(transportationOrder, customerOrder, createShipment);
			}

				
	}
	public void createTOFromCustomerOrder(TransportationOrder transportationOrder,CustomerOrder order,createShipment){
		
		transportationOrder.toStatus="Open"
		transportationOrder.toNumber="TO_" +identifierService.generateIdentifier('NNNLLL')
		transportationOrder.origin = order.origin
		transportationOrder.destination = order.destination
		transportationOrder.origin.id = order.origin.id
		transportationOrder.destination.id = order.destination.id
		//transportationOrder.orderLineNum = order.orderLineNum
		//transportationOrder.productClass = order.pc
		transportationOrder.bu = Company.findById(order.bu)
		transportationOrder.companyId=  Company.findById(order.companyId)
		//transportationOrder.poNumber = order.orderNumber
		transportationOrder.incoterm = order.incoterm
		transportationOrder.mot = order.mot
		transportationOrder.transResp = order.transResp
		transportationOrder.mst = order.mst
		transportationOrder.fromAddress = order.fromAddress
		transportationOrder.toAddress = order.toAddress
		transportationOrder.pickupStart = order.pickupStart
		transportationOrder.pickupEnd = order.pickupEnd
		transportationOrder.deliveryStart = order.deliveryStart
		transportationOrder.deliveryEnd = order.deliveryEnd
		transportationOrder.carrier = order.carrier
		transportationOrder.coId = order.id
		transportationOrder.coNumber = order.orderNumber
		
		if (createShipment)
			//shipmentService.createShipmentFromTOForCustomer(transportationOrder);
			shipmentService.createShipmentFromTO(transportationOrder);
		
		else
			transportationOrder.save(failOnError: true)
	
	}
	public List<TransportationOrder> getTransportationOrders(Integer companyId,String toNumber,String shipmentNumber,Location origin,Location destination,String status,String orderBy,String colName){
		def companyInstance = Company.findById(companyId)
		def orders
			orders = TransportationOrder.withCriteria {
				
				and {
					
					if(toNumber) {like("toNumber","%"+toNumber+"%")}
					if(shipmentNumber) {eq("shipment", Shipment.findByShipmentNumber(shipmentNumber))}
					if (status) { eq("toStatus", status) }
					if (origin) { eq("origin", origin) } //else {isNull("origin")}
					if (destination) { eq("destination", destination) }
					}
				if( colName) {order(colName, orderBy)}
			}
		
		return orders
	}
}
