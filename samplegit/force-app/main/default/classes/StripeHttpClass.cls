public class StripeHttpClass {
    @future(callout=true)
    public static void sendStripeRequestFromPersonAccount(String Email,String accountId,String Name) {
        System.debug('Customer Record creation '+Name);
        List<Account> updateaccList = new List<Account>();
        String customerId;
        String invoiceLineIteamId;
        String CUSTOMER_URL = 'https://api.stripe.com/v1/customers';
        String API_KEY = 'sk_test_51HeKSgGKUUT7udTdiH1IzbicbYGpmBb7bxvkNEvW3bCjYMaRhJ9ZgqSSa1K4D3pmvs653rt0dJdQb4553iY3r8tD00w2sRjzom';
        
        HttpRequest req = new HttpRequest(); 
        req.setEndpoint(CUSTOMER_URL); 
        req.setMethod('POST'); 
        Blob headerValue = Blob.valueOf(API_KEY + ':');
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        String sourceTOK = 'tok_visa';
        String description = 'Contact Information';
        
        
        //address[line1], address[city],address[country],address[postal_code],address[state]
        String line1 = 'Test Line';
        //req.setBody('email='+Email+'&description='+description+'&source=tok_visa'+'&name='+Name+'&address[line1]='+line1);
        req.setBody('email='+Email+'&description='+description+'&source=tok_visa'+'&name='+Name);
        System.debug('Request :'+req);
        System.debug('Request Body :'+req.getBody());
        
        
        //req.setBody(template_body); 
        Http http = new Http(); 
        HTTPResponse res; 
        res = http.send(req);                 
        String stripeResponse = res.getBody();
        System.debug('status  : '+res.getStatus());
        System.debug('status  : '+res.getStatusCode());
        System.debug('DocResponse : '+stripeResponse);
      
        StripeWrapper Wrapper =(StripeWrapper) System.JSON.deserialize(res.getBody(), StripeWrapper.class);
        customerId = Wrapper.id;
        System.debug('customerId : '+customerId);
      
        if(customerId != null) {
            List<Account> accList = [SELECT Id,Name from Account WHERE id =:accountId];
            for(Account acc : accList) {
                acc.Stripe_Customer_Id__c = customerId;
                updateaccList.add(acc);
            }
            System.debug('updateConList : '+updateaccList);
            if(updateaccList.size() > 0 && !updateaccList.isEmpty()) {
                System.debug('Data base Updated...');
               // database.Update(updateaccList,false);
               // update updateaccList;
                List<Database.SaveResult> updateResults = database.Update(updateaccList,true);
                

            }

        } 
        
    }
    @future(callout=true)
    public static void sendStripeRequest(String Email,String contactId,String Name) {
        System.debug('Customer Record creation '+Name);
        List<Contact> updateConList = new List<Contact>();
        String customerId;
        String invoiceLineIteamId;
        String CUSTOMER_URL = 'https://api.stripe.com/v1/customers';
        String API_KEY = 'sk_test_51HZH9VL32dgtq9lHToSNBrrhYvHSdJdub1dB1jYBZ8xRphBp8NgZeZsvAosCFTjaPrcaznxmGlHZ0FvtqBGB4DYk00mQgwlWhw';
        
        HttpRequest req = new HttpRequest(); 
        req.setEndpoint(CUSTOMER_URL); 
        req.setMethod('POST'); 
        Blob headerValue = Blob.valueOf(API_KEY + ':');
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        String sourceTOK = 'tok_visa';
        //  String email = 'jhon.elitte@gmail.com';
        String description = 'Contact Information';
        
        
        //address[line1], address[city],address[country],address[postal_code],address[state]
        String line1 = 'Test Line';
     //   req.setBody('email='+Email+'&description='+description+'&source=tok_visa'+'&name='+Name+'&address[line1]='+line1);
        req.setBody('email='+Email+'&description='+description+'&source=tok_visa'+'&name='+Name);
        System.debug('Request :'+req);
        System.debug('Request Body :'+req.getBody());
        
        
        //req.setBody(template_body); 
        Http http = new Http(); 
        HTTPResponse res; 
        res = http.send(req);                 
        String stripeResponse = res.getBody();
        System.debug('status  : '+res.getStatus());
        System.debug('status  : '+res.getStatusCode());
        System.debug('DocResponse : '+stripeResponse);
        
        StripeWrapper Wrapper =(StripeWrapper) System.JSON.deserialize(res.getBody(), StripeWrapper.class);
        customerId = Wrapper.id;
        System.debug('customerId : '+customerId);
        System.debug('contactId : '+contactId);
        if(customerId != null) {
            List<Contact> conList = [SELECT Id,Name from Contact WHERE id =:contactId];
            for(Contact con : conList) {
                con.Stripe_Customer_Id__c = customerId;
                updateConList.add(con);
            }
            System.debug('updateConList : '+updateConList);
            if(updateConList.size() > 0 && !updateConList.isEmpty()) {
                database.Update(updateConList,false);
            }
        }
        
    }
    
    
    //@future(callout=true)
    public static void sendStripeRequestForProduct(String stripeCustomerId, Decimal unitPrice, Decimal Quantity, String ProductName) {
        /**
String productId;
String CUSTOMER_URL = 'https://api.stripe.com/v1/products';
String API_KEY = 'sk_test_51HZH9VL32dgtq9lHToSNBrrhYvHSdJdub1dB1jYBZ8xRphBp8NgZeZsvAosCFTjaPrcaznxmGlHZ0FvtqBGB4DYk00mQgwlWhw';

HttpRequest req = new HttpRequest(); 
req.setEndpoint(CUSTOMER_URL); 
req.setMethod('POST'); 
Blob headerValue = Blob.valueOf(API_KEY + ':');
String authorizationHeader = 'BASIC ' +
EncodingUtil.base64Encode(headerValue);
req.setHeader('Authorization', authorizationHeader);

String sourceTOK = 'tok_visa';
String currencyValue = 'INR';
String customerId = 'cus_IBs59vrg68ka1X';
String amount = '500';
System.debug('Product Name :'+ProductName);
req.setBody('name='+ProductName);


Http http = new Http(); 
HTTPResponse res; 
res = http.send(req);                 
String prodResponse = res.getBody();
System.debug('prodResponse : '+prodResponse);
StripeWrapper Wrapper =(StripeWrapper) System.JSON.deserialize(res.getBody(), StripeWrapper.class);
productId = Wrapper.id;
System.debug('Product Id:'+productId);

if(res.getStatusCode() == 200){ 
sendStripeRequestForPrice(productId, unitPrice, Quantity,stripeCustomerId);
}
**/
        
  //      Stripe_Product_Data__c prodData = Stripe_Product_Data__c.getValues(ProductName);
   //     sendStripeRequestForPrice(prodData.Stripe_ProductId__c, unitPrice, Quantity,stripeCustomerId);
        
    }
    @future(callout=true)
    public static void sendStripeRequestForPrice( String productId, Decimal unitPrice,Decimal Quantity, String stripeCustomerId) {
        System.debug('Enter in Price Creation for Product..:');
        String priceId;
        String CUSTOMER_URL = 'https://api.stripe.com/v1/prices';
        String API_KEY = 'sk_test_51HZH9VL32dgtq9lHToSNBrrhYvHSdJdub1dB1jYBZ8xRphBp8NgZeZsvAosCFTjaPrcaznxmGlHZ0FvtqBGB4DYk00mQgwlWhw';
        
        HttpRequest req = new HttpRequest(); 
        req.setEndpoint(CUSTOMER_URL); 
        req.setMethod('POST'); 
        Blob headerValue = Blob.valueOf(API_KEY + ':');
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        String sourceTOK = 'tok_visa';
        String currencyValue = 'USD';
        String customerId = 'cus_IBs59vrg68ka1X';
        String amount = '500';
        System.debug('Unit Price :'+unitPrice);
        System.debug('Unit Price Converted..:'+Integer.valueOf(unitPrice));
        Integer priceCal = Integer.valueOf(unitPrice) * 100;
        req.setBody('&currency='+currencyValue+'&unit_amount='+priceCal +'&product='+productId);
        
        Http http = new Http(); 
        HTTPResponse res; 
        res = http.send(req);                 
        String priceResponse = res.getBody();
        System.debug('priceResponse : '+priceResponse);
        StripeWrapper Wrapper =(StripeWrapper) System.JSON.deserialize(res.getBody(), StripeWrapper.class);
        priceId = Wrapper.id;
        System.debug('Price Id :'+priceId);
        if(res.getStatusCode() == 200){ 
            sendStripeRequestForInvoiceLineIteam(priceId,stripeCustomerId,Quantity);
        }
    }
    
    
    
    public static void sendStripeRequestForInvoiceLineIteam(String priceId, String stripeCustomerId,Decimal Quantity) {
        System.debug('Enter into the Invoice Line Iteam..');
        String CUSTOMER_URL = 'https://api.stripe.com//v1/invoiceitems';
        String API_KEY = 'sk_test_51HZH9VL32dgtq9lHToSNBrrhYvHSdJdub1dB1jYBZ8xRphBp8NgZeZsvAosCFTjaPrcaznxmGlHZ0FvtqBGB4DYk00mQgwlWhw';
        
        HttpRequest req = new HttpRequest(); 
        req.setEndpoint(CUSTOMER_URL); 
        req.setMethod('POST'); 
        Blob headerValue = Blob.valueOf(API_KEY + ':');
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        String currencyValue = 'INR';
        req.setBody('customer='+stripeCustomerId+'&price='+priceId+'&quantity='+Integer.valueof(quantity));
        
        //req.setBody(template_body); 
        Http http = new Http(); 
        HTTPResponse res; 
        res = http.send(req);                 
        String invoiceResponse = res.getBody();
        System.debug('status  : '+res.getStatus());
        System.debug('status  : '+res.getStatusCode());
        System.debug('invoiceResponse : '+invoiceResponse);
        if(res.getStatusCode() == 200){
            sendStripeRequestForInvoice(stripeCustomerId);
        }
        
    }
    public static void sendStripeRequestForInvoice(String customerId) {
        System.debug('Enter into the Invoice...');
        String CUSTOMER_URL = 'https://api.stripe.com/v1/invoices';
        String API_KEY = 'sk_test_51HZH9VL32dgtq9lHToSNBrrhYvHSdJdub1dB1jYBZ8xRphBp8NgZeZsvAosCFTjaPrcaznxmGlHZ0FvtqBGB4DYk00mQgwlWhw';
        
        HttpRequest req = new HttpRequest(); 
        req.setEndpoint(CUSTOMER_URL); 
        req.setMethod('POST'); 
        Blob headerValue = Blob.valueOf(API_KEY + ':');
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        String sourceTOK = 'tok_visa';
        String currencyValue = 'INR';
        req.setBody('customer='+customerId);
        
        Http http = new Http(); 
        HTTPResponse res; 
        res = http.send(req);                 
        String invoice = res.getBody();
        System.debug('invoice status  : '+res.getStatus());
        System.debug('invoice status Code  : '+res.getStatusCode());
        System.debug('invoice Response : '+invoice);
        
        
    }
    public class StripeWrapper {
        public String id {get; set;}
        public String status {get; set;}
    }
}