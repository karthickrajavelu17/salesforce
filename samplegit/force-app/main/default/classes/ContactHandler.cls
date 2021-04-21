public class ContactHandler {
    
    public static void HandlerMethod(List<Contact> cList,Map<Id,Contact> mapcList)
    {
        Map<Id,Contact> mapContact = new Map<Id,Contact>();
        List<Account> aList = new  List<Account>();
        for(Contact c:cList)
        {
            if(c.Primary__c == true && c.MailingCity != mapcList.get(c.id).MailingCity)
                mapContact.put(c.AccountId,c);
        }
        if(mapContact.size() > 0)
        {
            aList=[Select id,BillingCity From Account Where id IN :mapContact.keyset()];
        }
        if(aList.size() > 0)
        {
            for(Account a:aList)
            {
                a.BillingCity=mapContact.get(a.id).MailingCity;
                
            }
            update aList;
        }
    }
    
public static void Handlermethod2(List<Contact> cList)
    {
      Set <String> emailSet = new Set<String>(); 
     Set <String> phoneSet = new Set<String>(); 

    for (contact con:cList)
      {
      emailSet.add(con.email);
      phoneSet.add(con.phone);
      }

List <Contact> contactList = new List<Contact>();

contactlist = [SELECT email,phone FROM Contact WHERE email IN :emailSet OR phone IN :phoneSet];

  for (contact con:cList) 
    {
     If (contactList.size() > 0)
      {
       con.email.adderror( 'Duplicate Contact Found. Use Existing Contact.' );
       con.Phone.adderror('Duplicate Contact Found. Use Existing Contact.');
      }
    }
    
  }
    


}