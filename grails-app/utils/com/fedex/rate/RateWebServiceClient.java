package com.fedex.rate;


import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.axis.types.NonNegativeInteger;

import com.fedex.rate.stub.*;
import com.cimbidia.wm.core.rg.FedexRate;

/** 
 * Sample code to call Rate Web Service with Axis 
 * <p>
 * com.fedex.rate.stub is generated via WSDL2Java, like this:<br>
 * <pre>
 * java org.apache.axis.wsdl.WSDL2Java -w -p com.fedex.rate.stub http://www.fedex.com/...../RateService?wsdl
 * </pre>
 * 
 * This sample code has been tested with JDK 5 and Apache Axis 1.4
 */
public class RateWebServiceClient {  
	//
	public static void main(String []args)
	{
	 //new RateWebServiceClient().getRate(null, null,null, null,1 ,1,"","","","");
	}
	public   List<FedexRate> getRate(com.cimbidia.wm.core.Address fromAddress, com.cimbidia.wm.core.Address toAddress, Weight weight, Dimensions dimensions,int groupPackageCount, int packageCount,String pckgType,String serviceType, String dropType,String dateRequest) {   
		// Build a RateRequest request object
		boolean getAllRatesFlag = false; // set to true to get the rates for different service types
	    RateRequest request = new RateRequest();
	    request.setClientDetail(createClientDetail());
        request.setWebAuthenticationDetail(createWebAuthenticationDetail());
        request.setReturnTransitAndCommit(true);
	    //
	    TransactionDetail transactionDetail = new TransactionDetail();
	    transactionDetail.setCustomerTransactionId("java sample - Rate Request"); // The client will get the same value back in the response
	    request.setTransactionDetail(transactionDetail);

        //
        VersionId versionId = new VersionId("crs", 14, 0, 0);
        request.setVersion(versionId);
        
        //
        RequestedShipment requestedShipment = new RequestedShipment();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        try {
			java.util.Date reqDate = sdf.parse(dateRequest);
			Calendar cal = Calendar.getInstance();
			cal.setTime(reqDate);
			requestedShipment.setShipTimestamp(cal);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
        requestedShipment.setShipTimestamp(Calendar.getInstance());
        requestedShipment.setDropoffType(getDropType(dropType));
        if (! getAllRatesFlag) {
        	requestedShipment.setServiceType(getServiceType(serviceType));
        	requestedShipment.setPackagingType(getPackageType(pckgType));
        }
        
        
        Party shipper = new Party();
	    Address shipperAddress = new Address(); // Origin information
	    shipperAddress.setStreetLines(new String[] {fromAddress.getAddress()+","+fromAddress.getAddress2()});
	    shipperAddress.setCity(fromAddress.getCity());
	    shipperAddress.setStateOrProvinceCode(fromAddress.getStateOrProvince());
	    shipperAddress.setPostalCode(fromAddress.getPostalCode());
	    System.out.println(fromAddress.getCountry());
	    if (fromAddress.getCountry().equals("usa"))
	    	shipperAddress.setCountryCode("US");
        shipper.setAddress(shipperAddress);
        requestedShipment.setShipper(shipper);

	    //
        Party recipient = new Party();
	    Address recipientAddress = new Address(); // Destination information
	    recipientAddress.setStreetLines(new String[] {toAddress.getAddress()+","+toAddress.getAddress2()});
	    recipientAddress.setCity(toAddress.getCity());
	    recipientAddress.setStateOrProvinceCode(toAddress.getStateOrProvince());
	    recipientAddress.setPostalCode(toAddress.getPostalCode());
	    	System.out.println(toAddress.getCountry());
	    if (toAddress.getCountry().equals("usa"))
	    	recipientAddress.setCountryCode("US");
	    recipient.setAddress(recipientAddress);
	    requestedShipment.setRecipient(recipient);

	    //
	    Payment shippingChargesPayment = new Payment();
	    shippingChargesPayment.setPaymentType(PaymentType.SENDER);
	    requestedShipment.setShippingChargesPayment(shippingChargesPayment);

	    RequestedPackageLineItem rp = new RequestedPackageLineItem();
	    rp.setGroupPackageCount(new NonNegativeInteger(""+groupPackageCount+""));
	    rp.setWeight(new Weight(weight.getUnits(), weight.getValue()));
	    //
	    rp.setInsuredValue(new Money("USD", new BigDecimal("100.00")));
	    //
	    rp.setDimensions(new Dimensions(dimensions.getLength(), dimensions.getWidth(), dimensions.getHeight(), dimensions.getUnits()));
	    PackageSpecialServicesRequested pssr = new PackageSpecialServicesRequested();
	    rp.setSpecialServicesRequested(pssr);
	    requestedShipment.setRequestedPackageLineItems(new RequestedPackageLineItem[] {rp});

	    
	    requestedShipment.setPackageCount(new NonNegativeInteger(""+packageCount+""));
	    requestedShipment.setRateRequestTypes(new RateRequestType[] {RateRequestType.ACCOUNT});
	    request.setRequestedShipment(requestedShipment);
	    
	    //
		try {
			// Initialize the service
			RateServiceLocator service;
			RatePortType port;
			//
			service = new RateServiceLocator();
			updateEndPoint(service);
			port = service.getRateServicePort();
			// This is the call to the web service passing in a RateRequest and returning a RateReply
			RateReply reply = port.getRates(request); // Service call
			if (isResponseOk(reply.getHighestSeverity())) {
				 List<FedexRate> frl = writeServiceOutput(reply);
				return frl;
			} 
			printNotifications(reply.getNotifications());

		} catch (Exception e) {
		    e.printStackTrace();
		}
		return null; 
	}
	
	private DropoffType getDropType(String dropType) {
		System.out.println("drop Type "+dropType);
		if(dropType.equals("BUSINESS_SERVICE_CENTER")){
			
			return DropoffType.BUSINESS_SERVICE_CENTER;
		}
		else if(dropType.equals("DROP_BOX")){
			return DropoffType.DROP_BOX;
		}
		else if(dropType.equals( "REGULAR_PICKUP")){
			return DropoffType.REGULAR_PICKUP;
		}
		else if(dropType.equals("REQUEST_COURIER")){
			return DropoffType.REQUEST_COURIER;
		}
		else {
			return DropoffType.STATION;
		}
	}
	private ServiceType getServiceType(String serviceType) {
		System.out.println("Service Type "+serviceType);
		if(serviceType.equals("SAME_DAY")){
		
			return ServiceType.SAME_DAY;
		}
		else if(serviceType.equals("SAME_DAY_CITY")){
			return ServiceType.SAME_DAY_CITY;
		}
		else if(serviceType.equals( "SMART_POST")){
			return ServiceType.SMART_POST;
		}
		else if(serviceType.equals("STANDARD_OVERNIGHT")){
			return ServiceType.STANDARD_OVERNIGHT;
		}
		else {
			return ServiceType.PRIORITY_OVERNIGHT;
		}
		
	}
	private PackagingType getPackageType(String pckgType) {
		System.out.println("Package Type "+pckgType);
		if(pckgType.equals("FEDEX_10KG_BOX")){
			
			return PackagingType.FEDEX_10KG_BOX;
		}
		else if(pckgType.equals("FEDEX_25KG_BOX")){
			return PackagingType.FEDEX_25KG_BOX;
		}
		else if(pckgType.equals( "FEDEX_BOX")){
			return PackagingType.FEDEX_BOX;
		}
		else if(pckgType.equals("FEDEX_ENVELOPE")){
			return PackagingType.FEDEX_ENVELOPE;
		}
		else if(pckgType.equals("FEDEX_PAK")){
			return PackagingType.FEDEX_PAK;
		}
		else if(pckgType.equals("FEDEX_TUBE")){
			return PackagingType.FEDEX_TUBE;
		}
		else {
			return PackagingType.YOUR_PACKAGING;
		}
	}
	
	public  List<FedexRate> writeServiceOutput(RateReply reply) {
		RateReplyDetail[] rrds = reply.getRateReplyDetails();
		List<FedexRate> frl =  new ArrayList<FedexRate>();
		for (int i = 0; i < rrds.length; i++) {
			RateReplyDetail rrd = rrds[i];
			//print("\nService type", rrd.getServiceType());
			print("Packaging type", rrd.getPackagingType());
			//print("Delivery DOW", rrd.getDeliveryDayOfWeek());
			int month = rrd.getDeliveryTimestamp().get(Calendar.MONTH)+1;
			int date = rrd.getDeliveryTimestamp().get(Calendar.DAY_OF_MONTH);
			int year = rrd.getDeliveryTimestamp().get(Calendar.YEAR);
			String delDate = new String(month + "/" + date + "/" + year);
			print("Delivery date", delDate);
			print("Calendar DOW", rrd.getDeliveryTimestamp().get(Calendar.DAY_OF_WEEK));
		
			RatedShipmentDetail[] rsds = rrd.getRatedShipmentDetails();
			for (int j = 0; j < 1; j++) {// rsds.length
				print("RatedShipmentDetail " + j, "");
				RatedShipmentDetail rsd = rsds[j];
				ShipmentRateDetail srd = rsd.getShipmentRateDetail();
				print("  Rate type", srd.getRateType());
				printWeight("  Total Billing weight", srd.getTotalBillingWeight());
				printMoney("  Total surcharges", srd.getTotalSurcharges());
				printMoney("  Total net charge", srd.getTotalNetCharge());
				
				FedexRate fr = new FedexRate();
				fr.setCarrier("Fedex");
				fr.setDeliveryTimeStamp(rrd.getDeliveryTimestamp().get(Calendar.DAY_OF_WEEK));
				fr.setDeliveryDate(delDate);
				fr.setPackagingType(rrd.getPackagingType());
				fr.setRateType(srd.getRateType());
				fr.setSurcharge(srd.getTotalSurcharges());
				fr.setWeight(srd.getTotalBillingWeight());
				fr.setTotalCharge(srd.getTotalNetCharge());
				fr.setMessage(reply.getNotifications().toString());
				//fr.setTransitTime(rrd.getTransitTime().getValue());
				fr.setBaseCharge(srd.getTotalBaseCharge());
				fr.setTotalSurcharges(srd.getTotalSurcharges());
				RatedPackageDetail[] rpds = rsd.getRatedPackages();
				if (rpds != null && rpds.length > 0) {
					print("  RatedPackageDetails", "");
					for (int k = 0; k < rpds.length; k++) {
						print("  RatedPackageDetail " + i, "");
						RatedPackageDetail rpd = rpds[k];
						PackageRateDetail prd = rpd.getPackageRateDetail();
						if (prd != null) {
							printWeight("    Billing weight", prd.getBillingWeight());
							printMoney("    Base charge", prd.getBaseCharge());
							Surcharge[] surcharges = prd.getSurcharges();
							if (surcharges != null && surcharges.length > 0) {
								for (int m = 0; m < surcharges.length; m++) {
									Surcharge surcharge = surcharges[m];
									printMoney("    " + surcharge.getDescription() + " surcharge", surcharge.getAmount());
								}
							}
						}
					}
				}
				frl.add(fr);
			}
			System.out.println("");
		}
		return frl;
	}
	
	private  ClientDetail createClientDetail() {
        ClientDetail clientDetail = new ClientDetail();
        String accountNumber = System.getProperty("accountNumber");
        String meterNumber = System.getProperty("meterNumber");
        
        //
        // See if the accountNumber and meterNumber properties are set,
        // if set use those values, otherwise default them to "XXX"
        //
        if (accountNumber == null) {
        	accountNumber = "604501202"; // Replace "XXX" with clients account number
        }
        if (meterNumber == null) {
        	meterNumber = "100232980"; // Replace "XXX" with clients meter number
        }
        clientDetail.setAccountNumber(accountNumber);
        clientDetail.setMeterNumber(meterNumber);
        return clientDetail;
	}
	
	private  WebAuthenticationDetail createWebAuthenticationDetail() {
        WebAuthenticationCredential wac = new WebAuthenticationCredential();
        String key = System.getProperty("key");
        String password = System.getProperty("password");
        
        //
        // See if the key and password properties are set,
        // if set use those values, otherwise default them to "XXX"
        //
        if (key == null) {
        	key = "Ag2RQZJ5jyxfbMsU"; // Replace "XXX" with clients key
        }
        if (password == null) {
        	password = "2jpd5YHluQssbOEJAMC1yYmgA"; // Replace "XXX" with clients password
        }
        wac.setKey(key);
        wac.setPassword(password);
        System.out.println(wac.getKey() + "::" + wac.getPassword());
		return new WebAuthenticationDetail(wac);
	}
	
	private static void printNotifications(Notification[] notifications) {
		System.out.println("Notifications:");
		if (notifications == null || notifications.length == 0) {
			System.out.println("  No notifications returned");
		}
		for (int i=0; i < notifications.length; i++){
			Notification n = notifications[i];
			System.out.print("  Notification no. " + i + ": ");
			if (n == null) {
				System.out.println("null");
				continue;
			} else {
				System.out.println("");
			}
			NotificationSeverityType nst = n.getSeverity();

			System.out.println("    Severity: " + (nst == null ? "null" : nst.getValue()));
			System.out.println("    Code: " + n.getCode());
			System.out.println("    Message: " + n.getMessage());
			System.out.println("    Source: " + n.getSource());
		}
	}
	
	private  boolean isResponseOk(NotificationSeverityType notificationSeverityType) {
		if (notificationSeverityType == null) {
			return false;
		}
		if (notificationSeverityType.equals(NotificationSeverityType.WARNING) ||
			notificationSeverityType.equals(NotificationSeverityType.NOTE)    ||
			notificationSeverityType.equals(NotificationSeverityType.SUCCESS)) {
			return true;
		}
 		return false;
	}
	
	private  void print(String msg, Object obj) {
		if (msg == null || obj == null) {
			return;
		}
		System.out.println(msg + ": " + obj.toString());
	}
	
	private  void printMoney(String msg, Money money) {
		if (msg == null || money == null) {
			return;
		}
		System.out.println(msg + ": " + money.getAmount() + " " + money.getCurrency());
	}
	
	private  void printWeight(String msg, Weight weight) {
		if (msg == null || weight == null) {
			return;
		}
		System.out.println(msg + ": " + weight.getValue() + " " + weight.getUnits());
	}

	private  void updateEndPoint(RateServiceLocator serviceLocator) {
		String endPoint = System.getProperty("endPoint");
		if (endPoint != null) {
			serviceLocator.setRateServicePortEndpointAddress(endPoint);
		}
	}

}
