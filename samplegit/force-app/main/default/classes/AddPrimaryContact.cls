public class AddPrimaryContact implements Queueable {
    
    private Contact c;
    private String state;
    
   public AddPrimaryContact(Contact c,String state)
   {
       this.c=c;
       this.state=state;
   }
   
    public void execute(QueueableContext context)
    {
        List<Account> lstAcc =[SELECT id,Name ,(SELECT id ,FirstName,LastName from Contacts) FROM Account where BillingState =:state];
        List<Contact> lstCon = new List<Contact>();
        for(Account a:lstAcc)
        {
            Contact con =c.clone(false,false,false,false);
            con.AccountId=a.id;
            lstCon.add(con);
            
        }
        if(lstCon.size() >0)
        {
            insert lstCon;
         }
    }

}