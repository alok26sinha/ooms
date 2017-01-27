/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core

class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [blogInstanceList: Blog.list(params), blogInstanceTotal: Blog.count()]
    }

    def create = {
        def blogInstance = new Blog()
        blogInstance.properties = params
        return [blogInstance: blogInstance]
    }

    def addMessage = {
            def blogs = Blog.withCriteria() {
                followers {
                    inList ("id", session.user.id)
                }
            }
    	    [blogs : blogs]
    }
    
    def save = {
        def blogInstance = new Blog(params)
        if (blogInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), blogInstance.id])}"
            redirect(action: "list", id: blogInstance.id)
        }
        else {
            render(view: "create", model: [blogInstance: blogInstance])
        }
    }

    def show = {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
            redirect(action: "list")
        }
        else {
            [blogInstance: blogInstance]
        }
    }

    def edit = {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [blogInstance: blogInstance]
        }
    }

    def update = {
        def blogInstance = Blog.get(params.id)
        if (blogInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (blogInstance.version > version) {
                    
                    blogInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'blog.label', default: 'Blog')] as Object[], "Another user has updated this Blog while you were editing")
                    render(view: "edit", model: [blogInstance: blogInstance])
                    return
                }
            }
            blogInstance.properties = params
            if (!blogInstance.hasErrors() && blogInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), blogInstance.id])}"
                redirect(action: "list", id: blogInstance.id)
            }
            else {
                render(view: "edit", model: [blogInstance: blogInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def blogInstance = Blog.get(params.id)
        if (blogInstance) {
            try {
                blogInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'blog.label', default: 'Blog'), params.id])}"
            redirect(action: "list")
        }
    }


	def saveComment = { 
		log.info(params)
		
		def blogInstance = Blog.get(params?.blog?.id)
		if (blogInstance) { 
			def commentInstance = Comment.get(params?.id)
			if (commentInstance) { 
				commentInstance.properties = params
				commentInstance.sender = com.cimbidia.wm.auth.AuthService.currentUser.get()
				if (!commentInstance.hasErrors() && commentInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), commentInstance.id])}"
					redirect(action: "addMessage", id: blogInstance.id)
				}
				else {
					redirect(action: "addMessage", id: blogInstance.id)
				}
			}
			else { 
				commentInstance = new Comment(params)
				commentInstance.sender = com.cimbidia.wm.auth.AuthService.currentUser.get()
				blogInstance.addToComments(commentInstance);
				if (!blogInstance.hasErrors() && blogInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), blogInstance.id])}"
					redirect(action: "addMessage", id: blogInstance.id)
				}
				else {
					redirect(action: "addMessage", id: blogInstance.id)
				}
			}
		}	
		else { 
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "addMessage", id: blogInstance.id)
		}
		
	}



}
