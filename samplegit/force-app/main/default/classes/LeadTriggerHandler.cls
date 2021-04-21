public class LeadTriggerHandler {
Public static void AfterUpdate(List<Lead> lstLeads){
		LeadStatus ldStatus = [SELECT Id,MasterLabel,isConverted from LeadStatus WHERE isConverted = TRUE
                              Limit 1];
		List<Database.LeadConvert> leadsToConvert = new List<Database.LeadConvert>(); 
		for(Lead ld : lstLeads){
			Database.LeadConvert lConvert = new  Database.LeadConvert();
			lConvert.SetLeadID(ld.Id);
			lConvert.SetConvertedStatus(ldStatus.MasterLabel);
			lConvert.SetDoNotCreateOpportunity(False);
			leadsToConvert.Add(lConvert);
		}
	
	try{
		if(!leadsToConvert.isEmpty()){
			Database.LeadConvertResult[] results = Database.convertLead(leadsToConvert);
		}
	}
	Catch(Exception ex){
		System.Debug(ex.getMessage());
	}
    for(Database.LeadConvert lds:leadsToConvert){
        System.debug('accountid '+lds.getAccountId());
        system.debug('Opportunityid '+lds.getOpportunityId());
        system.debug('Contactid '+lds.getContactId());
    }
}
}