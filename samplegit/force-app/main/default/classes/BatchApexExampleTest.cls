@isTest
private class BatchApexExampleTest {
    static testmethod void test() {
       
    List<Account> accList = new List<Account>();
    for (Integer i=0;i<400;i++) {
        Account ac = new Account(Name = 'Account ' + i);
        accList.add(ac);
    }
    insert accList;
 
        Test.startTest();
            BatchApexExample b = new BatchApexExample();
        Database.executeBatch(b);
        Test.stopTest();
      Account a=[SELECT Id,City__c,BillingCity FROM Account Where BillingCity!=null limit 1];
      System.assertEquals(a.city__c,a.BillingCity);

    }
}