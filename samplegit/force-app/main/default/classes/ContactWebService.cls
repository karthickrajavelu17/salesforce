@RestResource(urlMapping='/Contact')
global class ContactWebService {

    @HttpGet
    global static List<Contact> doGet(){
        //RestRequest req=RestContext.request;
       // RestResponse res=RestContext.response;
        //String contactid=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
        //system.debug('Contactid='+contactid);
        List<Contact> con=[select LastName,Email from Contact];
        System.Debug('Inside the doget class');
        return con;
    }
}