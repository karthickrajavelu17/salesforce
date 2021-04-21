public class page3 {

    public Account account {get;set;}
    public page3()
    {
        Id id=apexpages.currentPage().getParameters().get('id');
        account =[select id,name,phone from account where id=:id];
    }
}