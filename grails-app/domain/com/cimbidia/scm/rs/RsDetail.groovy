package com.cimbidia.scm.rs;

class RsDetail {

	String id
	String parentId
	String cycleType
	Integer level
	boolean autoTender
	
	static mapping = {
		id generator: 'uuid'
	
	  }

	@Override
	public String toString() {
		return cycleType + "RsDetail [id=" + id + ", parentId=" + parentId + ", cycleType="
				+ cycleType + ", level=" + level + ", autoTender=" + autoTender
				+ "]";
	}
	
	
}
