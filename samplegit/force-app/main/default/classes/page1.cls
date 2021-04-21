public class page1 {
 
    Public Account account {get;set;}
    public page1()
    {
        account = new Account();
    }
    
    public pagereference save()
    {
      insert account;
      PageReference rp = new PageReference('/apex/page2?id='+account.id);  
      return rp;
    }
}