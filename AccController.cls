public class AccController {
    public Account account{get;set;}
        public Shipment__c shipment{get;set;}
    
    public AccController()
    {
        
            account = new Account();
            shipment = new Shipment__c();
        
    }
    
    public PageReference submit()
    {
        shipment.Name=account.Name;
        shipment.AccountName__c = account.Name;
        shipment.AnnualRevenue__c=account.AnnualRevenue;
        shipment.Phone__c=account.Phone;
        insert shipment;
        PageReference pr=new apexpages.StandardController(shipment).view();
        return pr;

    }

}