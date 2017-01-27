package com.cimbidia.scm.collab

import com.cimbidia.wm.core.User

class Message {
	@Override
	public String toString() {
		return "Message [id=" + id + ", companyId=" + companyId + ", sender="				+ sender + ", date=" + date + ", message=" + message				+ ", object=" + object + ", context=" + context + ", objectId="				+ objectId + ", parentId=" + parentId + ", hasChild="				+ hasChild + ", count=" + count + "]";
	}

	String id
	Integer companyId
    User sender
	
    Date date = new Date()
    String message
	String object //controller
	String context 
	String objectId
	String parentId
	Integer hasChild = 0
	Integer count = 0
	static hasMany = [receivers: User]
	static mapping = {
		table 'messages'
		id generator: 'uuid'
		version false
		sender column : "sender"
		parentId column : "parent_id"
		
		sender lazy: false
		receivers joinTable: [name: 'message_receivers',
                             column: 'receiver',
                             key: 'msg_id']
	}
	
	static constraints  = {
		message (nullable:true)
		object (nullable:true)
		context (nullable:true)
		objectId (nullable:true)
		parentId (nullable:true)
		hasChild (nullable:true)
		sender cascade : "none"
		
	}
}