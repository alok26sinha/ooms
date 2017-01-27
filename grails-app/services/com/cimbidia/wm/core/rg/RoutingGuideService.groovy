/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core.rg

import java.util.Calendar;
import java.util.List;

import grails.validation.ValidationException

import com.fedex.rate.RateWebServiceClient
import com.fedex.rate.stub.PackageRateDetail;
import com.fedex.rate.stub.RateReply
import com.fedex.rate.stub.RateReplyDetail;
import com.fedex.rate.stub.RatedPackageDetail;
import com.fedex.rate.stub.RatedShipmentDetail;
import com.fedex.rate.stub.ShipmentRateDetail;
import com.fedex.rate.stub.Surcharge;
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.*
import com.cimbidia.scm.admin.Company
//import org.hibernate.criterion.Restrictions as R
//import org.hibernate.criterion.Criterion



import org.joda.time.DateTime

class RoutingGuideService {
	boolean transactional = true
	def sessionFactory;
	
	private static int LOCATION_WEIGHTAGE = 1000000;
	private static int POSTAL_CODE_WEIGHTAGE = 100000;	
	private static int CITY_WEIGHTAGE = 10000;
	private static int COUNTY_WEIGHTAGE = 1000;
	private static int STATE_WEIGHTAGE = 100;
	private static int COUNTRY_WEIGHTAGE = 10;
	
	public List<RoutingGuide> getRoutingGuideList(RoutingGuide rg){
		return RoutingGuide.withCriteria {
			 and {
				 eq("origin", rg.origin)
				 eq("destimportination", rg.destination)
				 eq("mot",rg.mot)
				 eq("companyId",rg.companyId)
			 }
		}
	}

	public HashMap<String,Integer> getHashZone()
	{
		HashMap<String,Integer> hm = new HashMap<String,Integer>()
		hm.put("AL", 5);
		hm.put("AR", 8);
		hm.put("AZ", 11);
		hm.put("CA", 13);
		hm.put("CO", 10);
		hm.put("CT", 1);
		hm.put("DC", 3);
		hm.put("DE", 3);
		hm.put("FL", 6);
		hm.put("GA", 5);
		hm.put("IA", 7);
		hm.put("ID", 12);
		hm.put("IL", 4);
		hm.put("IN", 4);
		hm.put("KS", 7);
		hm.put("KY", 4);
		hm.put("LA", 8);
		hm.put("MA", 1);
		hm.put("MD", 3);
		hm.put("ME", 1);
		hm.put("MI", 4);
		hm.put("MN", 7);
		hm.put("MO", 7);
		hm.put("MS", 5);
		hm.put("MT", 9);
		hm.put("NC", 5);
		hm.put("ND", 9);
		hm.put("NE", 7);
		hm.put("NJ", 1);
		hm.put("NM", 11);
		hm.put("NV", 10);
		hm.put("NY", 2);
		hm.put("OH", 4);
		hm.put("OK", 8);
		hm.put("OR", 12);
		hm.put("PA", 2);
		hm.put("RI", 1);
		hm.put("SC", 5);
		hm.put("SD", 9);
		hm.put("TN", 5);
		hm.put("TX", 8);
		hm.put("UT", 10);
		hm.put("VA", 3);
		hm.put("VT", 1);
		hm.put("WA", 12);
		hm.put("WI", 4);
		hm.put("WV", 3);
		hm.put("WY", 9);
		hm.put("AB", 14);
		hm.put("BC", 14);
		hm.put("MB", 14);
		hm.put("NB", 15);
		hm.put("NF", 15);
		hm.put("NS", 15);
		hm.put("ON", 15);
		hm.put("PE", 15);
		hm.put("PQ", 15);
		hm.put("SK", 14);
		return hm
	}
	
	public  Integer getZone(String state)
	{
		HashMap<String , Integer>hm = getHashZone()
		return hm.get(state);
	}
	
	public saveRoutingGuide(RoutingGuide routingGuideInstance)
	{
/*		Address rgFromAddr = routingGuideInstance.fromAddress
        
        rgFromAddr.createSearchString()
        println  "rgFromAddr.searchString = " + rgFromAddr.searchString
        
        
       	Address addressFromFound = Address.findBySearchString(rgFromAddr.searchString)
        if(addressFromFound)
        {
        	 println "Existing address Matched to FROMADDRESS =" + addressFromFound.id
        	 routingGuideInstance.fromAddress = addressFromFound
        }
        else
        {	
        	rgFromAddr.save(flush: true)
        	println "ADDRESS NOT FOUND. CREATED NEW =" + rgFromAddr.id
        }
        
        
        Address rgToAddr = routingGuideInstance.toAddress
        rgToAddr.createSearchString()
		println  "rgToAddr.searchString= " + rgToAddr.searchString
        
        Address addressToFound = Address.findBySearchString(rgToAddr.searchString)
        if(addressToFound)
        {
        	 println "Existing address Matched to TOADDRESS =" + addressToFound.id
        	 routingGuideInstance.toAddress = addressToFound
        }
        else
        {	
        	rgToAddr.save(flush: true)
        	println "ADDRESS NOT FOUND. CREATED NEW = " + rgToAddr.id
        }
         */
        calculateWeightage(routingGuideInstance)
        routingGuideInstance.save(flush: true)
        
	}
	
	private calculateWeightage(RoutingGuide routingGuideInstance)
	{
		Integer weightage = 0;
		if(	routingGuideInstance.origin)
			weightage = weightage + LOCATION_WEIGHTAGE
		if(routingGuideInstance.fromCity)
			weightage = weightage + CITY_WEIGHTAGE
		if(routingGuideInstance.fromCounty)
			weightage = weightage + COUNTY_WEIGHTAGE
		if(routingGuideInstance.fromStateOrProvince)
			weightage = weightage + STATE_WEIGHTAGE
		if(routingGuideInstance.fromPostalCode)
			weightage = weightage + POSTAL_CODE_WEIGHTAGE
		if(routingGuideInstance.fromCountry)
			weightage = weightage + COUNTRY_WEIGHTAGE
			
		if(routingGuideInstance.destination)
			weightage = weightage + LOCATION_WEIGHTAGE
		if(routingGuideInstance.toCity)
			weightage = weightage + CITY_WEIGHTAGE
		if(routingGuideInstance.toCounty)
			weightage = weightage + COUNTY_WEIGHTAGE
		if(routingGuideInstance.toStateOrProvince)
			weightage = weightage + STATE_WEIGHTAGE
		if(routingGuideInstance.toPostalCode)
			weightage = weightage + POSTAL_CODE_WEIGHTAGE
		if(routingGuideInstance.toCountry)
			weightage = weightage + COUNTRY_WEIGHTAGE
		//println "weightage=" + weightage
		routingGuideInstance.weightage = weightage
	}
		
	public List<RoutingGuide> getRGList(RoutingGuideSearchCriteria routingGuideSearchInstance, Integer max)
	{
		def company = routingGuideSearchInstance.company
		def equipment = routingGuideSearchInstance.equipment
		def mot = routingGuideSearchInstance.mot
		//println "mot=" + mot
		def tempCtrl = routingGuideSearchInstance.tempCtrl
		def serviceLevel = routingGuideSearchInstance.serviceLevel
		def billingMethod = routingGuideSearchInstance.billingMethod
		def maxRes = max?:20
		def orderBy = routingGuideSearchInstance.orderBy?:"TC"
		
		def now = new Date()
		def effectiveDate = routingGuideSearchInstance.routingDate?:now
		
		Location origin = (routingGuideSearchInstance?.origin?.id)? Location.findById(routingGuideSearchInstance.origin.id) : null
		Location destination = (routingGuideSearchInstance?.destination?.id)? Location.findById(routingGuideSearchInstance.destination.id) : null
		
			Address fromAddress = (origin?.address?.id) ? Address.findById(origin.address.id) : null
//		fromAddress.createSearchString()
				//println "fromaddre="+ fromAddress
			Address toAddress = (destination?.address?.id) ? Address.findById(destination.address.id) : null
		//println "toaddre="+ toAddress
		
		//LinkedHashMap carrierMap = new LinkedHashMap();
			def criteria = RoutingGuide.createCriteria();
			List rgList = criteria.listDistinct() {
			//List rgList = RoutingGuide.withCriteria(){
			 and {
					ge("effectiveEndDate",effectiveDate)
					le("effectiveStartDate",effectiveDate)
					if(company && company.type.id==8){ eq("company", company)}

					if(billingMethod) {eq("billingMethod",billingMethod)}
				//	println "origin "+origin
					if(origin) 
					{
						or 
						{
							or 	
							{ 
								isNull("origin") 
								eq("origin", origin)
							}
							and 
							{	
								if(fromAddress.city)
								{
									or	
									{
										isNull("fromCity")
										ilike("fromCity",fromAddress.city)
									}
								}
								if(fromAddress.stateOrProvince)
								{
									or	
									{
										isNull("fromStateOrProvince")
										eq("fromStateOrProvince",fromAddress.stateOrProvince)
									}
								}
								if(fromAddress.county)
								{
									or	
									{
										isNull("fromCounty")
										ilike("fromCounty", fromAddress.county)
									}
								} 
								if(fromAddress.country)
								{
									or	
									{
										isNull("fromCountry")
										eq("fromCountry",fromAddress.country)
									}
								}
							}  //end and
						} //end and
					} //end origin
				//	println "Destination "+destination
					if(destination) 
					{
						or 
						{
							or 	
							{ 
								isNull("destination") 
								eq("destination", destination)
							}
							and 
							{	
								if(toAddress.city)
								{
									or	
									{
										isNull("toCity")
										ilike("toCity",toAddress.city)
									}
								}
								if(toAddress.stateOrProvince)
								{
									or	
									{
										isNull("toStateOrProvince")
										eq("toStateOrProvince",toAddress.stateOrProvince)
									}
								}
								if(toAddress.county)
								{
									or	
									{
										isNull("toCounty")
										ilike("toCounty", toAddress.county)
									}
								} 
								if(toAddress.country)
								{
									or	
									{
										isNull("toCountry")
										eq("toCountry",toAddress.country)
									}
								} 
							}  //end and
						} //end and
					} //end destination
					
					routingGuideCarrierList {  
												and
												{
													println"mot "+mot
													if(mot) 
													{
														or
														{
															isNull("mot")
															eq("mot",mot)
														}
													}
													if(equipment) 
													{
														or
														{
															isNull("equipment")
															eq("equipment",equipment)
														}
													}
													if(tempCtrl) 
													{
														or
														{
															isNull("tempCtrl")
															eq("tempCtrl",tempCtrl)
														}
													}
													if(serviceLevel)
													{
														or
														{
															isNull("serviceLevel")
															eq("serviceLevel",serviceLevel)
														}
													}
												}
												order("carrierPriority","asc")
												order("frequency","asc")
												order("commitmentValue","desc")
											 }
					
			} //end and
			// resultTransformer Criteria.DISTINCT_ROOT_ENTITY
				maxResults(maxRes)
				order("weightage","asc")				
			} //end withcriteria
		return rgList
		
	}
	
	public List<FedexRate> getFedexMatchingRoutesList(FedexRoutingGuideSearchCriteria frgsInstance, Integer max)
	{
		
		Location origin = (frgsInstance?.origin?.id)? Location.findById(frgsInstance.origin.id) : null
		Location destination = (frgsInstance?.destination?.id)? Location.findById(frgsInstance.destination.id) : null
		
		Address fromAddress = (origin?.address?.id) ? Address.findById(origin.address.id) : null

		Address toAddress = (destination?.address?.id) ? Address.findById(destination.address.id) : null
	
		List<FedexRate> frl = new RateWebServiceClient().getRate(fromAddress, toAddress,  frgsInstance?.weight, frgsInstance?.dimensions ,frgsInstance?.groupPackageCount, frgsInstance?.packageCount, frgsInstance?.packagingType, frgsInstance?.serviceType, frgsInstance?.dropType, frgsInstance?.dateRequest)
		return frl
	}
		
	public ArrayList<RoutingRatingLookupResult> getMatchingRoutesList(RoutingGuideSearchCriteria routingGuideSearchInstance, Integer max)
	{
		
		Location origin = (routingGuideSearchInstance?.origin?.id)? Location.findById(routingGuideSearchInstance.origin.id) : null
		Location destination = (routingGuideSearchInstance?.destination?.id)? Location.findById(routingGuideSearchInstance.destination.id) : null
		
		Address fromAddress = (origin?.address?.id) ? Address.findById(origin.address.id) : null

		Address toAddress = (destination?.address?.id) ? Address.findById(destination.address.id) : null
		//try calling it here
		RateReply reply = new RateWebServiceClient().getRate(fromAddress, toAddress )
		ArrayList<RoutingRatingLookupResult> routingRatingResultList = new ArrayList<RoutingRatingLookupResult>();
		
		def mot = routingGuideSearchInstance.mot
		
		
			List rgList = getRGList(routingGuideSearchInstance, max)
			//println "1. Routing Guide list from query size checks= " + rgList.size()
			
			if(rgList !=null && rgList.size() > 0)
			{
				for(int i=0;i<rgList.size();i++)
				{
					RoutingGuide routingGuide = (RoutingGuide)(rgList.get(i))
				//	println "Processing routing guide num - "+ i
					if(routingGuide.routingGuideCarrierList != null && routingGuide.routingGuideCarrierList.size() > 0)
					{
						List rgCarrierList = routingGuide.routingGuideCarrierList
					//	println "Number of carriers in routing guide num "+ i + " = " + rgCarrierList.size()
	
						for(int j=0; j < rgCarrierList.size() ;j++)
						{
							RoutingGuideCarrier rgCarrier = (RoutingGuideCarrier)(rgCarrierList.get(j))
						//	println "Going to get rating lanes and rates for carrier =" + rgCarrier?.carrier?.companyName
							
							
							List routingRatingLaneCarrierList
							if(mot?.code == 'LTL'){
								routingRatingLaneCarrierList = getLtlCarrierRates(rgCarrier, routingGuideSearchInstance, max)
							}
							else
							{
								routingRatingLaneCarrierList = getCarrierRates(rgCarrier, routingGuideSearchInstance, max)
								
							}
							
						//	println "routingRatingLaneCarrierList : "+routingRatingLaneCarrierList
							for (routingLaneCarrier in routingRatingLaneCarrierList)
							{
							//	println "Adding RoutingRatingLookupResult to final list" + rgCarrier?.carrier?.id
								RoutingRatingLookupResult routingRatingLookupResult = new RoutingRatingLookupResult()
								routingRatingLookupResult.routingGuideCarrier = rgCarrier
								routingRatingLookupResult.ratingLaneCarrier = routingLaneCarrier
								routingRatingResultList.add(routingRatingLookupResult);
							}
						/*	if( routingRatingLaneCarrierList && routingRatingLaneCarrierList.size() > 0)
							{ 	
								List existingRGCarrList = (List)(carrierMap.get(routingGuide.id))
								if(existingRGCarrList)
								{
									existingRGCarrList.addAll(routingRatingLaneCarrierList)	
								}
								else
								{
									carrierMap.put(routingGuide.id, routingRatingLaneCarrierList)
								} 
							} */
						}
					}
				}
			
			
		//	println "size of  LIST before sorting routingRatingResultList = "+ routingRatingResultList?.size()
			if(routingGuideSearchInstance?.orderBy?.equals("TC"))
			{
				Collections.sort(routingRatingResultList, RoutingRatingLookupResult.TotalCostComparator)
			}
			else
			{
				Collections.sort(routingRatingResultList);
			}
			
			//println "size of FINAL LIST routingRatingResultList = "+ routingRatingResultList?.size()
			return routingRatingResultList;
		}
	}
	
	List getLtlCarrierRates(RoutingGuideCarrier rgCarrier, RoutingGuideSearchCriteria routingGuideSearchInstance, Integer max)
	{
		List ratingCarrierList = new ArrayList();
		def company = routingGuideSearchInstance.company
		def mot = rgCarrier?.mot?:(routingGuideSearchInstance?.mot)
		def equipment = rgCarrier?.equipment?:(routingGuideSearchInstance?.equipment)
		def tempCtrl = rgCarrier?.tempCtrl?:(routingGuideSearchInstance?.tempCtrl)
		def serviceLevel = rgCarrier?.serviceLevel?:(routingGuideSearchInstance?.serviceLevel)
		def carrier = rgCarrier?.carrier
		
		/*println "carrier="+ carrier?.id
		println "mot="+mot?.id
		println  "equipment="+equipment?.name
		println "tempCtrl="+tempCtrl?.name
		println "servicelevel="+serviceLevel?.name*/
		Location origin = (routingGuideSearchInstance?.origin?.id)? Location.findById(routingGuideSearchInstance.origin.id) : null
		Location destination = (routingGuideSearchInstance?.destination?.id)? Location.findById(routingGuideSearchInstance.destination.id) : null
		if(origin && destination){
			Address fromAddress = (origin?.address?.id) ? Address.findById(origin.address.id) : null
			//fromAddress.createSearchString()
			
			Address toAddress = (destination?.address?.id) ? Address.findById(destination.address.id) : null
			
			def now = new Date()
			
			def criteria = RatingLane.createCriteria()
			List ratingLaneList = criteria.listDistinct	{	
				//	List ratingLaneList = RatingLane.withCriteria {
					and {
							ge("effectiveEndDate",now)
							le("effectiveStartDate",now)
							if(company && company.type.id==8){ eq("company", company)}
						//	println "Rating Lane Origin "+origin
							if(origin) 
							{
								or 
								{
									or 	
									{ 
										isNull("origin") 
										eq("origin", origin)
									}
									and 
									{	
										if(fromAddress.city)
										{
											or	
											{
												isNull("fromCity")
												ilike("fromCity",fromAddress.city)
											}
										}
										if(fromAddress.stateOrProvince)
										{
											or	
											{
												isNull("fromStateOrProvince")
												eq("fromStateOrProvince",fromAddress.stateOrProvince)
											}
										}
										if(fromAddress.county)
										{
											or	
											{
												isNull("fromCounty")
												ilike("fromCounty", fromAddress.county)
											}
										} 
										if(fromAddress.country)
										{
											or	
											{
												isNull("fromCountry")
												eq("fromCountry",fromAddress.country)
											}
										}
									}  //end and
								} //end and
							} //end origin
							
							if(destination) 
							{
								or 
								{
									or 	
									{ 
										isNull("destination") 
										eq("destination", destination)
									}
									and 
									{	
										if(toAddress.city)
										{
											or	
											{
												isNull("toCity")
												ilike("toCity",toAddress.city)
											}
										}
										if(toAddress.stateOrProvince)
										{
											or	
											{
												isNull("toStateOrProvince")
												eq("toStateOrProvince",toAddress.stateOrProvince)
											}
										}
										if(toAddress.county)
										{
											or	
											{
												isNull("toCounty")
												ilike("toCounty", toAddress.county)
											}
										} 
										if(toAddress.country)
										{
											or	
											{
												isNull("toCountry")
												eq("toCountry",toAddress.country)
											}
										} 
									}  //end and
								} //end and
							} //end destination
							
							/*ratingLaneCarrierList {  
														and {	
																println "MOT "+mot
																if(mot) 
																{
																	or 
																	{
																		isNull("mot") 
																		eq("mot",mot) 
																	}
																}
																if(equipment) 
																{
																	or 
																	{
																		isNull("equipment") 
																		eq("equipment",equipment) 
																	}
																}
																if(serviceLevel) 
																{
																	or 
																	{
																		isNull("serviceLevel") 
																		eq("serviceLevel",serviceLevel) 
																	}
																}
																if(tempCtrl) 
																{
																	or 
																	{
																		isNull("tempCtrl") 
																		eq("tempCtrl",tempCtrl) 
																	}
																}
																
																if(carrier) 
																{
																		eq("carrier",carrier)
																}
																
															}
													 }*/
					} //end and
					order("weightage","desc")				
				} //end withcriteria
			//println "ratingLaneList.size() "+ratingLaneList.size()
			
			if(ratingLaneList.size() > 0)
			{
				//println "NUmber of Rating Lanes found for this carrier " + carrier.companyName + " = "+ratingLaneList.size()
				for(int k=0;k<ratingLaneList.size();k++)
				{
					//RatingLane ratingLane = RatingLane.findById( ratingLaneList.get(k).id )
					RatingLane ratingLane = ratingLaneList.get(k)
					
					if(ratingLane.ratingLaneCarrierList != null && ratingLaneList.size() > 0)
					{
						List rlCarrierList = ratingLane.ratingLaneCarrierList
						//println "Number of rating lane with this carrier found are "+ rlCarrierList.size()
						for(int j=0; j< rlCarrierList.size() ;j++)
						{
							//println "Processing carrier num "+j
							RatingLaneCarrier rlC = (RatingLaneCarrier)(rlCarrierList.get(j))
							if(rlC && rlC.mot?.id == '12')
							{
							//	println "*****rlCarrier.carrier.id="+ rlC.carrier.id
							//	println "*****carrier.id="+carrier?.id
								def carrierId = rlC?.carrier?.id
								def rate = rlC?.rate
								def rateType = rlC?.rateType
							//	println "Carrier found for this rating lane is ="+ rlC?.carrier.companyName + ",rate="+ rate + "ratetype="+rateType
							
								
								calculateTotalCostForCarrier(rlC, routingGuideSearchInstance)
								//println "rlCarrier.cost="+rlC.totalCost
								ratingCarrierList.add(rlC)
							}
						}
					}
				}
			}
		}
	//	println "Rating lane carrier list being returned to routing guide is = " + ratingCarrierList.size()
		return ratingCarrierList;
	}
	
	List getCarrierRates (RoutingGuideCarrier rgCarrier, RoutingGuideSearchCriteria routingGuideSearchInstance, Integer max)
	{
		List routingRatingcarrierList = new ArrayList();
		
		def company = routingGuideSearchInstance.company
		def mot = rgCarrier?.mot?:(routingGuideSearchInstance?.mot)
		def equipment = rgCarrier?.equipment?:(routingGuideSearchInstance?.equipment)
		def tempCtrl = rgCarrier?.tempCtrl?:(routingGuideSearchInstance?.tempCtrl)
		def serviceLevel = rgCarrier?.serviceLevel?:(routingGuideSearchInstance?.serviceLevel)
		def carrier = rgCarrier?.carrier
		
		/*println "carrier="+ carrier?.id
		println "mot="+mot?.code
		println  "equipment="+equipment?.name
		println "tempCtrl="+tempCtrl?.name
		println "servicelevel="+serviceLevel?.name*/
		Location origin = (routingGuideSearchInstance?.origin?.id)? Location.findById(routingGuideSearchInstance.origin.id) : null
		Location destination = (routingGuideSearchInstance?.destination?.id)? Location.findById(routingGuideSearchInstance.destination.id) : null
		
		Address fromAddress = (origin?.address?.id) ? Address.findById(origin.address.id) : null
		//fromAddress.createSearchString()
		
		Address toAddress = (destination?.address?.id) ? Address.findById(destination.address.id) : null
		
		def now = new Date()
		
		def criteria = RatingLane.createCriteria()
		List ratingLaneList
		if(mot.code != 'Less than TruckLoad'){
			//println " Mot "+mot.code
			ratingLaneList = criteria.listDistinct	{	
			//	List ratingLaneList = RatingLane.withCriteria {
				and {
						ge("effectiveEndDate",now)
						le("effectiveStartDate",now)
						if(company && company.type.id==8){ eq("company", company)}
						
						if(origin) 
						{
							or 
							{
								or 	
								{ 
									isNull("origin") 
									eq("origin", origin)
								}
								and 
								{	
									if(fromAddress.city)
									{
										or	
										{
											isNull("fromCity")
											ilike("fromCity",fromAddress.city)
										}
									}
									if(fromAddress.stateOrProvince)
									{
										or	
										{
											isNull("fromStateOrProvince")
											eq("fromStateOrProvince",fromAddress.stateOrProvince)
										}
									}
									if(fromAddress.county)
									{
										or	
										{
											isNull("fromCounty")
											ilike("fromCounty", fromAddress.county)
										}
									} 
									if(fromAddress.country)
									{
										or	
										{
											isNull("fromCountry")
											eq("fromCountry",fromAddress.country)
										}
									}
								}  //end and
							} //end and
						} //end origin
						
						if(destination) 
						{
							or 
							{
								or 	
								{ 
									isNull("destination") 
									eq("destination", destination)
								}
								and 
								{	
									if(toAddress.city)
									{
										or	
										{
											isNull("toCity")
											ilike("toCity",toAddress.city)
										}
									}
									if(toAddress.stateOrProvince)
									{
										or	
										{
											isNull("toStateOrProvince")
											eq("toStateOrProvince",toAddress.stateOrProvince)
										}
									}
									if(toAddress.county)
									{
										or	
										{
											isNull("toCounty")
											ilike("toCounty", toAddress.county)
										}
									} 
									if(toAddress.country)
									{
										or	
										{
											isNull("toCountry")
											eq("toCountry",toAddress.country)
										}
									} 
								}  //end and
							} //end and
						} //end destination
						
						ratingLaneCarrierList {  
													and {	
															if(mot) 
															{
																or 
																{
																	isNull("mot") 
																	eq("mot",mot) 
																}
															}
															if(equipment) 
															{
																or 
																{
																	isNull("equipment") 
																	eq("equipment",equipment) 
																}
															}
															if(serviceLevel) 
															{
																or 
																{
																	isNull("serviceLevel") 
																	eq("serviceLevel",serviceLevel) 
																}
															}
															if(tempCtrl) 
															{
																or 
																{
																	isNull("tempCtrl") 
																	eq("tempCtrl",tempCtrl) 
																}
															}
															
															if(carrier) 
															{
																	eq("carrier",carrier)
															}
															
														}
												 }
				} //end and
				order("weightage","desc")				
			} //end withcriteria
		}
		
		/*def yahoo = RatingLane.findAll()
		for ( int ab = 0; ab < yahoo.size(); ab++ )
		{
			def yahoo2 = yahoo.ratingLaneCarrierList
			println "yahoo2 size = " + yahoo2.size()
		}*/
		
		if(ratingLaneList.size() > 0)
		{
			//println "NUmber of Rating Lanes found for this carrier " + carrier.companyName + " = "+ratingLaneList.size()
			for(int k=0;k<ratingLaneList.size();k++)
			{
				//RatingLane ratingLane = RatingLane.findById( ratingLaneList.get(k).id )
				RatingLane ratingLane = ratingLaneList.get(k)
				
				if(ratingLane.ratingLaneCarrierList != null && ratingLaneList.size() > 0)
				{
					List rlCarrierList = ratingLane.ratingLaneCarrierList
					//println "Number of rating lane with this carrier found are "+ rlCarrierList.size()
					for(int j=0; j< rlCarrierList.size() ;j++)
					{
						//println "Processing carrier num "+j 
						RatingLaneCarrier rlCarrier = (RatingLaneCarrier)(rlCarrierList.get(j))
						if(rlCarrier && rlCarrier.carrier?.id == carrier?.id)
						{
						//	println "*****rlCarrier.carrier.id="+ rlCarrier.carrier.id
						//	println "*****carrier.id="+carrier?.id
							def carrierId = rlCarrier?.carrier?.id
							def rate = rlCarrier?.rate
							def rateType = rlCarrier?.rateType
						//	println "Carrier found for this rating lane is ="+ rlC?.carrier.companyName + ",rate="+ rate + "ratetype="+rateType						
							
							
							calculateTotalCostForCarrier(rlCarrier, routingGuideSearchInstance)
						//	println "rlCarrier.cost="+rlC.totalCost
							routingRatingcarrierList.add(rlCarrier)
						}
					}  
				} 
			}
		}
		//println "Rating lane carrier list being returned to routing guide is = " + routingRatingcarrierList.size()
		return routingRatingcarrierList;
	}
	
	
	void calculateTotalCostForCarrier(RatingLaneCarrier rlCarrier, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost
		Float totalCost
		Float rate = rlCarrier.rate
		String rateTypeCode = rlCarrier?.rateType?.code
		String rateUom = rlCarrier?.rateUnit?.code
		//println "mot at cost"+ routingGuideSearchInstance.mot?.id
		if	( routingGuideSearchInstance.mot?.id =='12'){
			cost = calculateLtlRate(  routingGuideSearchInstance)
		}
		else {
			
			cost = calculateSingleRateCost(rateTypeCode, rate, rateUom, routingGuideSearchInstance)
			
		}
		rlCarrier.cost = cost
		totalCost = cost
		Float minRate = rlCarrier?.minRate
	
		rlCarrier.totalCost = totalCost > minRate? totalCost:minRate;
		
	}
	
	Float calculateLtlRate(  RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost;
		
		Location origin = routingGuideSearchInstance.origin 
		Location destination = routingGuideSearchInstance.destination
		String name =  routingGuideSearchInstance?.commodityClass
		Integer srcz = getZone(origin?.address?.stateOrProvince.trim())
		Integer desz = getZone(destination?.address?.stateOrProvince.trim())
	
	//	println "origin "+origin?.latitude + "  desti -"+origin?.longitude+ "- srcz "+srcz+" desz "+desz +" commodityclass.name "+ routingGuideSearchInstance?.commodityClass
		Float rates = getLtlCost(name, srcz, desz)
		
		Double dist = distance(origin?.latitude, origin?.longitude, destination?.longitude, destination?.longitude, "M")
	//	println " unit rates "+rates+" distance "+ dist
		cost = rates*dist/100;
		return cost;
		
	}
	
	private Double distance(Double lat1, Double lon1, Double lat2, Double lon2, String unit) {
			  Double theta = lon1 - lon2;
			  Double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
			  dist = Math.acos(dist);
			  dist = rad2deg(dist);
			  dist = dist * 60 * 1.1515;
			  if (unit == "K") {
			    dist = dist * 1.609344;
			  } else if (unit == "N") {
			    dist = dist * 0.8684;
			    }
			  return (dist);
	}
	
	private Double deg2rad(Double deg) {
			  return (deg * Math.PI / 180.0);
	}
	
	private Double rad2deg(Double rad) {
			  return (rad * 180 / Math.PI);
	}
	
	Float getLtlCost(String name, Integer srcZone, Integer destiZone)
	{
		List<RatingLaneLtlRates> ltlRates =  RatingLaneLtlRates.findAllByLtlClassAndFromZoneAndToZone(name, srcZone,destiZone);
		RatingLaneLtlRates ltl = ltlRates.getAt(0)
		return ltl.rate
	}
	
	Float calculateSingleRateCost(String rateTypeCode, Float rate, String rateUom, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost;
		
		switch (rateTypeCode)
		{
			case "FC":
			cost = calculateFC(rate, rateUom, routingGuideSearchInstance );
			break;
			
			case "RPUD":
			cost = calculateRPUD(rate, rateUom, routingGuideSearchInstance);
			break;
			
			
			case "RPUW":
			cost = calculateRPUW(rate, rateUom, routingGuideSearchInstance);
			break;
			
			case "RPUS":
			cost = calculateRPUS(rate, rateUom, routingGuideSearchInstance);
			break;
			
			default:
			break;
		}
	
	}
	
	Float calculateFC(Float rate , String rateUom, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost
		cost = rate
	//	println "FC RETURNED = " + cost
		return cost
		
	}
	
	Float calculateRPUD(Float arate, String rateUom, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost = 0.0;
		Float rate = 0.0;
		rate  = arate?:0.0;
		Float distance = 0.0;
		distance = (routingGuideSearchInstance?.distance)?:0.0
		String distanceUom = routingGuideSearchInstance?.distanceUom?.code?:Constants.DEFAULT_RATING_DISTANCE_UNIT
	//	println "calculateRPUD == distance="+ distance + "distanceUom=" + distanceUom + "rateUom=" + rateUom + "rate=" + rate
		if( rateUom.equals(distanceUom) )
		{
			cost = rate * distance ;
		}
		else if(rateUom.equals('Km') && distanceUom.equals('Mi'))
		{
			cost = rate * distance * 1.60934
		}
		else if(rateUom.equals('Mi') && distanceUom.equals('Km'))
		{
			cost = rate * distance * 0.621371
		}
	//	println "rpud RETURNED = " + cost
		return cost;
	}		
	
	
	Float calculateRPUW(Float rate, String rateUom, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost = 0;
		Float weight = routingGuideSearchInstance?.weight
		String weightUom = routingGuideSearchInstance?.weightUom?.code?:Constants.DEFAULT_RATING_WEIGHT_UNIT
	//	println "calculateRPUW == weight="+ weight + "weightUom=" + weightUom + "rateUom=" + rateUom + "rate=" + rate
		if( rateUom.equals(weightUom) )
		{
			cost = rate * weight;
		}
		else if(rateUom.equals('CWT') && weightUom.equals('Ton'))
		{
			cost = rate * weight * 22.0462
		}
		else if(rateUom.equals('Ton') && weightUom.equals('CWT'))
		{
			cost = rate * weight * 0.0453
		}
	//	println "RPUW RETURNED = " + cost
		return cost;
	}		
	
	Float calculateRPUS(Float rate, String rateUom, RoutingGuideSearchCriteria routingGuideSearchInstance)
	{
		Float cost = 0;
		
		Integer numOfStops = routingGuideSearchInstance?.numOfStops
	//	println "calculateRPUS numOfStops == " + numOfStops
		if(numOfStops > 2)
		{
			cost = rate * (numOfStops -2)
		}
	//	println "RPUS RETURNED = " + cost
		return cost;
	}		
	
}
