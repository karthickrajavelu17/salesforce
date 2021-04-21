public class InvoicePostRequest {
//{"Line": [ { "DetailType": "SalesItemLineDetail",  "Amount": 1000.0,  "SalesItemLineDetail": { "ItemRef": {"name": "Services", "value": "1"}}}], "CustomerRef": {"value": "1"}}

    public static void jsongeneratormethod(){
    system.JSONGenerator inv=system.JSON.createGenerator(true);
   inv.writeStartObject();
     inv.writeFieldName(ConstantUTIL.lne);
        inv.writeStartArray();
         inv.writeStartObject();
           inv.writeStringField('DetailType','SalesItemLineDetail');
            inv.writeNumberField('LineNum', 1);
          inv.writeNumberField('Amount', 1000);
           inv.writeStringField('Description','product description');
     
         
           inv.writeFieldName('SalesItemLineDetail');
             inv.writeStartObject();
                inv.writeFieldName('ItemRef');
                     inv.writeStartObject();
                          inv.writeStringField('name','Services');
                          inv.writeStringField('value','3');
                     inv.writeEndObject();
               inv.writeEndObject();
            inv.writeEndObject();
         inv.writeEndArray();       
         inv.writeFieldName('CustomerRef');
           inv.writeStartObject();
             inv.writeStringField('value','2');
           inv.writeEndObject();
   inv.writeEndObject();
        System.debug('json--'+inv.getAsString());
        String body=inv.getAsString();
        system.debug('string '+body);
         System.debug('Create a Invoice');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/invoice?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken=ConstantUTIL.authprefix+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod(ConstantUTIL.method);
       req.setHeader(ConstantUTIL.content,ConstantUTIL.contentType);
       req.setHeader(ConstantUTIL.auth,AccessToken);
       //String body='{"Line": [ { "DetailType": "SalesItemLineDetail",  "Amount": 1000.0,  "SalesItemLineDetail": { "ItemRef": {"name": "Services", "value": "1"}}}], "CustomerRef": {"value": "1"}}';
       req.setBody(body);
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
       String body1='{"TrackQtyOnHand": true,'+
           ' "Name": "name1",'+
           ' "QtyOnHand": 10,'+
           ' "IncomeAccountRef": {  "name": "Sales of Product Income", "value": "79"}, '+
           '"AssetAccountRef": { "name": "Inventory Asset", "value": "81"}, '+
           ' "InvStartDate": "2015-01-01", '+
           '"Type": "Inventory", '+
           ' "ExpenseAccountRef": {"name": "Cost of Goods Sold", "value": "80"}}';
       System.JSONGenerator itm =system.Json.createGenerator(true); 
       itm.writeStartObject();
       itm.writeBooleanField('TrackQtyOnHand',true);
       itm.writeStringField('Name','Sample product Test');
       itm.writeNumberField('QtyOnHand',10);
       itm.writeFieldName('IncomeAccountRef');
       itm.writeStartObject();
       itm.writeStringField('name','Sales of Product Income');
       itm.writeStringField('value','79');
       itm.writeEndObject();
       itm.writeFieldName('AssetAccountRef');
       itm.writeStartObject();
       itm.writeStringField('name','Inventory Asset');
       itm.writeStringField('value','81');
       itm.writeEndObject(); 
       itm.writeStringField('InvStartDate','2020-11-10');
       itm.writeStringField('Type','Inventory');
       itm.writeFieldName('ExpenseAccountRef');
       itm.writeStartObject();
       itm.writeStringField('name','Cost of Goods Sold');
       itm.writeStringField('value','80');
       itm.writeEndObject();
       itm.writeEndObject(); 
       Account acc=[Select Name,Email__c,Phone from Account Limit 1]; 
       System.debug('Json item---'+itm.getAsString()); 
          	   String body2='{"FullyQualifiedName": "'+acc.Name+'",'+
             '"PrimaryEmailAddr": {"Address": "'+acc.Email__c+'"},'+
             ' "DisplayName": "'+acc.Name+'",'+
             '  "Suffix": "Jr",'+
             ' "Title": "Mr",'+
             ' "MiddleName": "B", '+
             '"Notes": "Here are other details.",'+
             ' "FamilyName": "King",'+
             ' "PrimaryPhone": {'+
             '"FreeFormNumber": "'+acc.Phone+'"},'+
             '"CompanyName": "Groceries",'+
             ' "BillAddr": '+
             '{"CountrySubDivisionCode": "CA",'+
             ' "City": "Mountain View", '+
             '"PostalCode": "94042", '+
             '"Line1": "123 Main Street", '+
             '"Country": "USA"}, '+
             '"GivenName": "Sames"}';  
       system.JSONGenerator cus =system.Json.createGenerator(true);
       cus.writeStartObject();
       cus.writeStringField('FullyQualifiedName',acc.Name);
       cus.writeFieldName('PrimaryEmailAddr');
       cus.writeStartObject();
       cus.writeStringField('Address',acc.Email__c);
       cus.writeEndObject();
       cus.writeStringField('DisplayName',acc.Name);
       cus.writeStringField('Suffix','Jr');
       cus.writeStringField('Title','Mr');
       cus.writeStringField('MiddleName','B');
       cus.writeStringField('Notes','Here are the Other Details');
       cus.writeStringField('FamilyName',acc.Name);        
       cus.writeFieldName('PrimaryPhone');
       cus.writeStartObject();
       cus.writeStringField('FreeFormNumber',acc.Phone);
       cus.writeEndObject();
       cus.writeStringField('CompanyName','Groceries');
       cus.writeFieldName('BillAddr');
       cus.writeStartObject();
       cus.writeStringField('CountrySubDivisionCode','CA');
       cus.writeStringField('City','Mountain View');
       cus.writeStringField('PostalCode','1234');
       cus.writeStringField('Line1','123 street');
       cus.writeStringField('Country','USA');
       cus.writeEndObject();
       cus.writeStringField('GivenName',acc.Name);
       cus.writeEndObject();

     system.debug('--'+cus.getAsString());        
    }
}