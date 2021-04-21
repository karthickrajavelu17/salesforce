@RestResource(urlMapping='/stripe/webhooks/v1/*')
global class WebhookListener{
    @HttpPost
    global static String doPost(){
        RestResponse response = RestContext.response;
        response.addHeader('Content-type','application/json');
        String reqJson= RestContext.request.requestBody.toString(); //Get response from the web hook
        System.debug('Json '+reqJson);
        Account a=new Account(Name='Stripe1234',Phone='123-322-321');
        insert a;
/*      
The Json can be parsed and needed actions can be performed
*/
      return 'Successwithstripe';   
}
}