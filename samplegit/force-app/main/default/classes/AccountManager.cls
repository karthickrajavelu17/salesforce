@RestResource(urlmapping='/Accounts/*/contacts')
global  with sharing class AccountManager {
    @HttpGet
    global static Account getAccount()
    {
      RestRequest request=RestContext.request;
      String accountid =request.requestURI.substringBetween('Accounts/','/contacts');
      system.debug(accountid);
      Account objAccount = [Select Id,Name ,(Select Id,Name from Contacts) from Account where Id=:accountid limit 1];
      return objAccount;
    }

}