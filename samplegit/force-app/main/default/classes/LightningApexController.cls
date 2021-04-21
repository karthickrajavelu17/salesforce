public class LightningApexController {
    
    @Auraenabled
     public static List<Account> fetchAccounts()
     {
         return [select id,Name from Account LIMIT 10];
     }

}