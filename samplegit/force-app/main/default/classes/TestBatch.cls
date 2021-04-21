global class TestBatch implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select AnnualRevenue From Lead');
    }
    
    global void execute(Database.BatchableContext bc,List<Lead> llist)
    {
        
    }
   global void finish(Database.BatchableContext bc)
   {
       
   }
}