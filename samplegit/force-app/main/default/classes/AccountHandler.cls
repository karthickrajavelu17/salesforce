public class AccountHandler {
 public static Account insertNewAccount(String name1)
 {
   try
   {
   Account a = new Account(Name=name1);
   insert a;
   return a;
   }
   catch(DmlException e)
   {
       System.debug('A Dml Exception has occured'+e.getMessage());
       return null;
   }
 
    
 }
}