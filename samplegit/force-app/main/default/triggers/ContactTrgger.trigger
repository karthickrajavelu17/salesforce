trigger ContactTrgger on Contact (after update,before insert,after insert) {
    
    if(Trigger.isUpdate)
          ContactHandler.HandlerMethod(Trigger.new,Trigger.oldMap);
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        ContactHandler.Handlermethod2(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        for(Contact con :[select id,QuickBook_Id__c,From_QuickBook__c from Contact where id in :Trigger.newMap.keyset()]){
            if(con.QuickBook_Id__c ==null && con.From_QuickBook__c == false)
            QuickBookHttp.CreateCustomer(con.id);
        }
    }
}