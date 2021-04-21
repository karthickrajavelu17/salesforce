public class SearchYoutube {

    public string body{set;get;}
    public string searchText{set;get;}
    public void search()
    {
        Http http =new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://youtube.googleapis.com/youtube/v3/search?part=Snippet&q=salesforce&key=AIzaSyD4A3TE7G2N71Pgshx9POpMvEcK-848_lo');
        req.setMethod('GET');
        req.setHeader('content-type','application/json');
        HttpResponse res=http.send(req);
        body=res.getBody();
        
    }

}