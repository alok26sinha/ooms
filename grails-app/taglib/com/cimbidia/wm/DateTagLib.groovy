/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm

// import java.text.SimpleDateFormat;
// import java.util.Date;

import com.ocpsoft.pretty.time.PrettyTime;

class DateTagLib {
   	
	def relativeDate = { attrs, body ->
		
		Date now = new Date();
		Date date = attrs.date;
		
		if (date) { 
			def days = date - now;
			
			if (days == 0) { 
				out << "today";
			}
			else if (days > 0) { 
				out << "in ${days} days";
			} 
			else if (days < 0) { 
				out << "${-days} days ago"
			}
		}
	}
	
	def prettyDateFormat = { attrs, body ->
		def date = (attrs.date)?:new Date();
		def p = new PrettyTime();
		
		def now = new Date() 
		if (now - date < 1) { 
			out << "${warehouse.message(code:'default.today.label')}"
		}
		else { 
			out << 	p.format(date);
		}
	}
		
}
