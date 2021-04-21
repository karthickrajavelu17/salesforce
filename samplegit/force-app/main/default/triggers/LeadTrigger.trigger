Trigger LeadTrigger on Lead(After Insert){
    if(Trigger.isAfter && Trigger.isInsert){
        LeadTriggerHandler.AfterUpdate(Trigger.New);
    }   
}