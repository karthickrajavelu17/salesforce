trigger AccountTrig on Account (before insert,after insert ) {
    
    if(Trigger.isBefore)
    {
       AccountHelper.updatefield(Trigger.new);
    }
    if(Trigger.isAfter)
    {
        AccountHelper.createCon(Trigger.new);
    }

}