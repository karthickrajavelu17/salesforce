public class AccountHelper {
   
     public static void createCon(List<Account> acclist)
     {
         List<Contact> conlist = new List<Contact>();
         for(Account ac :acclist)
         {
           Contact con = new Contact();
           con.LastName='Trig Contact';
           con.AccountId=ac.Id;
           conlist.add(con);
             
         }
         insert conlist;
     }
    
    public static void updatefield(List<Account> Acc)
    {
        for(Account a:Acc)
        {
            a.Description='This is done  by trigger';
        }
    }

}