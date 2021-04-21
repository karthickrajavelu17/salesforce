public class QuickBookHttp {
    @future(callout=true)
   public static void CreateAccount(String name){
        system.debug('Customer Record Creation'+name);
        List<Account> updateaccLst=new List<Account>();
        String CUSTOMER_URL='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/account?minorversion=55';
        String CLIENT_ID='ABggN1QnZ3I60yL6DsMZVB76HA216WC54ujl15D2WC1I7wgv77';
        String CLIENT_SECRET='y742gJRexitxhOtxRzTarQFHVpksMAsdGqZYACmg';
        //string Oauth='AB11605082185SzbfLOBfV4tId4L0b4eKtKHbYbXAd7HKlcBva';
        HttpRequest req =new HttpRequest();
        req.setEndPoint(CUSTOMER_URL);
        req.setMethod('POST');
     //   Blob headerValue = Blob.valueOf(Oauth + ':');
       // String authorizationHeader = 'BASIC ' + 'QUJnZ04xUW5aM0k2MHlMNkRzTVpWQjc2SEEyMTZXQzU0dWpsMTVEMldDMUk3d2d2Nzc6eTc0MmdKUmV4aXR4aE90eFJ6VGFyUUZIVnBrc01Bc2RHcVpZQUNtZw==';
      //  req.setHeader('Authorization', authorizationHeader);
      //  Content-Type: application/x-www-form-urlencoded
//Accept: application/json
//Authorization: Basic QUJnZ04xUW5aM0k2MHlMNkRzTVpWQjc2SEEyMTZXQzU0dWpsMTVEMldDMUk3d2d2Nzc6eTc0MmdKUmV4aXR4aE90eFJ6VGFyUUZIVnBrc01Bc2RHcVpZQUNtZw==
      
        //req.setHeader('Content-type','application/x-www-form-urlencoded');
        //req.setHeader('Accept','application/json');
        //Authorization: OAuth oauth_consumer_key=\"lvprdkR5macn8VSFf8SZgIDWd0zxFb\",oauth_token=\"lvprdBQ8Qko85TWuO
     
   		String accesstoken='eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..kenEX66k6NTRpSdN_CbcEg.kKmfuqOrOF9QpGeQFSK97X0-wjIe0xkNoLZIeMCo9tfnzHWPmZO0EY6T6UYKZot6r3ILJZoxku9cI7peeT7a4d7-i9-tLnAcioDUXatGDaoyTtuVvdBX0Oh0Bqe-F53unfnH0CMMwD7WkiSFAAuPh_mFTVMBynmQ2PZUgSngvPHoOkMNuslhwF6E3awWtoRQ6ixI1-xf48TaLpSQ4PRlOrF353l8cgFO_IWpT5Nu8MPLgqpqZ7WdYI88jgiGAK6e-iUq9Fq64B699nUv4lh4y1PiKTFHWQ-j2q0F7mgZhkvpHR5ipku_9okfuQVcPfSFdHjWnNPF4ioSBxWKQIuwNl5c_9t2MosEHPMwljsGNdo7wY7V0_-qEGfL6G7KCQ0DF36Y3VnU9Pby3035RNRQiX5QoUmOwlH2n0IIyJu3CylvWqS2eh13-ZQlTPTtyLotlrlJxJjdOFNOnM-ZD76dXJg4uqBQTcdMJuCCZ-fh1lguRG2FyOCbzy9Oi3l4k99qqbBDarePsqQb9iollrlWl3kPN9KVD9aGcm5CqiTYG_3Lp38qliYzCa1ELEdiVjBTj7L7LGq7MdJnwXIw_YLr5B1ukTW9dzI--V54G1Kuijm40NhkfR5hXqKrnPzGy8fwJm6nYIg3k6BT7c7WK3tyhRbmvwVi4d6xOTy__EAT7Obq1PyoRld_gA1KqBxwEUNzoIy-hXXCqWw-fjoaAscDDiUql3nbFO-6zsSiEEnsjsKvvJiy_qKSFt9BPzDgIueSFD-t6cAxGaczbgaIXhyCaofLir7_9ZWEWFWD_v6QAD8prKRbmZuNymHB1-R0TOZvSwP-LB2MWEP8hkqK3Cln6AseZM8AHRAD9ycNjnm_Y1gY1TphwQ-fgVShiO9sLYSZ.jyNMy6636QUecsxztNbROg';       
        req.setHeader('Content-type','application/json');
       // req.setHeader('Content-type','application/json');
       // req.setHeader('Authorization','OAuth oauth_consumer_key=\"y742gJRexitxhOtxRzTarQFHVpksMAsdGqZYACmg",oauth_token=\"'+accesstoken+',oauth_nonce='+system.today()+',oauth_timestamp='+system.today()+',oauth_signature_method="HMAC-SHA1"');
       
        //req.setBody('DisplayName='+name+'&Suffix=jr&Title=Mr&MiddleName=kart&FamilyName=RajaFamily&GivenName=james');
        //QuickbookConnection.doRefreshAccessToken();
        QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
        String accesstokenqb='Bearer '+qb.Access_Token__c;
        req.setHeader('Authorization',accesstokenqb);
        req.setBody('{ "Name": "'+name+'", "AccountType": "Accounts Receivable"}');
        system.Debug('Request'+req);
        System.debug('Request Body'+req.getBody());
        Http http=new Http();
        HttpResponse res;
        res=http.send(req);
        String QuickBookResponse=res.getBody();
        system.debug('STATUS  : '+res.getStatus());
        system.debug('STATUS  : '+res.getStatusCode());
        system.debug('STATUS RESPONSE : '+res.getBody());
        String id,id1;
        DOM.Document doc = res.getBodyDocument();
        for(Dom.XmlNode fluxNode: doc.getRootElement().getChildElements()) {
 
            id=fluxNode.getName();
            System.debug('Id='+id);
              for(Dom.XmlNode fluxChildNode: fluxNode.getChildElements()) {
                  id1=fluxChildNode.getName();
                  System.debug('Id1='+id1);
                  if(FluxChildNode.getName()=='Id'){
                       String value=fluxChildNode.getText();
                       System.debug('Value='+value);
                   }
                }
          } 
            System.debug('Id='+id);
            System.debug('Id1='+id1);
    }
      @future(callout=true)
    public static void GetAccount(String id){
   	   System.debug('GET Account from QuickBook'); 
       String client_Id = 'ABggN1QnZ3I60yL6DsMZVB76HA216WC54ujl15D2WC1I7wgv77';
       String consumer_Secret = 'y742gJRexitxhOtxRzTarQFHVpksMAsdGqZYACmg';
       String username='karthickrajavelu@outlook.com';
       String password='Karthick@17';
       String encodedString = EncodingUtil.base64Encode(Blob.valueOf(username+':'+password));

       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/account/'+id+'?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('GET');
       req.setHeader('grant_type', 'client_credentials');
       req.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
	   req.setHeader('Authorization' , 'Basic '+encodedString);
 
       //req.setHeader('Authorization',AccessToken);
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
       String id2,id1;
       DOM.Document doc = res.getBodyDocument();
       for(Dom.XmlNode AccNode: doc.getRootElement().getChildElements()){
          id2=AccNode.getName();
          System.debug('Id='+id2);
             for(Dom.XmlNode AccChildNode: AccNode.getChildElements()){
                id1=AccChildNode.getName();
                System.debug('Id1='+id1);
                if(AccChildNode.getName()=='Id'){
                    String value=AccChildNode.getText();
                    System.debug('Value='+value);
                }
                   if(AccChildNode.getName()=='Name'){
                    String value1=AccChildNode.getText();
                    System.debug('Value='+value1);
                }
             }
         }
         System.debug('Id='+id2);
         System.debug('Id1='+id1);
	}
      @future(callout=true)
    public static void createInvoice()
    {
       System.debug('Create a Invoice');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/invoice?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('POST');
       req.setHeader('Content-type','application/json');
       req.setHeader('Authorization',AccessToken);
       String body='{"Line": [ { "DetailType": "SalesItemLineDetail",  "Amount": 1000.0,  "SalesItemLineDetail": { "ItemRef": {"name": "Services", "value": "1"}}}], "CustomerRef": {"value": "1"}}';
       req.setBody(body);
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
   }
      @future(callout=true)
    public static void getInvoice(String id)
    {
     System.debug('Get a Invoice');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/invoice/'+id+'?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('GET');
       req.setHeader('Authorization',AccessToken);
	   system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
       String jsonContent =XMLParser.xmltojson(res.getBody());
       System.debug('JSonResponse '+jsonContent);
    }

    public static void CreateItem(Product2 pro){
               System.debug('Create a Invoice');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/item?minorversion=40'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
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
        
       System.debug('Json item---'+itm.getAsString()); 
 
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('POST');
       req.setHeader('Content-type','application/json');
       req.setHeader('Authorization',AccessToken);
        
       String body='{"TrackQtyOnHand": true,'+
           ' "Name": "'+pro.Name+'",'+
           ' "QtyOnHand": 10,'+
           ' "IncomeAccountRef": {  "name": "Sales of Product Income", "value": "79"}, '+
           '"AssetAccountRef": { "name": "Inventory Asset", "value": "81"}, '+
           ' "InvStartDate": "2015-01-01", '+
           '"Type": "Inventory", '+
           ' "ExpenseAccountRef": {"name": "Cost of Goods Sold", "value": "80"}}';
       req.setBody(itm.getAsString());
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
      }
      @future(callout=true)
    public static void GetItem(String id){
      System.debug('Get a Item');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/Item/'+id+'?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('GET');
       req.setHeader('Authorization',AccessToken);
	   system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
    } 
    @future(callout=true)
    public static void getAll()
    {
        System.debug('GetAll');
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/cdc?entities=Account,Estimate&changedSince=2020-11-01&minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('GET');
       req.setHeader('Authorization',AccessToken);
	   system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
    
    }
   @future(callout=true)
    public static void CreateCustomer(String id)
    {
       System.debug('Create Customer');
       Contact acc=[select Name,Email,Phone from Contact Where id=:id];
      // String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/customer?minorversion=40';
       String Custom_url=Label.Create_Customer; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
      /* CustomerRequest cr = new CustomerRequest();
       cr.FullyQualifiedName=acc.Name;
       cr.DisplayName=acc.Name;
       cr.PrimaryEmailAddr.Address=acc.Email__c;
       cr.PrimaryPhone.FreeFormNumber=acc.Phone;
       cr.Suffix='Jr';
       cr.Title='Mr';
       cr.MiddleName='B';
       cr.Notes='Here are other details.';
       cr.FamilyName='King';
       cr.CompanyName='Groces';
       cr.BillAddr.CountrySubDivisionCode='MA';
       cr.BillAddr.City='Mountain View';
       cr.BillAddr.PostalCode='94042';
       cr.BillAddr.Line1='123 Main Street';
       cr.BillAddr.Country='USA';
 	   cr.GivenName='SamesAdd';        
       String jsonbody = JSON.serialize(cr);*/
        system.JSONGenerator cus =system.Json.createGenerator(true);
       cus.writeStartObject();
       cus.writeStringField('FullyQualifiedName',acc.Name);
       cus.writeFieldName('PrimaryEmailAddr');
       cus.writeStartObject();
       cus.writeStringField('Address',acc.Email);
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
 
       Http http=new Http();
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('POST');
       req.setHeader('Content-type','application/json');
       req.setHeader('Authorization',AccessToken);
   	   String body='{"FullyQualifiedName": "'+acc.Name+'",'+
             '"PrimaryEmailAddr": {"Address": "'+acc.Email+'"},'+
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
       req.setBody(cus.getAsString()); 
       HttpResponse res=http.send(req);
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());

    }
     @future(callout=true)
     public static void GetCustomer(String id){
   	   System.debug('GET Account from QuickBook'); 
       String Custom_url='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365152480600/customer/'+id+'?minorversion=55'; 
       QuickBook_Info__c qb=[SELECT Access_Token__c from QuickBook_Info__c WHERE Name='QuickBooks Setting Info'];
       String AccessToken='Bearer '+qb.Access_Token__c;
       HttpRequest req=new HttpRequest();
       req.setEndpoint(Custom_url);
       req.setMethod('GET');
       req.setHeader('Authorization',AccessToken);
       system.Debug('Request'+req);
       System.debug('Request Body'+req.getBody());
       Http http=new Http();
       HttpResponse res;
       res=http.send(req); 
       system.debug('STATUS  : '+res.getStatus());
       system.debug('STATUS  : '+res.getStatusCode());
       system.debug('STATUS RESPONSE : '+res.getBody());
       String id2,id1;
       DOM.Document doc = res.getBodyDocument();
       for(Dom.XmlNode AccNode: doc.getRootElement().getChildElements()){
          id2=AccNode.getName();
          System.debug('Id='+id2);
             for(Dom.XmlNode AccChildNode: AccNode.getChildElements()){
                id1=AccChildNode.getName();
                System.debug('Id1='+id1);
                if(AccChildNode.getName()=='Id'){
                    String value=AccChildNode.getText();
                    System.debug('Value='+value);
                }
                   if(AccChildNode.getName()=='Name'){
                    String value1=AccChildNode.getText();
                    System.debug('Value='+value1);
                }
             }
         }
         System.debug('Id='+id2);
         System.debug('Id1='+id1);
         String jsonres=JSON.serialize(res.getBody());
         System.debug('Jsonres '+jsonres);
         String jsonContent =XMLParser.xmltojson(res.getBody());
         System.debug('JSonResponse '+jsonContent);
         QBCustomerWrapper customer=(QBCustomerWrapper) System.JSON.deserialize(jsonContent,QBCustomerWrapper.class);
         String firstName=customer.IntuitResponse.customer.GivenName;
         String lastName=customer.IntuitResponse.customer.FamilyName;
         String Phone=customer.IntuitResponse.customer.PrimaryPhone.FreeFormNumber;
         String Email=customer.IntuitResponse.customer.PrimaryEmailAddr.Address;
         Contact con =new Contact();
         con.FirstName=firstName;
         con.LastName=lastName;
         con.Phone=Phone;
         con.Email=Email;
         con.QuickBook_id__c=Integer.valueOf(id);
         con.From_QuickBook__c=true;
         try{
         insert con;
         }
         catch(Exception ex){
             System.debug('Exception '+ex.getMessage());
         }
       
	}
 public class CustomerRequest{
	public String FullyQualifiedName;	//King Groceries
	public cls_PrimaryEmailAddr PrimaryEmailAddr;
	public String DisplayName;	//King's Groceries
	public String Suffix;	//Jr
	public String Title;	//Mr
	public String MiddleName;	//B
	public String Notes;	//Here are other details.
	public String FamilyName;	//King
	public cls_PrimaryPhone PrimaryPhone;
	public String CompanyName;	//King Groceries
	public cls_BillAddr BillAddr;
	public String GivenName;//James
   }
	public class cls_PrimaryEmailAddr {
		public String Address;	//jdrew@myemail.com
	}
	public class cls_PrimaryPhone {
		public String FreeFormNumber;	//(555) 555-5555
	}
	public class cls_BillAddr {
		public String CountrySubDivisionCode;	//CA
		public String City;	//Mountain View
		public String PostalCode;	//94042
		public String Line1;	//123 Main Street
		public String Country;	//USA
	}
    
    
}