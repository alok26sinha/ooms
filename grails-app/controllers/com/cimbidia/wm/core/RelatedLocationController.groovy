package com.cimbidia.wm.core

import org.codehaus.groovy.grails.web.json.JSONObject
import grails.converters.JSON

class RelatedLocationController {

	def scaffold = RelatedLocation
    def index() { }
    
    def jq_relatedLocNames = {
    		def relatedLocationInstanceList 
    		
    		println "params.locationId="+ params.locationId
		    if(params.locationId)	
	    	{
	    		Location loc = Location.get(params.locationId)
	    		relatedLocationInstanceList= RelatedLocation.findAllByLocation(loc)
	       	}
	    	else
	    	{
	    		relatedLocationInstanceList = RelatedLocation.findAll()
	    	}
	    	
	    	println "relatedLocationInstanceList="+ relatedLocationInstanceList
	    	
	    	Map relLocMap = new HashMap();
	    	relatedLocationInstanceList.each() {
	    	
	    	    	String key = it.relatedLocation.id
		    		String value = it.relatedLocation.name
		    		println "key="+key+ " value="+value
		    		relLocMap.put(key,value)
	    	}

			def relLocJSON = { relLocMap : relLocMap }
	    	render relLocJSON as JSON
	    	
	    	
   	}
    
    def list = {
    println "in list of relatedlocation"
    	def relatedLocationInstanceList 
    	if(params.location?.id)	
    	{
    		Location loc = Location.get(params.location.id)
    		relatedLocationInstanceList= RelatedLocation.findAllByLocation(loc)
       	}
    	else
    	{
    		relatedLocationInstanceList = RelatedLocation.findAll()
    	}
    	[relatedLocationInstanceList : relatedLocationInstanceList, relatedLocationInstanceTotal:relatedLocationInstanceList?.size()]
    	
    }
}
