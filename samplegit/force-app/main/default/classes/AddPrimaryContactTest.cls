@isTest
public class AddPrimaryContactTest {

    @isTest static void TestMeth()
    {
        List<Account> Teste = new List<Account>();
        for(Integer i=0;i<50;i++)
        {
            Teste.add(new Account(BillingState='CA',name='Karthick'+i));
        }
         for(Integer j=0;j<50;j++)
        {
            Teste.add(new Account(BillingState='NY',name='Karthick1'+j));
        }
        insert Teste;
        
        Contact co = new Contact();
        co.FirstName='Demo';
        co.LastName ='Demo';
        insert co;
        String state='CA';
        
        AddPrimaryContact ap=new AddPrimaryContact(co,state);
        Test.startTest();
        system.enqueueJob(ap);
        Test.stopTest();
    
    }
    
}