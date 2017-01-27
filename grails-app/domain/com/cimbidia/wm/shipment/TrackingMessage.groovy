package com.cimbidia.wm.shipment

//import com.cimbidia.scm.TrackingMessageController;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.booking.Booking
import com.cimbidia.wm.core.Address
import com.cimbidia.wm.core.Location

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;
import java.util.Formatter.DateTime
import groovy.time.TimeCategory

class TrackingMessage {
	String id
	Shipment shipment
	String msgType
	Date msgDate
	String comments
	Company carrier
	Booking booking
	Integer stopNumber
	Date createdDate
	Date lastUpdated
	String reasonCode
	Location location
	Address address
	String vehicle
	String stopType
	def authService
	static belongsTo = [ shipment : Shipment,location:Location]
	
    static constraints = {
		carrier (nullable:true)
		stopNumber(nullable:true)
		createdDate(nullable:true)
		reasonCode(nullable:true)
		comments(nullable:true)
		msgDate(nullable:true)
		msgType(nullable:true)
		location(nullable:true)
		address(nullable:true)
		shipment(nullable:true)
		booking(nullable:true)
		vehicle(nullable:true)
		stopType(nullable:true)
    }
	
	static mapping = {
		id generator: 'uuid'
		table "`tracking_messages`"
		msgDate column : "message_date"
		msgType column : "message_type"
		comments column : "comments"
		stopNumber column : "stop_number"
		createdDate column : "created_date"
		reasonCode column : "reason_code"
		carrier column : "carrier_id"
		//shipmentId column : "shipment_id"
		location column : "location_id"
		address column : "address_id"
		booking column : "booking_id"
		}
	@Override
	public String toString() {
		return "TrackingMessage [id=" + id + ", shipment=" + shipment 				+ ", msgType=" + msgType + ", msgDate=" + msgDate				+ ", comments=" + comments + ", carrier=" + carrier				+ ", booking=" + booking + ", stopNumber=" + stopNumber				+ ", createdDate=" + createdDate + ", lastUpdated="				+ lastUpdated + ", reasonCode=" + reasonCode + ", location="				+ location + ", address=" + address + ", authService="				+ authService + "]";
	}
	
		public String toString1(){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate
		String endDate
		if(msgDate!=null){
			
			strDate=df.format(msgDate)
			use( TimeCategory ) {
				endDate=df.format(msgDate + 30.minutes)
			}
		}else{
		strDate=""
		}
		/*Integer companyIdSesison=getComanyId()
		println "companyIdSession : "+companyIdSesison
		Company comanySession=getCompany()
		println "company Session : "+comanySession
		*/
		/*if(session.companyTypeId == 10 ){
			if(carrier==session.companyInstance){
				return "{class:'"+ carrier +"',title:'"+ carrier +"',start: '" +strDate + "', allDay : false}"
			}else{
			return "{class:'"+ carrier +"',title:'busy',start: '" +strDate + "', allDay : false}"
			}
		}*/
		
		return "{className:'"+ carrier +"',id:'"+id+"',shipNum:'"+shipment?.shipmentNumber+"',title:'"+ carrier +"',start: '" +strDate + "',end:'"+endDate+"', allDay : false}"
	}
	
}
