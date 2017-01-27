/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core;

import java.util.List;

import com.cimbidia.wm.core.ActivityCode;
import com.cimbidia.wm.core.Location;

// import java.text.DecimalFormat
// import java.text.SimpleDateFormat

class LocationService {
	
	def grailsApplication
	boolean transactional = true
	
	/**
	 * Returns the Location specified by the passed id parameter;
	 * if no parameter is specified, returns a new location instance
	 *
	 * @param locationId
	 * @return
	 */
	Location getLocation(String locationId) {
		if (locationId) {
			Location location = Location.get(locationId)
			if (!location) {
				throw new Exception("No location found with locationId ${locationId}")
			}
			else {
				return location
			}
		}
		// otherwise, we need to create a new, empty location
		else {
			Location location = new Location()
			return location
		}
	}
	
	/**
	 * Saves the specified warehouse
	 *
	 * @param warehouse
	 */
	void saveLocation(Location warehouse) {
		log.debug("saving warehouse " + warehouse)
		log.debug("location type " + warehouse.locationType)
		// make sure a warehouse has an inventory
		//if (!warehouse.inventory) {
		//	addInventory(warehouse)
		//}
		log.debug warehouse.locationType

		warehouse.save(failOnError: true)
	}
	
	
	List getAllLocations() { 
		return Location.findAllByActive(true);
	}
	
	List getLoginLocations() { 
		return getLoginLocations(null)
	}
	
	
	List getLoginLocations(Integer currentLocationId) { 
		return getLoginLocations(Location.get(currentLocationId))
	}
	
	List getLoginLocations(Location currentLocation) { 
		def locations = []
		def requiredActivities = grailsApplication.config.cimbidia.loginLocation.requiredActivities
		if (requiredActivities) {
			requiredActivities.each { activity ->
				locations += getAllLocations()?.findAll { it.supports(activity) }
			}			
		}
		if (currentLocation) { 
			locations = locations - currentLocation
		}
		return locations
	}
	
	
	Map getLoginLocationsMap(Location currentLocation) { 
		return getLoginLocations(currentLocation).sort { it.locationGroup }.groupBy { it.locationGroup }
	}
	
	List getDepots() {
		return getAllLocations()?.findAll { it.supports(ActivityCode.MANAGE_INVENTORY) }
	}

	List getNearbyLocations(Location currentLocation) { 
		return Location.findAllByActiveAndLocationGroup(true, currentLocation.locationGroup)
	}
	
	List getExternalLocations() { 
		return getAllLocations()?.findAll { it.supports(ActivityCode.EXTERNAL) } 
	}
	
	List getDispensaries(Location currentLocation) { 
		return getNearbyLocations(currentLocation)?.findAll { it.supports(ActivityCode.RECEIVE_STOCK) && !it.supports(ActivityCode.EXTERNAL) } 
	}
	
	List getLocationsSupportingActivity(ActivityCode activity) { 
		return getAllLocations()?.findAll { it.supports(activity) }
		
	}
	
	List getShipmentOrigins() { 
		return getLocationsSupportingActivity(ActivityCode.SEND_STOCK)
	}
	
	List getShipmentDestinations() {
		return getLocationsSupportingActivity(ActivityCode.RECEIVE_STOCK)
	}

	List getOrderSuppliers(Location currentLocation) {
		return getLocationsSupportingActivity(ActivityCode.FULFILL_ORDER) - currentLocation
	}

	List getRequestOrigins(Location currentLocation) {
		return getLocationsSupportingActivity(ActivityCode.FULFILL_REQUEST)// - currentLocation
	}

	List getRequestDestinations(Location currentLocation) {
		return getLocationsSupportingActivity(ActivityCode.FULFILL_REQUEST)// - currentLocation
	}

	List getTransactionSources(Location currentLocation) { 
		return getLocationsSupportingActivity(ActivityCode.SEND_STOCK) - currentLocation
	}
	
	List getTransactionDestinations(Location currentLocation) { 
		// Always get nearby locations		
		def locations = getNearbyLocations(currentLocation);		
		
		// Get all external locations (if supports external) 
		if (currentLocation.supports(ActivityCode.EXTERNAL)) { 			
			locations += getExternalLocations();			
		}

		// Of those locations remaining, we need to return only locations that can receive stock
		locations = locations.findAll { it.supports(ActivityCode.RECEIVE_STOCK) }
		
		// Remove current location from list
		locations = locations?.unique() - currentLocation

		return locations
		
	}
	
	List<String> findLocation(String locationId, String locationTypeId)
	{
		List<Location> loc = Location.createCriteria().list {
			and  {
					if(locationId!=null && locationId.length()>0){
					eq("id", locationId)
					}
					if(locationTypeId!=null && locationTypeId.length()>0){
					eq("locationType.id", locationTypeId)
					}
				}
		}
		return loc.id
	}
	
   
}
