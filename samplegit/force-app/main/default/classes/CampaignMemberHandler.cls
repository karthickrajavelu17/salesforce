public class CampaignMemberHandler {
  public static Boolean isFirstTime = true;
    
  public static void CampaignMethod1(List<CampaignMember> camList)
    {
    /*  Set<String> camid =new Set<String>();
        Map<id,CampaignMember> mapcampaign = new Map<id,CampaignMember>();
        Decimal RevbyCon=0,RevByLead=0;
        for(CampaignMember c :camList)
        {
           camid.add(c.CampaignId);
         
        }
        if(camid.size() > 0)
        {
            List<CampaignMember> camMem =[SELECT ContactId,Contact.Account.AnnualRevenue,LeadId,Lead.AnnualRevenue FROM CampaignMember Where CampaignId IN :camid And LeadId!=null And ContactId!=null];
            for(CampaignMember c:camMem)
            {
             mapcampaign.put(c.CampaignId,c);
                RevbyLead +=c.Lead.AnnualRevenue;
                RevbyCon +=c.Contact.Account.AnnualRevenue;
                
            }
            
            for(CampaigMember cc :camMem)
            {
                Campaign c =mapcampaign.get(id);
            }
   
            List<Campaign> cList=[Select id,Cumulative_Amount__c from Campaign Where id IN :camid];
            List<Campaign> cc = new List<Campaign>();
            for(Campaign c:cList)
            {
            if(RevbyLead > RevbyCon)
                c.Cumulative_Amount__c=RevbyLead;
            else
                c.Cumulative_Amount__c=RevbyCon;
                
              cc.add(c);
            }
                  update cc;
        }
  */
       Set<String> camid =new Set<String>(); 
       Decimal RevbyCon=0,RevByLead=0;
        for(CampaignMember c :camList)
        {
           camid.add(c.CampaignId);
         
        }
        List<Campaign> lstCam =[Select name from Campaign Where id IN :camid];
        List<Campaign> lst = new List<Campaign>();
        
        for(Campaign c:lstCam)
        {
            RevbyLead=0;
            RevbyCon=0;
            
            for(CampaignMember cm :[SELECT ContactId,Contact.Account.AnnualRevenue,LeadId,Lead.AnnualRevenue FROM CampaignMember Where CampaignId=:c.Id And LeadId!=null And ContactId!=null])
            {
                RevbyLead +=cm.Lead.AnnualRevenue;
                RevbyCon +=cm.Contact.Account.AnnualRevenue;
                
            }
            if(RevbyLead > RevbyCon)
                c.Cumulative_Amount__c=RevbyLead;
            else
                c.Cumulative_Amount__c=RevbyCon;
            
            lst.add(c);
        }
        update lst;
    }

}