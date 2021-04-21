public class NewQuickBookCheck {

    public static void CreateItem(String id){
       System.debug('Create a Item');
       Product2 pro=[select name from Product2 where id=:id];
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/item?minorversion=40'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('POST');
       req.setHeader('Content-type','application/json');
       req.setHeader('Authorization',AccessToken);
     /*  String body='{"TrackQtyOnHand": true,'+
           ' "Name": "'+pro.Name+'",'+
           ' "QtyOnHand": 10,'+
           ' "IncomeAccountRef": {  "name": "Sales of Product Income", "value": "79"}, '+
           '"AssetAccountRef": { "name": "Inventory Asset", "value": "81"}, '+
           ' "InvStartDate": "2015-01-01", '+
           '"Type": "Inventory", '+
           ' "ExpenseAccountRef": {"name": "Cost of Goods Sold", "value": "80"}}';
       req.setBody(body);*/
        ProductItemWrapper prod=new ProductItemWrapper();
        prod.ExpenseAccountRef.value='80';
        prod.ExpenseAccountRef.Name='Cost of Goods Sold';
        prod.Type='Inventory';
        prod.InvStartDate=string.valueOf(system.now().date());
        prod.AssetAccountRef.Value='81';
        prod.AssetAccountRef.Name='Inventory Asset';
        prod.IncomeAccountRef.Value='79';
        prod.IncomeAccountRef.Name='Sales of Product Income';
        prod.QtyOnHand=10; 
        prod.Name=pro.name;
        prod.TrackQtyOnHand=true; 
        String jsonbody=string.valueOf(json.serialize(prod));
        System.debug('JsonBody after wrapping'+jsonbody);
       req.setBody(jsonbody); 
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
      }
    
}