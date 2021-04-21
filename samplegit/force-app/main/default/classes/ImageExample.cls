public class ImageExample {
        Account account;

    public ImageExample() {
        account = new Account();
        account=[select id from Account where name='Salesforce Account'];
    }

    public pagereference upload()
    {
       PageReference acctPage = new ApexPages.StandardController(account).view();
        acctPage.setRedirect(true);
        return acctPage;
    }

}