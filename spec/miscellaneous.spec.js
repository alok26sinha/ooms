describe("miscellaneous", function(){

  it("should expire requisitions after 7 days", function(){
    var model = {id:"1234",name:"test"};
    cimbidia.saveToLocal("test", model);
    expect(localStorage.cimbidiaManager).not.toBeNull();
    var d = new Date();
    var manager = JSON.parse(localStorage.cimbidiaManager);
    d.setDate(d.getDate()-10);
    manager["test"] = d;
    localStorage.cimbidiaManager = JSON.stringify(manager);
    cimbidia.expireFromLocal();
    var retrievedModel = cimbidia.getFromLocal("test");
    expect(retrievedModel).toBeNull();
  });

  it("should save and get from local storage", function(){
    var model = {id:"1234",name:"test"};
    cimbidia.saveToLocal("test", model);
    var retrievedModel = cimbidia.getFromLocal("test");
    expect(localStorage.cimbidiaManager).not.toBeNull();
    expect(localStorage.cimbidiaManager["test"]).not.toBeNull();
    console.log(localStorage.cimbidiaManager["test"]);
    expect(retrievedModel.id).toEqual(model.id);
    expect(retrievedModel.name).toEqual(model.name);
  });

  it("should delete from local", function() {
    var model = {id:"1234",name:"test"}
    cimbidia.saveToLocal("test", model);
    cimbidia.deleteFromLocal("test");
    var retrievedModel = cimbidia.getFromLocal("test");
    expect(retrievedModel).toBeNull();
  });

  it("should save requisition to local", function(){
    var model = new cimbidia.requisition.Requisition({id:"1234",name:"test"});
    var key = cimbidia.requisition.saveRequisitionToLocal(model);
    expect(key).toEqual("cimbidiaRequisition1234");
    var retrievedModel = cimbidia.getFromLocal(key);
    expect(retrievedModel.name).toEqual(model.name());
    expect(cimbidia.requisition.getRequisitionFromLocal(model.id()).id).toEqual(model.id());
  });

  it("should delete requisition from local", function(){
    var model = new cimbidia.requisition.Requisition({id:"1234",name:"test"});
    var key = cimbidia.requisition.saveRequisitionToLocal(model);
    expect(key).toEqual("cimbidiaRequisition1234");
    cimbidia.requisition.deleteRequisitionFromLocal(model.id());
    var retrievedModel = cimbidia.getFromLocal(key);
    expect(retrievedModel).toBeNull();
  });

  it("should not save requistion to local if it has no Id", function(){
    var model =  new cimbidia.requisition.Requisition({name:"test"});
    var key = cimbidia.requisition.saveRequisitionToLocal(model);
    expect(key).toBeNull();
   });

  it("should save picklist to local with requisition Id", function(){
    var model = new cimbidia.requisition.Picklist({id:"1234", requisitionId:"5678"});
    var key = cimbidia.requisition.savePicklistToLocal(model);
    expect(key).toEqual("cimbidiaPicklist5678");
    var retrievedModel = cimbidia.getFromLocal(key);
    expect(retrievedModel.requisitionId).toEqual(model.requisitionId());
    expect(cimbidia.requisition.getPicklistFromLocal(model.requisitionId()).id).toEqual(model.id());
  });

  it("should not save picklist to local if it has no requisition Id", function(){
    var model =  new cimbidia.requisition.Picklist({id:"test"});
    var key = cimbidia.requisition.savePicklistToLocal(model);
    expect(key).toBeNull();
   });

  it("should delete requisition from local", function(){
    var model = new cimbidia.requisition.Picklist({id:"1234",requisitionId:"5678"});
    var key = cimbidia.requisition.savePicklistToLocal(model);
    expect(key).toEqual("cimbidiaPicklist5678");
    cimbidia.requisition.deletePicklistFromLocal(model.requisitionId());
    var retrievedModel = cimbidia.getFromLocal(key);
    expect(retrievedModel).toBeNull();
  });
});
