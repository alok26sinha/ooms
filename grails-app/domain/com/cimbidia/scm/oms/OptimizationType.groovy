package com.cimbidia.scm.oms

class OptimizationType {
 String id
 String type
 
 static mapping = {
	 version false
 }
 @Override
public String toString() {

	return type.toString();
}
}
