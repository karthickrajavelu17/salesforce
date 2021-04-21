public class CurrencyConvertor {
    
     @AuraEnabled
    public static decimal EurotoCur(decimal eur)
    {
        Decimal inr=0.0;
        HTTP h = new HTTP();
        HTTPRequest req=new HTTPRequest();
        req.setEndpoint('https://api.exchangeratesapi.io/latest');
        req.setMethod('GET');
        HTTPResponse res=h.send(req);
        Map<String,Object> jsonbody=(Map<String,Object>)json.deserializeUntyped(res.getBody());
        System.debug(jsonbody);
        Map<String,Object> mMap = (Map<String,Object>)jsonbody.get('rates');
        Decimal conversion = (Decimal)mMap.get('INR');
        inr=Eur*conversion;
        return inr;
    }

}