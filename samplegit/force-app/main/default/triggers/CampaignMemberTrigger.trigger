trigger CampaignMemberTrigger on CampaignMember (after insert,after update) {
    
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        if(CampaignMemberHandler.isFirstTime)
        {
        CampaignMemberHandler.isFirstTime=false;   
        CampaignMemberHandler.CampaignMethod1(Trigger.new);
        }
    }

}