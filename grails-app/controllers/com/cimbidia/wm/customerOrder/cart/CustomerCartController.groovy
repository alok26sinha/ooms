/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.customerOrder.cart


import com.cimbidia.wm.order.cart.Cart;
import com.cimbidia.wm.order.cart.CartItem;
import com.cimbidia.wm.product.Product

class CustomerCartController {

	def index = { 
		redirect(action: 'list')
	}
	
	def list = { 	
		def map = [:]	
		if (!session.cart) { 
			session.cart = new Cart();		
		}
		session.cart.items.each {			
			def product = Product.get(it?.product?.id) 
			map.put(product, it.getQuantity());
		}
		
		[ productInstanceMap : map ]
	}
	
	def addToCart = { 
		log.info params
		//def inventoryInstance = Inventory.get(params?.inventory?.id);
		def productInstance = Product.get(params?.product?.id);		;
		//def inventoryItemInstance = InventoryItem.get(params?.inventoryItem?.id);
		
		
		if (params.redirectUrl) {
			//redirect(controller: "inventoryItem", action: "showStockCard", id: productInstance.id)
			redirect(url: params.redirectUrl);
			return;
		}
		
		redirect(controller: "catalog", action: "list", params: params)
		
	}

	def removeFromCart = {
		def productInstance = Product.get(params?.product?.id);
		if (productInstance) {
			if (!session?.cart) {
				session.cart = new Cart();
			}
			session.cart.clearItem(new CartItem(product: productInstance))
			flash.message = "Product removed from cart"
		}
		else {
			flash.message = "Product not found"
			
		}
		redirect(controller: "catalog", action: "list", params: params)
		
	}

	
		
}
