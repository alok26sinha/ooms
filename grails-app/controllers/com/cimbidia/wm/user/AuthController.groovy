/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.user

import grails.util.GrailsUtil

import org.apache.commons.mail.EmailException
import com.cimbidia.wm.core.RoleType
import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Role;
import com.cimbidia.wm.core.User;

class AuthController {

	def mailService;
	
    static allowedMethods = [login: "GET", doLogin: "POST", logout: "GET"];
    
    /**
     * Show index page - just a redirect to the list page.
     */
	def index = {    	
		log.info "auth controller index";
		redirect(action: "login", params:params)
	}

	/**
	 * Checks whether there is an authenticated user in the session.
	 */
	def authorized = { 
		if (session.user == null) { 
        	flash.message = "${warehouse.message(code: 'auth.notAuthorized.message')}"
    		redirect(controller: 'auth', action: 'login');
    	}		
	}
                             
    /**
     * Allows user to log into the system.
     */
    def login = {
        if (session.user) {
            flash.message = "You have already logged in."
            redirect(controller: "dashboard", action: "dashboard")
        }

	}
	
	
    /** 
     * Performs the authentication logic.
     */
	def handleLogin = {
		
		def userInstance = User.findByUsernameOrEmail(params.username, params.username)
		session?.company=userInstance?.company
		session?.companyId=userInstance?.company?.id
		//def companyInstance = Company.findById(userInstance.company)
		session?.companyInstance	= userInstance?.company
		session?.companyTypeId = userInstance?.company.type.id
		TimeZone userTimezone = TimeZone.getTimeZone("America/New_York")
		String browserTimezone = request.getParameter("browserTimezone")
		if (browserTimezone != null) {
			userTimezone = TimeZone.getTimeZone(browserTimezone)
		}
		session.timezone = userTimezone;
		
		if (userInstance) {

            // Check if user is active -- redirect back to login page
			if (!userInstance?.active) {
				flash.message = "${warehouse.message(code: 'auth.accountRequestUnderReview.message')}"	
				redirect(controller: 'auth', action: 'login');
				return;
			}

            // Passwords match
			// Compare encoded/hashed password as well as in cleartext (support existing cleartext passwords)			
			if (userInstance.password == params.password.encodeAsPassword() || userInstance.password == params.password) {			

				// Need to fetch the manager and roles in order to avoid 
				// Hibernate error ("could not initialize proxy - no Session")				
				// def warehouse = userInstance?.warehouse?.name;
				// def managerUsername = userInstance?.manager?.username;
				// def roles = userInstance?.roles;
	
				session.user = userInstance;
				session.userName = userInstance?.username
				log.info "WAHHHDDDIOSODJOSDJOSJDOJSD232323232"
				// For now, we'll just execute this code in dev environments
				//if (GrailsUtil.environment == "development") { 
				if (true) { 
					// PIMS-782 Force the user to select a warehouse each time
					if (userInstance?.warehouse) { 
						session.warehouse = userInstance.warehouse
					}
					
					if (session?.targetUri) {
						redirect(uri: session.targetUri);
						//session.removeAttribute("targetUri")
						return;
					}
				}
				log.info "WAHHHDDDIOSODJOSDJOSJDOJSD"
			//	println" User Name "+userInstance.username +" pass "+userInstance.password +" pass "+ params.password.encodeAsPassword()
				if(userInstance.username.equals("manager") ){
					redirect(controller:'dashboard',action:'dashboard')
				}else if(userInstance?.company.type.id==10){
					redirect(controller:'shipment',action:'carrierShiplist')
				}else{
					redirect(controller:'dashboard',action:'dashboard2')
				}
			}
			else {
                // Invalid password
				flash.message = "${warehouse.message(code: 'auth.incorrectPassword.label', args: [params.username])}"		
				userInstance = new User(username:params['username'])				
				userInstance.errors.rejectValue("version", "default.authentication.failure",
					[warehouse.message(code: 'user.label', default: 'User')] as Object[], "${warehouse.message(code: 'auth.unableToAuthenticateUser.message')}");
				render(view: "login", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'auth.userNotFound.message', args: [params.username])}"	
			redirect(action:'login')
		}
	}
	
	
	/**
	 * Allows user to log out of the system
	 */
	def logout = { 
		session.targetUri = null    	
		session.user = null;
        session.userName = null;
		session.companyId = null;
		session.locale = null;
		session.warehouse = null;
		flash.message = "${warehouse.message(code: 'auth.logoutSuccess.message')}"	
		redirect(action:'login')
	}    

	
	/**
	 * Allow user to register a new account
	 */
	def signup = { }
	
	/**
	 * Handle account registration.
	 */
	def handleSignup = { 		
		
		def userInstance = new User();
		if ("POST".equalsIgnoreCase(request.getMethod())) { 			
			userInstance.properties = params
			userInstance.password = params.password.encodeAsPassword();
			userInstance.passwordConfirm = params.passwordConfirm.encodeAsPassword();			
			userInstance.active = Boolean.FALSE;
			
			// Create account 
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {				
				session.user = userInstance;				
				
				try {
					def recipients = [ ];
					def roleAdmin = Role.findByRoleType(RoleType.ROLE_ADMIN)
					if (roleAdmin) {
						def criteria = User.createCriteria()
						recipients = criteria.list {
							roles {
								eq("id", roleAdmin.id)
							}
						}
						
						// Send email to administrators
						if (recipients) {							
							def to = recipients?.collect { it.email }?.unique()							
							def subject = "${warehouse.message(code: 'email.userAccountCreated.message', args: [userInstance.username])}"							
							def body = g.render(template:"/email/userAccountCreated", model:[userInstance:userInstance])
							mailService.sendHtmlMail(subject, body.toString(), to);							
						}
					}
				
					// Send confirmation email to user 
					if (userInstance.email) { 
						def subject = "${warehouse.message(code: 'email.userAccountConfirmed.message', args: [userInstance.email])}"
						def body = g.render(template:"/email/userAccountConfirmed", model:[userInstance:userInstance])
						mailService.sendHtmlMail(subject, body.toString(), userInstance.email);
					}
				} catch (EmailException e) { 
					log.error("Unable to send emails: " + e.message)
				}
				
			}			
			else { 
				// Reset the password to what the user entered
				userInstance.password = params.password;
				userInstance.passwordConfirm = params.passwordConfirm;
				//flash.message = "${warehouse.message(code: 'default.error.message', args: [warehouse.message(code: 'user.label', default: 'User'), userInstance.id])}"
				render(view: "signup", model: [userInstance : userInstance]);
				return;
			}
		}		
		
		// FIXME For some reason, flash.message does not get displayed on redirect
		//flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'user.label'), userInstance.email])}"
		redirect(action:"login")

	}

}
