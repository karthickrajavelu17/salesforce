public class page2 {
    Public account account {get;set;}
    public page2()
    {
        Id id=apexpages.currentPage().getParameters().get('id');
        account =[select id,name,phone from account where id=:id];
    }
    
    public pagereference save()
    {
        update account;
        PageReference rp=new PageReference('/apex/page3?id='+account.id);
        return rp;
    }

}