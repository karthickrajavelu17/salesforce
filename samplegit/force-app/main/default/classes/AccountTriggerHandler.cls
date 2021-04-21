public class AccountTriggerHandler {
    
    public static void CreateAccounts(List<Account> accsList)
    {  
        for(Account a: accsList)
        {
            if(a.ShippingState!=a.BillingState)
            {
                a.ShippingState=a.BillingState;
             }
        }
    }

}