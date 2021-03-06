/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.importer

import org.codehaus.groovy.grails.commons.ApplicationHolder
import com.cimbidia.wm.product.Category
import org.springframework.validation.Errors

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
// import java.util.Date

class ImporterUtil {

	

	static DateFormat EXCEL_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")

	
	static getProductService() { 
		return ApplicationHolder.getApplication().getMainContext().getBean("productService")
	}
		
	/**
	 *
	 * @param categoryName
	 * @param errors
	 * @return
	 */
	static Category findOrCreateCategory(String categoryName, Errors errors) {
		def category = Category.findByName(categoryName);
		if (!category) {
			//category = new Category(name: importParams.category, parentCategory: parentCategory);
			category = new Category(name: categoryName, parentCategory: getProductService().getRootCategory());
			if (!category.validate()) {
				category.errors.allErrors.each {
					errors.addError(it);
				}
			}
			else { 
				category.save(failOnError: true)
			}
			//log.debug "Created new category " + category.name;
		}
		return category;
	}


	/**
	 * 
	 * @param expirationDate
	 * @param errors
	 * @return
	 */
	static Date parseDate(Object expirationDate, Errors errors) {
		if (expirationDate) {
			//log.info "expiration date: " + expirationDate
			// If we're passed a date, we can just set the expiration
			if (expirationDate instanceof org.joda.time.LocalDate) {
				expirationDate = expirationDate.toDateMidnight().toDate();
			}
			else {
				try {

					expirationDate = EXCEL_DATE_FORMAT.parse(expirationDate);
				} catch (ParseException e) {
					errors.reject("Could not parse date " + expirationDate + " " + e.getMessage() + ".  Expected date format: yyyy-MM-dd");
				}
			}
		}

	}
}
