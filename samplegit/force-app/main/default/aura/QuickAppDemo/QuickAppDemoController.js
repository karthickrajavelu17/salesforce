({
	handleclick : function(component, event, helper) {
        var action = component.get("c.fetchAccounts");
        action.setCallback(this,function(response)
                           {
                           var state=response.getState(); 
                           if(component.isValid() && status==='SUCCESS')
                               component.set('v.list',response.getReturnValue());
                           });
       $A.enqueueAction(action);
		
	}
})