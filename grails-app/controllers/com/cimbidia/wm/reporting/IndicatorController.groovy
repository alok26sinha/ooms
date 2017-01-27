/**
 * Copyright (c) Cimbidia.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 * */
package com.cimbidia.wm.reporting

import com.cimbidia.wm.core.Constants

import com.cimbidia.wm.product.ProductService
import com.cimbidia.wm.reporting.Indicator;

import com.cimbidia.wm.core.Location;

class IndicatorController {

    def scaffold = Indicator

    // Proof of concept to see if we could evalute a string of code
    // Could be used to create dynamic indicators for the dashboard
    def evaluate = {

        String code = """
            import com.cimbidia.wm.product.Product;
            def products = Product.list();
            return products.size()
        """

        // String code, boolean captureStdout, request
        render consoleService.eval(code, true, request)
    }




}


