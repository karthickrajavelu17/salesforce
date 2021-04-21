@RestResource(urlMapping='/showDetails/*')
global class RestApi {
    
 @HttpGet
    global static list<Account> getAccount()
    {
        List<Account> lst;
        try
        {
            lst=[SELECT name,Phone FROM Account LIMIT 5];
        }
        catch(Exception ex)
        {
            System.debug('DML ERROR'+ex.getMessage());
        }
        return lst;
    }

}