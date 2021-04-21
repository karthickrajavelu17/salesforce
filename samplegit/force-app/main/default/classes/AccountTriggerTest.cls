@isTest
public class AccountTriggerTest {
    @isTest static void createAccount200()
    {
        List<Account> accs = new List<Account>();
        for(integer i=0;i<200;i++)
        {
            Account a = new Account(Name='test account'+i,BillingState ='CA');
            accs.add(a);
        }
        Test.startTest();
        insert accs;
        Test.stopTest();
        List<Account> lst = [SELECT ShippingState from Account];
        for(Account abc : lst)
        {
            system.assertEquals('CA',abc.ShippingState,'error');
        }
    }

}