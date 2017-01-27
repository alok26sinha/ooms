package com.cimbidia.wm.core.rg


class RoutingRatingLookupResult implements Comparable<RoutingRatingLookupResult>
{

	RoutingGuideCarrier routingGuideCarrier
	RatingLaneCarrier ratingLaneCarrier

	//carrier priority
	public int compareTo(Object compareObj)
	{
		Integer thisPriority = this.routingGuideCarrier.carrierPriority?:0
		
		RoutingRatingLookupResult compare = (RoutingRatingLookupResult)compareObj
		Integer comparePriority = compare.routingGuideCarrier.carrierPriority?:0
		
		return thisPriority.compareTo(comparePriority); 
	}
	
	//total cost
	public static Comparator<RoutingRatingLookupResult> TotalCostComparator = new Comparator<RoutingRatingLookupResult>() {
			
		int compare(Object  obj1,Object obj2)
		{
			RoutingRatingLookupResult routingRatingLookupResult1 = (RoutingRatingLookupResult)obj1
			RoutingRatingLookupResult routingRatingLookupResult2 = (RoutingRatingLookupResult)obj2
			 
			Float totalCost1 = routingRatingLookupResult1.ratingLaneCarrier.totalCost?:0
			Float totalCost2 = routingRatingLookupResult2.ratingLaneCarrier.totalCost?:0
			
			return totalCost1.compareTo(totalCost2); 
		}
	};
	
	
}
	