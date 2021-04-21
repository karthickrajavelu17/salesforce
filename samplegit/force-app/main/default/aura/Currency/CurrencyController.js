({
	handleClick : function(component, event, helper) {
        var euro = component.get('v.euro');
         //alert(component.get("v.euro"));
        var action = component.get('c.EurotoCur');
        action.setParams(
            {
                "eur":euro
            }
        );
        action.setCallback(this,function(res)
                           {
                             component.set('v.inr',res.getReturnValue()); 
                               
                           });
		$A.enqueueAction(action);
	}
})