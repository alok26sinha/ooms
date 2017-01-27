package com.cimbidia.scm.oms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.cimbidia.wm.core.Location
import com.cimbidia.wm.customerOrder.CustomerOrderItem;
import com.cimbidia.wm.order.OrderItem;
import com.cimbidia.wm.product.Product

import lpsolve.*;

public class CostOptimization {

	public static void main(String[] args) {
		new CostOptimization().execute(null, null);
	}

	public int execute(Map<String, SourcingHelper> sourcingHelpers, InventoryService serv) throws LpSolveException {


		
		HashMap<Product, List> oliMap = new HashMap<Product, List>();
		HashMap<Product, List> invMap = new HashMap<Product, List>();
		Iterator iter = sourcingHelpers.keySet().iterator();
		while(iter.hasNext()){
			String key = (String) iter.next();
			CustomerOrderItem cli = sourcingHelpers.get(key).getCustItem();
			if(!oliMap.containsKey(cli.product)){
				List<CustomerOrderItem> olis = new ArrayList<CustomerOrderItem>();
				olis.add(cli);
				oliMap.put(cli.product, olis)
			}else{
				List<CustomerOrderItem> olis = oliMap.get(cli.product);
				olis.add(cli);
			}


			def itemLocations = ItemLocation.createCriteria().list{

				and  {

					eq("product.id", cli.product.id)
				}
			}
			if(!invMap.containsKey(cli.product)){
				List<Inventory> inventories = new ArrayList<Inventory>();
				for(int i=0; i<itemLocations.size(); i++){
					inventories.add(serv.getTodaysPositionForItemLoc(itemLocations.get(i)));
				}
				invMap.put(cli.product, inventories)
			}
		}
		println("invMap"+invMap);
		println("oliMap"+oliMap);
		// for each product get the oli and inventories and create LP and solve and persist the result.
		LpSolve lp;
		Set keys = oliMap.keySet();
		Iterator ite = keys.iterator();
		while(ite.hasNext()){
			println("inside "+keys);
			int ret = 0;
			Object key = ite.next();
			List<CustomerOrderItem> clis = oliMap.get(key);
			List<Inventory> inventories = invMap.get(key);
			int decisionVariableCount = clis.size()*inventories.size();
			lp = LpSolve.makeLp(0, decisionVariableCount);

			if(lp.getLp() == 0){
				ret = 1; /* couldn't construct a new model... */
				println("LP could not be initialized")
			}
			if(ret == 0) {
				lp.setAddRowmode(true);
				int[] col = new int[inventories.size()];
				double[] row = new double[clis.size()];
				for(int i=0; i<clis.size(); i++){//rows

					for(int j=0; j< inventories.size(); j++){//columns
						col[j] = j+1; /* column */
						row[j++] = getDistance(clis.get(i).destination, inventories.get(j).itemLocation.location); /* cost*/
					}
					println("row"+row)
					lp.addConstraintex(i, row, col, LpSolve.EQ, clis.get(i).quantity);
					println("constraint added "+ret)
				}
			}
			if(ret == 0) {
				lp.setAddRowmode(false);
				println("vertical constraint being added "+ret)
				int[] col = new int[inventories.size()];
				double[] row = new double[clis.size()];


				for(int j=0; j< inventories.size(); j++){//columns
					for(int i=0; i<clis.size(); i++){//rows
						col[j] = j+1; /* column */
						row[i++] = getDistance(clis.get(i).destination, inventories.get(j).itemLocation.location); /* cost*/
					}
					println("vertical constraint being added")
					lp.addConstraintex(j, row, col, LpSolve.LE, inventories.get(j).q);
					println("vertical constraint added")
				}
			}

			if(ret == 0) {
				lp.setAddRowmode(false); /* rowmode should be turned off again when done building the model */

				int[] col = new int[inventories.size()];
				double[] row = new double[clis.size()];



				for(int i=0; i<clis.size(); i++){//rows
					for(int j=0; j< inventories.size(); j++){//columns
						col[j] = j+1; /* column */
						row[j++] = getDistance(clis.get(i).destination, inventories.get(j).itemLocation.location); /* cost*/
					}

				}

				/* set the objective in lp_solve */
				lp.setObjFnex(decisionVariableCount, row, col);
			}



			if(ret == 0) {
				/* set the object direction to maximize */
				lp.setMinim();

				/* generate the model in lp format in file model.lp */
				lp.writeLp("model.lp");

				/* to see important messages on screen while solving */
				lp.setVerbose(LpSolve.IMPORTANT);

				/* Now let lp_solve calculate a solution */
				ret = lp.solve();
				if(ret == LpSolve.OPTIMAL)
					ret = 0;
				else
					ret = 5;
			}

			if(ret == 0) {
				/* a solution is calculated, now lets get some results */

				/* objective value */
				println("Objective value: " + lp.getObjective());
				
				for(int i=0; i<clis.size(); i++){//rows
					double[] row = new double[clis.size()];
					/* variable values row wise*/
					lp.getVariables(row);
					for(int j=0; j< inventories.size(); j++){//columns
							println(lp.getColName(j + 1) + ": " + row[j]);
					}

				}
			

				/* we are done now */
			}

			/* clean up such that all used memory by lp_solve is freeed */
			if(lp.getLp() != 0)
				lp.deleteLp();

			return(ret);
		}


	}
	double getDistance(Location origin, Location destination){
		return 6137*sqrt((origin.latitude-destination.latitude)^2+(cos^2(origin.latitude/2+destination.latitude/2)*(origin.longitude-destination.longitude)^2))
	}

}
