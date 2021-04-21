public class CreteAccount {
    public static void CreteAcc()
    {
        try
        {
       Account a=new Account(Name='Salesforce Account');
       insert a;
       
       Contact c=new Contact(FirstName='Ashiz',LastName='Nehra',AccountID=a.id);
       insert c;
        }
        catch(DMLException e)
        {
            System.debug('Error'+e.getMessage());
        }
    }

}