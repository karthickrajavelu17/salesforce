public class DocuSign { 

public String sendEnvelope(String email, String name){ 
    
String accountID='48b4b1bf-013f-415b-****-8e417aae80ea'; 
String userName ='36b6a456-e45f-40b3-****-b14cf095c340'; 
String passWord = '*********'; 
String integratorKey = 'TEST-363e8b0f-8f77-****-b8cf-f5da73a7d73e'; 
String templateID = 'E61E5EEC-916E-4634-9F6A-75C71D36038B'; 
String endPoint = 'https://demo.docusign.net/restapi/v2/accounts/'+accountID+'/envelopes'; 
HttpRequest req = new HttpRequest(); 
req.setEndpoint(endPoint); 
req.setMethod('POST'); 
String authorizationHeader = '<DocuSignCredentials><Username>'+userName+'</Username><Password>'+Password+'</Password><IntegratorKey>'+integratorKey+'</IntegratorKey></DocuSignCredentials>'; 
req.setHeader('X-DocuSign-Authentication', authorizationHeader); 
req.setHeader('Accept','application/json'); 
req.setHeader('Content-Length','162100'); 
req.setHeader('Content-Type','application/json'); 
req.setHeader('Content-Disposition','form-data'); 
 String json='{'+' '+' "emailSubject": "Agreement",'+' "emailBlurb": "MSTSolutions is sending you this request for your electronic signature and enter or update confidential payment information.\n\nPlease review and electronically sign by following the link below. ",'+ ' "templateId": "'+templateID+'",'+ 
' "envelopeIdStamping": "false",'+' "templateRoles": ['+'  {'+'    "roleName": "Signer 1",'+ '    "name": "'+name+'",'+ 
'    "email": "'+email+'",'+'    "recipientId": "1"'+ 
'   }'+ ' ],'+ ' "status": "sent"'+ '}'; 

req.setBody(json); 
Http http = new Http(); 
HTTPResponse res; 
try{ 
res = http.send(req); 
//system.debug('DocuSign Response'+res.getBody());                      
} 
catch(Exception e){ 
ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, e.getMessage())); 
} 
WrapperDocuSign wrapInst = WrapperDocuSign.parse(res.getBody()); 
Return wrapInst.status; 
  } 
}