@isTest
global class ParkServiceMock implements WebServiceMock
{
    global void doInvoke(

           Object stub,

           Object request,

           Map<String, Object> response,

           String endpoint,

           String soapAction,

           String requestName,
           String responseNS,

           String responseName,

           String responseType) 
    {
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        List<String> mystr = new List<String>{'park1','park2','park23'};
        response_x.return_x =mystr;
        response.put('response_x',response_x);
        
    }
    
}