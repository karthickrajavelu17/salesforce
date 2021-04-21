global class BatchApexExample implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
      
        String query = 'SELECT Id,City__c,BillingCity FROM Account Where BillingCity!=null';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
     for(Account acc : accList) {        
        
            acc.City__c = acc.BillingCity;
        }
      update accList;
         
       }   
     
    global void finish(Database.BatchableContext BC) {
        
    }
}