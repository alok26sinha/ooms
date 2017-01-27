package com.cimbidia.scm.collab



import static org.springframework.http.HttpStatus.*
import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Person
import com.cimbidia.wm.core.User
import grails.transaction.Transactional
import groovy.sql.Sql
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.order.Order
import com.cimbidia.wm.shipment.Shipment

@Transactional(readOnly = false)
class MessageController {
	String to = ""
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Message.list(params), model:[messageInstanceCount: Message.count()]
    }

    def show(Message messageInstance) {
        respond messageInstance
    }

    def create() {
        respond new Message(params)
    }

    @Transactional
    def save(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'create'
            return
        }

        messageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'messageInstance.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*' { respond messageInstance, [status: CREATED] }
        }
    }

    def edit(Message messageInstance) {
        respond messageInstance
    }

    @Transactional
    def update(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'edit'
            return
        }

        messageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*'{ respond messageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Message messageInstance) {

        if (messageInstance == null) {
            notFound()
            return
        }

        messageInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageInstance.label', default: 'Message'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def setReceipient(Integer companyId, String object, String objectId){
		Integer cid = companyId
		Company company = Company.findById(cid)
		
		if(company.type.code.equals("1")){
			
			if(object?.equals("order")){
			
			Order order  = Order.findById(objectId);
			cid = order.seller.id
			}
			else if(object?.equals("shipment")){
				Shipment shp  = Shipment.findById(objectId);
				cid = shp.carrierCompany.id
			}
		}else{
		
			if(company.type.code.equals("2")){
				if(object?.equals("order")){
					
				Order order  = Order.findById(objectId);
				cid = order.company.id
				}
				else if(object?.equals("shipment")){
					Shipment shp  = Shipment.findById(objectId);
					cid = shp.companyId
				}
			}
		}
		
		def users = User.withCriteria{
			eq("active", true)
			eq("company.id", cid)
					
		}
		String to = users[0]?.firstName+" "+users[0]?.lastName
		//session['TO']=users[0]?.firstName+" "+users[0]?.lastName
		//render(template: 'omessages', model: [TO:to])
		return to;
	}
	def retrieveLatestMessages() {
		def messages = Message.listOrderByDate(order: 'desc', max:10)
		[messages:messages.reverse()]
	}
	def dataSource
	def myMessages() {
		
		/*def messages = {
			
			
			def sql = new Sql(sessionFactory.curentSession.connection())
		
		sql.rows("SELECT message FROM messages where sender="+1 +"or id in (select msg_id from message_receivers where receiver="+session?.user?.id +")") {
			Message m = new Message( it.toRowResult() )
			messages << m
			println("************"+m)
		}
		println("************"+messages)
		}*/
	
		/*def sql = new Sql(dataSource)
		
		 def messages = []
		    sql.eachRow('SELECT * FROM messages where has_child=0  and (sender='+session?.user?.id +' or id in (select msg_id from message_receivers where receiver='+session?.user?.id +'))') {
		        Message m = new Message(it.toRowResult())
				
				println("******it.toRowResult()*****"+it.toRowResult())
				messages << m
				println("******m*****"+m)
		    }
		    messages*/
		//[messages:messages.reverse()]
		//println("************"+messages)
		//def messages = Message.executeQuery("SELECT message FROM Message m where sender=1 or id in (select r.msg_id from m.message_receiver r where r.receiver=1)")
		def messages = Message.withCriteria{
			eq("hasChild", 0)
			/*or{
				eq("receivers")
			}*/
		}
	    
		List<Message> msgs = new ArrayList<Message>()
		for(int i=0; i<messages.size(); i++){
			Message m = messages.get(i);
			//println("**********"+m.receivers)
			if(m.sender.id == session?.user.id ){
			
				if(!msgs.contains(m)){
					msgs.add(m)
					}
			} 
			Set recs = m.receivers
			Iterator iter = recs.iterator()
			while(iter.hasNext()){
				User u = iter.next()
				if(u.id == session?.user.id ){
					
					if(!msgs.contains(m)){
					msgs.add(m)
					}
					}
			}
		}
		
		messages=msgs
		[messages:messages?.reverse()]
		
	}
	
	
	
	def msgTrail(String id) {
		
		def msgs = new ArrayList<Message>()
		msgHierarchy(msgs, id);
		
		[msgs:msgs?.reverse()]
		
		
		render(template: 'msgtrail', model: [msgs: msgs])
		
	}
	
	def msgHierarchy(ArrayList msgs, String id){
		
		Message msg = Message.get(id);
		if(msg.parentId==null){
			msgs.add(msg)
		}
		else{
		Message msg2 = Message.findByParentId(msg.getParentId());
		
		msgs.add(msg2);
		msgHierarchy(msgs, msg2.getParentId());
		}
	}
	def oMessages(String companyId, String object, String objectId) {
		
		
		def messages =Message.withCriteria{
			eq("hasChild", 0)
			eq("object", object)
			eq("objectId", objectId)
		
		}
		
		List<Message> msgs = new ArrayList<Message>()
		for(int i=0; i<messages.size(); i++){
			Message m = messages.get(i);
			
			if(m.sender.id == session?.user.id ){
			
				if(!msgs.contains(m)){
					msgs.add(m)
					}
			}
			Set recs = m.receivers
			Iterator iter = recs.iterator()
			while(iter.hasNext()){
				User u = iter.next()
				if(u.id == session?.user.id ){
					
						if(!msgs.contains(m)){
							msgs.add(m)
						}
					}
			}
		}
		
		messages=msgs
		Integer cid = new Integer(companyId)
		[messages:messages?.reverse(), TO:setReceipient(cid, object, objectId)]
		
	}
	/*def submitMessage(String message) {
		
		new Message(sender: session.userName, message:message, companyId:session.companyId, object:'order').save(flush: true, failOnError: true)
		
		render "<script>retrieveLatestMessages()</script>"
	}*/
	def submitOMessage(String message, String receivers, String object, String context, String objectId, String parentId, Integer count) {
		
		User senderUser = User.findByUsername( session.userName)
		if(parentId !=null && parentId.trim().length()>0 ){
		Message parent = Message.get(parentId)
		parent.setHasChild(1);
		update(parent);
		}
		
		Message m = new Message(sender: senderUser, message:message, companyId:session.companyId, object:object, context:context, objectId:objectId, parentId:parentId, count:count==null?1:count+1 )
		String[] recvrs = receivers.split(",");
		for(int i=0; i< recvrs.size(); i++){
		
		String[] names = recvrs[i].split(" ")
		Person receUser = Person.withCriteria{
			eq("firstName", names[0].trim())
			eq("lastName", names[1].trim())
			}[0]
		//println("**********************************"+receUser)
		//User receUser = User.findById(recePerson.id)
		
			if(receUser != null){
			m.addToReceivers(receUser);
			}
		}
		m.save(flush: true, failOnError: true)
		render "<script>oMessages()</script>"
	}
	def submitMessage(String message, String receivers, String object, String context, String objectId, String parentId, Integer count) {
	
		User senderUser = User.findByUsername( session.userName)
		if(parentId !=null && parentId.trim().length()>0 ){
		Message parent = Message.get(parentId)
		parent.setHasChild(1);
		update(parent);
		}
		Message m = new Message(sender: senderUser, message:message, companyId:session.companyId, object:object, context:context, objectId:objectId, parentId:parentId, count:count==null?1:count+1 )
		String[] recvrs = receivers.split(",");
		for(int i=0; i< recvrs.size(); i++){
		
		String[] names = recvrs[i].split(" ")
		Person receUser = Person.withCriteria{
			eq("firstName", names[0])
			eq("lastName", names[1])
			}[0]
		
		//User receUser = User.findById(recePerson.id)
		
			if(receUser != null){
			m.addToReceivers(receUser);
			}
		}
		m.save(flush: true, failOnError: true)
		render "<script>myMessages()</script>"
	}
	def chat() {
		render (view: 'chat')
	}
	def messages() {
		render (view: 'messages')
	}
	
	def video() {
		render (view: 'video')
	}
	
	def hangout(){
		render (view:'hangout')
	}
}