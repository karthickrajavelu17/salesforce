public class AccountProcessor {
    
    @future
     public static void countContacts(Set<Id> Accountid)
     {
       
        List<Account> updateAcc =[select id,Number_of_Contacts__c ,(select id from Contacts) from Account where id=:Accountid];
        if(updateAcc != null && !updateAcc.isEmpty())
        {
            for( Account a : updateAcc)
            {
                a.Number_of_Contacts__c = a.Contacts.size();
                
            }
        }
         
         update updateAcc;
     }

}