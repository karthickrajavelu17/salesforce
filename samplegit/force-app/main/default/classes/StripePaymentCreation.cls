@RestResource(urlMapping='/stripe')
global class StripePaymentCreation {
    @HttpPost
    global static void doPost() {
        System.debug('Payment do post method..');
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.statusCode = 200;
        String jsonBody = req.requestBody.toString();
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(jsonBody); 
        Map<String, Object> mainResults = (Map<String, Object>)(results.get('data'));
        Map<String, Object> m = (Map<String, Object>)(mainResults.get('object'));
        System.debug('M Data :'+m);
        String customer = String.ValueOf(m.get('customer'));
        String amount =  String.ValueOf(m.get('amount'));
        String curr = String.ValueOf(m.get('currency'));
        
        System.debug('Customer :'+customer);
        
        System.debug('amount :'+amount);
        
        
    }
    
}