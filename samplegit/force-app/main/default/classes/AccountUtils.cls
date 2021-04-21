public class AccountUtils {
    public static List<Account> accountsByState(String stateabr)
    {
        List<Account> myaccount= [SELECT Id,Name from Account WHERE BillingState = :stateabr];
      
        return myaccount;
        
    }
}