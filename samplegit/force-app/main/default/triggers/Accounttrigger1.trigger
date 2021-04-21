trigger Accounttrigger1 on Account (after update,before update,before insert) {
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
          TriggerHandler.updateaddress(Trigger.new,Trigger.oldMap);
        
    }
        if(Trigger.isAfter && Trigger.isUpdate)
    {
          TriggerHandler.updateaddress1(Trigger.new,Trigger.newMap);
         // TriggerHandler.updateaddress2(Trigger.new,Trigger.oldMap);
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate)
          TriggerHandler.HandlerMethod3(Trigger.newMap);
    
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            TriggerHandler.HandlerMethod5(Trigger.new);
        }
        if(Trigger.isInsert)
        {
            TriggerHandler.HandlerMethod6(Trigger.new);
        }
    }

}