/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.order



import com.cimbidia.scm.admin.Company;
import com.cimbidia.wm.core.*
import com.cimbidia.wm.order.OrderStatus;
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Document;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.core.Mot;
import com.cimbidia.scm.constants.Constants
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Order implements Serializable {
	
	String id
	Company company
	Integer bu
	OrderStatus status 
	String description 		
	String orderNumber 		
	Location origin			
	Location destination 	 
	Date dateOrdered  //issue date
	int sequence
	Company seller
	Constants incoterm
	Mot mot
  	Constants transResp
	Company billTo
	Company carrier
	String contentDescription
	Date dueDate
	boolean mst
	Address fromAddress
	Address toAddress
	Date pickupStart
	Date pickupEnd
	Date deliveryStart
	Date deliveryEnd
	
	// Audit fields
	Date dateCreated
	Date lastUpdated
	Integer daysOpen
	List orderItems = new ArrayList()
	
	//static transients = ['destination', 'origin']
	
	static hasMany = [ 
		orderItems : OrderItem, 
		orderItemsRTS : RTS
		 ]
	static mapping = {
		
		id generator: 'uuid'
		table "`order`"
		
		daysOpen formula: "CURRENT_DATE  - date_ordered"
		//orderItems lazy : false
		//orderItemsRTS lazy : false
		
		origin lazy : false
		fromAddress lazy : false
		toAddress lazy : false
		toAddress cascade : "save-update"
		fromAddress cascade : "save-update"
		destination lazy : false
		incoterm column : "incoterm"
		billTo column : "bill_to"
		carrier column : "carrier"
		mot column : "mot"
		transResp column : "trans_resp"
		contentDescription column : "content_description"
		fromAddress column : "from_address"
		toAddress column : "to_address"
		origin cascade : "none" 
		status cascade : "none"
		seller cascade : "none"
		company cascade : "none"
		incoterm cascade : "none"
		mot cascade : "none"
		transResp cascade : "none"
		billTo cascade : "none"
		carrier cascade : "none"
		destination cascade : "none"
		orderItems cascade: "all-delete-orphan"
		orderItemsRTS cascade: "all-delete-orphan"
		
	}
	
	//static notCloneable = ['comments', 'documents', 'events']
	def getOrderItemsList() {
		return LazyList.decorate(
			  orderItems,
			  FactoryUtils.instantiateFactory(OrderItem.class))
	}
	static constraints  = { 
		status(nullable:true)
		description(nullable:true, maxSize: 255)
		orderNumber(nullable:true, maxSize: 255)
		origin(nullable:true, maxSize: 255)
		destination(nullable:false,blank: false, maxSize: 255)
		
		dateOrdered(nullable:true,blank: false)
		dueDate (nullable:true )
		deliveryEnd (nullable:true )
		deliveryStart (nullable:true )
		dateCreated(nullable:true,blank: false)
		lastUpdated(nullable:true,blank: false)
		pickupStart(nullable: true)
		pickupEnd(nullable: true)
		toAddress(nullable: true)
		fromAddress(nullable: true)
		bu(nullable:true)
		carrier(nullable:true)
		billTo (nullable:true)
		mst (nullable:true)
		seller (nullable:false)
		contentDescription(nullable:true)
		
		/*orderItems validator: {
			it?.every { 
				it?.validate()
			
		}
		}*/
		/*orderItemsRTS validator: {
			it?.every { 
				it?.validate()
			
		}
			}*/
		/*dueDate validator: { value, oi ->
			return value && value < oi.dateOrdered
		}
		dueDate validator: { value, oi ->
			return value && value < oi.dateOrdered
		}*/
		
		/*toAddress validator: { value, toa, errors ->
			
			if(!(toa?.toAddress?.address && toa?.toAddress?.city && toa?.toAddress?.stateOrProvince ))	{
				errors.rejectValue("toAddress", "toAddress", "To Address can not be blank.")
				return false;
			}
			return true;
		}*/
		
		/*fromAddress validator: { value, toa, errors ->
			
			if(!(toa?.fromAddress?.address && toa?.fromAddress?.city && toa?.fromAddress?.stateOrProvince))	{
				errors.rejectValue("fromAddress", "fromAddress", "From Address can not be blank.")
				return false;
			}
			return true;
		}*/
		dueDate validator: { value, o, errors ->
			if ( value && value < o.dateOrdered ) {
				
				errors.rejectValue( "dueDate", "order.dateOrdered.afterDueDate", "Due Date cannot be before Issue Date.")
				return false
			}
			 
			return true
		}
		dateOrdered validator: { value, o, errors ->
			if ( value ==null ) {
				
				o.dateOrdered =  new Date()
				
			}
			 
			return true
		}
		
		deliveryEnd validator: { value, o, errors ->
			
			if ( value == null  ) {
				
				if(o.dueDate== null){
				errors.rejectValue( "deliveryEnd", "order.deliveryEnd.notnull", "Delivery Date can not be left blank")
				return false
				}
				else{
					o.deliveryEnd=o.dueDate
					o.deliveryStart = new Date()
					return true;
				}
			}
			
			 
			return true
		}
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((billTo == null) ? 0 : billTo.hashCode());
		result = prime * result + ((bu == null) ? 0 : bu.hashCode());
		result = prime * result + ((carrier == null) ? 0 : carrier.hashCode());
		result = prime * result
				+ ((company == null) ? 0 : company.hashCode());
		result = prime		* result
				+ ((contentDescription == null) ? 0 : contentDescription
						.hashCode());
		result = prime * result
				+ ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result
				+ ((dateOrdered == null) ? 0 : dateOrdered.hashCode());
		result = prime * result
				+ ((deliveryEnd == null) ? 0 : deliveryEnd.hashCode());
		result = prime * result
				+ ((deliveryStart == null) ? 0 : deliveryStart.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result
				+ ((destination == null) ? 0 : destination.hashCode());
		result = prime * result + ((dueDate == null) ? 0 : dueDate.hashCode());
		result = prime * result
				+ ((fromAddress == null) ? 0 : fromAddress.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((incoterm == null) ? 0 : incoterm.hashCode());
		result = prime * result
				+ ((lastUpdated == null) ? 0 : lastUpdated.hashCode());
		result = prime * result + ((mot == null) ? 0 : mot.hashCode());
		result = prime * result + (mst ? 1231 : 1237);
		result = prime * result
				+ ((orderItems == null) ? 0 : orderItems.hashCode());
		result = prime * result
				+ ((orderNumber == null) ? 0 : orderNumber.hashCode());
		result = prime * result + ((origin == null) ? 0 : origin.hashCode());
		result = prime * result
				+ ((pickupEnd == null) ? 0 : pickupEnd.hashCode());
		result = prime * result
				+ ((pickupStart == null) ? 0 : pickupStart.hashCode());
		result = prime * result + ((seller == null) ? 0 : seller.hashCode());
		result = prime * result + sequence;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result
				+ ((toAddress == null) ? 0 : toAddress.hashCode());
		result = prime * result
				+ ((transResp == null) ? 0 : transResp.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (billTo == null) {
			if (other.billTo != null)
				return false;
		} else if (!billTo.equals(other.billTo))
			return false;
		if (bu == null) {
			if (other.bu != null)
				return false;
		} else if (!bu.equals(other.bu))
			return false;
		if (carrier == null) {
			if (other.carrier != null)
				return false;
		} else if (!carrier.equals(other.carrier))
			return false;
		if (company == null) {
			if (other.company != null)
				return false;
		} else if (!company.equals(other.company))
			return false;
		if (contentDescription == null) {
			if (other.contentDescription != null)
				return false;
		} else if (!contentDescription.equals(other.contentDescription))
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (dateOrdered == null) {
			if (other.dateOrdered != null)
				return false;
		} else if (!dateOrdered.equals(other.dateOrdered))
			return false;
		if (deliveryEnd == null) {
			if (other.deliveryEnd != null)
				return false;
		} else if (!deliveryEnd.equals(other.deliveryEnd))
			return false;
		if (deliveryStart == null) {
			if (other.deliveryStart != null)
				return false;
		} else if (!deliveryStart.equals(other.deliveryStart))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (destination == null) {
			if (other.destination != null)
				return false;
		} else if (!destination.equals(other.destination))
			return false;
		if (dueDate == null) {
			if (other.dueDate != null)
				return false;
		} else if (!dueDate.equals(other.dueDate))
			return false;
		if (fromAddress == null) {
			if (other.fromAddress != null)
				return false;
		} else if (!fromAddress.equals(other.fromAddress))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (incoterm == null) {
			if (other.incoterm != null)
				return false;
		} else if (!incoterm.equals(other.incoterm))
			return false;
		if (lastUpdated == null) {
			if (other.lastUpdated != null)
				return false;
		} else if (!lastUpdated.equals(other.lastUpdated))
			return false;
		if (mot == null) {
			if (other.mot != null)
				return false;
		} else if (!mot.equals(other.mot))
			return false;
		if (mst != other.mst)
			return false;
		if (orderItems == null) {
			if (other.orderItems != null)
				return false;
		} else if (!orderItems.equals(other.orderItems))
			return false;
		if (orderNumber == null) {
			if (other.orderNumber != null)
				return false;
		} else if (!orderNumber.equals(other.orderNumber))
			return false;
		if (origin == null) {
			if (other.origin != null)
				return false;
		} else if (!origin.equals(other.origin))
			return false;
		if (pickupEnd == null) {
			if (other.pickupEnd != null)
				return false;
		} else if (!pickupEnd.equals(other.pickupEnd))
			return false;
		if (pickupStart == null) {
			if (other.pickupStart != null)
				return false;
		} else if (!pickupStart.equals(other.pickupStart))
			return false;
		if (seller == null) {
			if (other.seller != null)
				return false;
		} else if (!seller.equals(other.seller))
			return false;
		if (sequence != other.sequence)
			return false;
		if (status != other.status)
			return false;
		if (toAddress == null) {
			if (other.toAddress != null)
				return false;
		} else if (!toAddress.equals(other.toAddress))
			return false;
		if (transResp == null) {
			if (other.transResp != null)
				return false;
		} else if (!transResp.equals(other.transResp))
			return false;
		return true;
	}

	/*def getOrderItemList() {
		return LazyList.decorate(
			  orderItems,
			  FactoryUtils.instantiateFactory(OrderItems.class))
	}
	*/
	/**
	 * Override the status getter so that we return pending if no state set
	 */
	OrderStatus getStatus() {
		return status ?: OrderStatus.NEW
	}
	
	
	/**
	* Checks to see if this order has been received, or partially received, and 
	* the update the status accordingly
	* (Note that does not know how to set to the PLACED state; this must be
	*  done manually)
	*/
	OrderStatus updateStatus() {
		
	   
	   /*if (orderItems?.size() > 0 && orderItems?.size() == orderItems?.findAll { it.isCompletelyFulfilled() }?.size()) {
		   status = OrderStatus.RECEIVED
	   }
	   else if (orderItems?.size() > 0 && orderItems?.find { it.isPartiallyFulfilled() }) {
		   status = OrderStatus.PARTIALLY_RECEIVED
	   }
	   else if (!status) {*/
		   status = OrderStatus.NEW
	  // }
	 
	   return status
	}	
   
	/**
	 * @return	a boolean indicating whether the order is pending
	 */
	Boolean isPending() { 
		return (status == null || status == OrderStatus.NEW )
	}
	
	/**
	 * @return	a boolean indicating whether the order has been placed
	 */
	Boolean isPlaced() { 
		return (status in [OrderStatus.RELEASED, OrderStatus.ACCEPTED, OrderStatus.PARTIALLY_RECEIVED, OrderStatus.RECEIVED])
	}
	
	/**
	* After an order is placed and before it is completed received, the order can
	* be partially received.  This occurs when the order contains items that have
	* been completely received and some that have not been completely received.
	*
	* @return
	*/
	Boolean isPartiallyReceived() {
			return (status == OrderStatus.PARTIALLY_RECEIVED)
	}
	
	/**
	 * @return	a boolean indicating whether the order has been received
	 */
	Boolean isReceived() { 
		return (status == OrderStatus.RECEIVED)
	}
	
	def shipments() { 
		return orderItems.collect { it.shipments() }.flatten().unique() { it?.id }
	}
	
	def totalPrice() { 
		return orderItems.collect { it.totalPrice() }.sum();
	}
	
	static namedQueries = {
	   findByComment {
	        commentId ->
	          comments {
	              eq 'id', commentId
	      }
	    }
	}
	
	/*List addToOrderItems(OrderItem oi){
		orderItems.add(oi)
		return orderItems
	}*/
}