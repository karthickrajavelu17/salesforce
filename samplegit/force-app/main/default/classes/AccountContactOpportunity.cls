public class AccountContactOpportunity
{


public list<Opportunity> opplist{get;set;}
private final Contact acc;

public  AccountContactOpportunity(ApexPages.StandardController controller)
{

 acc=(Contact)controller.getRecord();
    if(acc!=null)
 opplist=[select Name,stageName from opportunity where accountid=:acc.accountid];
}
}