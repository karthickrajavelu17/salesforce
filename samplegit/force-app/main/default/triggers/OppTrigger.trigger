trigger OppTrigger on Opportunity (after insert,after update) {
    
    if(Trigger.isInsert || Trigger.isUpdate)
        OppHelper.OppMethod(Trigger.newMap);

}