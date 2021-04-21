global class LeadProcessor implements Database.Batchable<sObject> {
    global integer count=0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id , LeadSource FROM Lead');
        
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> l_list)
    {
      List<Lead> l_lst_new = new List<Lead>();
       for(Lead l : l_list)
       {
           l.LeadSource='Dreamforce';
           l_lst_new.add(l);
           count +=1;
           
       }
        
        update l_lst_new;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        system.debug('Count ='+count);
    }

}