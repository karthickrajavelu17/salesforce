trigger AccountTrigger on Account (before insert,after insert) {
 /*   if(trigger.isBefore && trigger.isInsert)
    {
        AccountTriggerHandler.CreateAccounts(trigger.new);
    }*/
    if(trigger.isBefore && trigger.isInsert)
    {
        try{
         System.debug('Calling Rest APi');
        QuickBookHttp.CreateCustomer(Trigger.new[0]);
        }
        catch(Exception e){
            System.debug('Exception '+e.getMessage());
        }
    }

}