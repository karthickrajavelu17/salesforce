public class OppHelper {
    
 public static void OppMethod(Map<Id,Opportunity> mapopp)
    {
 List<Opportunity> opList=[SELECT Id, Name,Probability, Account.Name, 
       (SELECT Quantity, UnitPrice, TotalPrice FROM 
        OpportunityLineItems )
     FROM Opportunity Where Id in :mapopp.keyset()];
        
        Decimal total;
        
        List<Opportunity> upd =new List<Opportunity>();
        
        for(Opportunity o :opList)
        {
            total=0;
            for(OpportunityLineItem ol :o.OpportunityLineItems)
            {
                total+=ol.Quantity * ol.UnitPrice;
            }
            if(o.Probability >= 50)
                o.Cumalative_Amount__c=total;
            
            upd.add(o);
        }
        update upd;
    }

}