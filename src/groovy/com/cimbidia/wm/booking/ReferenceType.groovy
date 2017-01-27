/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 

package com.cimbidia.wm.booking

public enum ReferenceType {
	
	BILL_OF_LADING('Bill Of Lading','BM'),
	BOOKING('Booking','BN'),
	CONSIGNEES_ORDER_NUM('Consignees Order Number','CG'),
	CUST_REF_NUM('Customer Reference Number','CR'),
	FORWARDERS_AGENT_REF_NUM('Forwarders Agents Reference Number','FN'),
	SHIPPERS_IDENT_NUM('Shippers Identifying Number For Shipment','SI'),
	TARRIFF_NUM('Tarriff Number','TS'),
	CARRIER_ASSIGNED_REF_NUM('Carrier Assigned Reference Number','ZH'),
	
	final String name
	final String code
	
	ReferenceType(String name, String code) { this.name = name; this.code = code ; }
	
	static list() {
		[BILL_OF_LADING, BOOKING, CONSIGNEES_ORDER_NUM, CUST_REF_NUM, FORWARDERS_AGENT_REF_NUM, SHIPPERS_IDENT_NUM, TARRIFF_NUM, CARRIER_ASSIGNED_REF_NUM]
	}

	String toString() { return this.name }
}
