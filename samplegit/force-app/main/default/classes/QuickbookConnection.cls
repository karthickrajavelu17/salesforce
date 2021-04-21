public class QuickbookConnection{
    // Replase with your Client Id
    public static String client_Id = 'ABggN1QnZ3I60yL6DsMZVB76HA216WC54ujl15D2WC1I7wgv77';
    // Replase with your Client Secret
    public static String consumer_Secret = 'y742gJRexitxhOtxRzTarQFHVpksMAsdGqZYACmg';
    // Replace with Your Redirect URI
    public static String redirect_URI = 'https://mydomain-dev-hub-dev-ed.my.salesforce.com/apex/QuickbookConnection';
    
    /*
     * @Name - doAuthorizationQuickBooks
     * @Param - None
     * @Description - to get the authentication code from the QuickBooks Account
     * @ReturnType - PageReference
    */
    
    public static PageReference doAuthorizationQuickBooks(){
    
        String authorization_endpoint = 'https://appcenter.intuit.com/connect/oauth2';
        
        String scope = 'com.intuit.quickbooks.accounting';
        
        String final_EndPoint = authorization_endpoint+'?client_id='+client_Id+'&response_type=code&scope='+
                                    scope+'&state=123445633443&redirect_uri='+redirect_URI;
        
        PageReference pageRef = new PageReference(final_EndPoint);
      //  System.debug('Code=='+ ApexPages.currentPage().getParameters().get('code'));
        return pageRef;
    }
    /*
     * @Name - doFetchAccessToken
     * @Param - None
     * @Description - to get the Access Token , Refresh Token and other Information after getting the authentication code
     * @ReturnType - void
    */
    public static void doFetchAccessToken(){
    
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(client_Id+':'+consumer_Secret));
        String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        
        String oAuthCode = ApexPages.currentPage().getParameters().get('code');
        String requestBody = 'grant_type=authorization_code&code='+oAuthCode+'&redirect_uri='+redirect_URI;
        String errorMessage ='';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        
        try{
            httpRes = http.send(httpReq);
            
            if(httpRes.getStatusCode() == 200){
                Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                List<QuickBook_Info__c> connectSettingInfos = new List<QuickBook_Info__c>();
                connectSettingInfos = [Select Id, Name,Expires_In_Seconds__c From QuickBook_Info__c 
                                        Where Name ='QuickBooks Setting Info'];
                QuickBook_Info__c quickBooksSettingInfo = new QuickBook_Info__c();
                
                String Name = 'QuickBooks Setting Info';
                String accessToken = (String)response_Map.get('access_token');
                String refreshToken = (String)response_Map.get('refresh_token');
                Decimal expiresIn = (Decimal)response_Map.get('expires_in');
                Decimal expiresInRefToken = (Decimal)response_Map.get('x_refresh_token_expires_in');
                
                
                quickBooksSettingInfo.Name = Name;
                quickBooksSettingInfo.Access_Token__c = accessToken;
                quickBooksSettingInfo.Refresh_Token__c = refreshToken;
                quickBooksSettingInfo.Expires_In_Seconds__c = expiresIn;
                quickBooksSettingInfo.Refresh_Token_Expires_In__c = expiresInRefToken;
                quickBooksSettingInfo.Expires_In_Time__c = System.Now().addSeconds(Integer.valueOf(expiresIn));
                if(connectSettingInfos!=null && connectSettingInfos.size() > 0 ) quickBooksSettingInfo.Id = connectSettingInfos[0].Id;
                
                upsert quickBooksSettingInfo;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Successfully Authenticated with Quickbooks System!!!'));
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Unexpected Error while communicating with Quickbooks API'+
                                         'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode()));
            }
           
        }catch(System.Exception e){
            System.debug('#### Exception Executed '+e.getStackTraceString());
             if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                    errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                        +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                    //return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with Quickbooks API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }
        }  
    }
    /*
     * @Name - doRefreshAccessToken
     * @Param - None
     * @Description - to get the Refresh Token and other Information after access token expires
     * @ReturnType - void
    */
    @future(callout=true)
    public static void doRefreshAccessToken(){
        System.debug('MEthod Refresh token called');
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(client_Id+':'+consumer_Secret));
        String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        
        List<QuickBook_Info__c> QBInfo = new List<QuickBook_Info__c>();
                QBInfo = [Select Id, Name,Expires_In_Time__c, Refresh_Token__c,
                                        Refresh_Token_Expires_In__c,Code__c  From QuickBook_Info__c 
                                        Where Name ='QuickBooks Setting Info'];
        
     //   String oAuthCode = ApexPages.currentPage().getParameters().get('code');
        String oAuthCode=QBInfo[0].Code__c;
        String requestBody = 'grant_type=refresh_token&refresh_token=';
        if(QBInfo!=null && QBInfo[0].Refresh_Token__c != null){
            requestBody+= QBInfo[0].Refresh_Token__c;
        }else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Refresh Token is NULL'));
        }
        String errorMessage ='';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        
        try{
            // Check if Access Token is expired or not.
            // if Expired then get the new Token
            if(QBInfo != null){
                httpRes = http.send(httpReq);
                System.debug('Res-'+httpRes.getBody());
                System.debug('Response-'+httpRes.getStatusCode());
                System.debug('Ress-'+httpRes.getStatus());   
                System.debug('Body='+httpRes.getBody());
                if(httpRes.getStatusCode() == 200){
                    Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                    // Assign the Value to the Existing Quickbooks info Object and at the last update the information
                    // with new values
                   
                List<QuickBook_Info__c> connectSettingInfos = new List<QuickBook_Info__c>();
                connectSettingInfos = [Select Id, Name,Expires_In_Seconds__c From QuickBook_Info__c 
                                        Where Name ='QuickBooks Setting Info'];
                QuickBook_Info__c quickBooksSettingInfo = new QuickBook_Info__c();
                
                String Name = 'QuickBooks Setting Info';
                String accessToken = (String)response_Map.get('access_token');
                String refreshToken = (String)response_Map.get('refresh_token');
                Decimal expiresInRefToken = (Decimal)response_Map.get('x_refresh_token_expires_in');
                
                
                quickBooksSettingInfo.Name = Name;
                quickBooksSettingInfo.Access_Token__c = accessToken;
                quickBooksSettingInfo.Refresh_Token__c = refreshToken;
    
                quickBooksSettingInfo.Refresh_Token_Expires_In__c = expiresInRefToken;
                if(connectSettingInfos!=null && connectSettingInfos.size() > 0 ) quickBooksSettingInfo.Id = connectSettingInfos[0].Id;
                
                upsert quickBooksSettingInfo;

                    System.debug('responce'+response_Map);
                }else{
                 //   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Unexpected Error while communicating with Quickbooks API'+
                   //                          'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode()));
                }
            }
            
        }catch(System.Exception e){
            System.debug('#### Exception Executed '+e.getStackTraceString());
            System.debug('Exception-'+e.getMessage());
            System.debug('Exception-'+e.getCause());
           /*  if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                    errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                        +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                    //return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with Quickbooks API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }*/
        }  
    }
}