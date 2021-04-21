@isTest
public class AccountProcessorTest {
    
    public static testmethod void testMeth()
    {
       Account a = new Account(Name ='Modal Account');
       insert a;
       
       Contact c = new Contact();
       c.FirstName='Steve';
       c.LastName='Smith';
       c.Email ='johnsmith12@gmail.com';
       c.AccountId = a.id;
       insert c;
        
       Set<id> ups = new Set<id>();
       ups.add(a.id);
       Test.startTest();
       AccountProcessor.countContacts(ups);
       Test.stopTest();
   
     Account updateAcc =[select Number_of_Contacts__c from Account where id=:a.id];
      system.assertEquals(Integer.valueof(updateAcc.Number_of_Contacts__c),1);
      
        
    
    
    
    }

}