public class Boxapicontroller {
    
    Public String response {set;get;}
    Public String folder_item{set;get;}
    
    public pagereference authorize()
    {
        return new pagereference('https://account.box.com/api/oauth2/authorize?client_id=4adokamq6gmqi48s0ue52kt08fjlqeoe&response_type=code');
    }
    
    public void getAccessToken()
    {
        String code=apexpages.currentPage().getParameters().get('Code');
        Http http =new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://api.box.com/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Accept','application/json');
        req.setBody('grant_type=authorization_code&code='+code+'&client_id=4adokamq6gmqi48s0ue52kt08fjlqeoe&client_secret=Hi6adHOJIYQsERFEGU194nOcmVfsK4fU');
        HttpResponse res;
        res=http.send(req);
        response=res.getBody();
        BoxAccessToken boxToken=(BoxAccessToken)JSON.deserialize(response,BoxAccessToken.class);
        String access_token=boxToken.access_token;
        folder_item=fetchFolderItem(access_token);
    }
    public String fetchFolderItem(String access_token){
        Http http =new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders/126884643847/items/');
        req.setMethod('GET');
        req.setHeader('Accept','application/json');
        req.setHeader('Authorization','Bearer '+access_token);
        HttpResponse res;
        res=http.send(req);
        return res.getBody();
 	}
    public class BoxAccessToken {
        public String access_token;	//BDCVxCJl1dkjVHKdJgMBYUFefpasnoBi
        public Integer expires_in;	//4285
        public cls_restricted_to[] restricted_to;
        public String refresh_token;	//D1mI2kQcCzNi4GLEjl0FxLHs5KjbLak2db20ofU0dpAiYWoUwvef3QBd2dkMhlIl
        public String token_type;	//bearer


   }
   public class cls_restricted_to {
   }

}