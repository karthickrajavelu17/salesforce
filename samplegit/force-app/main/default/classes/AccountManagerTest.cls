@isTest
private class AccountManagerTest {
    static testmethod void testmethod1()
    {
     Account obj = new Account(Name='Test Account');
     insert obj;
     Contact objc = new Contact(LastName='Test contact',AccountId=obj.Id);
     insert objc;
     Id recordId =obj.Id;
     RestRequest request = new RestRequest();
     request.requestURI='https://mydomain-dev-hub-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
      + recordId +'/contacts';
     request.httpMethod='GET';
     RestContext.request=request;
     Account thisAccount = AccountManager.getAccount();
     System.assert(thisAccount!= null);
     System.assertEquals('test Account', thisAccount.Name);

    
    }

}