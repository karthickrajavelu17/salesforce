({
	show : function(component, event, helper) {
        var sel=component.find('mySelect');
        var nav=sel.get('v.value');
        if(nav == 'Other')
            component.set('v.check',true);
        else
            component.set('v.check',false);
		
	}
})