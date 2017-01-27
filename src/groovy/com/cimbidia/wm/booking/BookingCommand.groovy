/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 

package com.cimbidia.wm.booking

import  grails.validation.Validateable
import com.cimbidia.scm.constants.Constants

@Validateable
class BookingCommand implements Serializable{
	
	BookingStatus bookingStatus
	
	String bookingConfirmationNumber 
	String vessel
	String voyageNumber 
	Date plannedDepartureDate 
	Date plannedArrivalDate
	Date closingDate 

	String actionPerformed
	static constraints = {
		importFrom Booking
		
			bookingConfirmationNumber (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept"))
            { 
            	println "in Accept of BookingCOmmand"
                if(!cmd.bookingConfirmationNumber) return ("default.blank.message")
            }	})

			vessel (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept") || cmd.bookingStatus > BookingStatus.REQUESTED)
            { 
                if(!cmd.vessel) return ("default.blank.message")
            }	})
            
            voyageNumber (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept") || cmd.bookingStatus > BookingStatus.REQUESTED)
            { 
                if(!cmd.voyageNumber) return ("default.blank.message")
            }	})
            
          
            plannedDepartureDate (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept") || cmd.bookingStatus > BookingStatus.REQUESTED)
            { 
                if(!cmd.plannedDepartureDate) return ("default.blank.message")
            }	})
            
            plannedArrivalDate (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept") || cmd.bookingStatus > BookingStatus.REQUESTED)
            { 
                if(!cmd.plannedArrivalDate) return ("default.blank.message")
            }	})
            
            closingDate (validator:{val, cmd->
            if ((cmd.actionPerformed).equals("accept") || cmd.bookingStatus > BookingStatus.REQUESTED)
            { 
                if(!cmd.closingDate) return ("default.blank.message")
            }	}) 
    }
}
