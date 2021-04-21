public class Apiclass {
    public void execute()
    {
        System.debug('Method called');
        //step 1: set up the http 
        Http http=new Http();
        //setp 2 : form the http request
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://mydomain-dev-hub-dev-ed.my.salesforce.com/services/data/v49.0/sobjects/Account');
        req.setMethod('POST');
        req.setHeader('Authorization','OAuth '+userinfo.getSessionId());
        req.setHeader('Content-Type','application/json');
        req.setBody('{"Name":"Salesforce Casts"}');
        //step 3: send request and receive the responses
        try
        {
        HttpResponse res=http.send(req);
            System.debug('Response'+res.getBody());
            System.debug('StausCode'+res.getStatusCode());
        }
        Catch(Exception e)
        {
            System.debug('Exception occur'+e.getMessage());
        } 
    }

}