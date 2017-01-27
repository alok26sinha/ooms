/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package util

import com.cimbidia.wm.core.LocationEditor
import com.cimbidia.wm.core.TagEditor
import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.CategoryEditor
import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry
import org.springframework.beans.propertyeditors.CustomDateEditor

// import java.util.Date

import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Tag;

import java.text.SimpleDateFormat

public class CustomPropertyEditorRegistrar implements PropertyEditorRegistrar {
	public void registerCustomEditors(PropertyEditorRegistry registry) {
		registry.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
        registry.registerCustomEditor(Location.class, new LocationEditor())
        registry.registerCustomEditor(Category.class, new CategoryEditor())
        registry.registerCustomEditor(Tag.class, new TagEditor())
	}
}



