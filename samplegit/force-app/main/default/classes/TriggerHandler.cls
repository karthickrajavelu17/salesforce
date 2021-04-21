public class TriggerHandler {
    
    public static void updateaddress(List<Account> acclist,Map<Id,Account> maplist)
    {
        Map<Id,Account> mapAccount = new Map<Id,Account>();
        List<Contact> conlist = new List<Contact>();
        for(Account acc:acclist)
        {
            if(acc.BillingStreet!=maplist.get(acc.id).BillingStreet || acc.BillingCity != maplist.get(acc.id).BillingCity)
            {
                   mapAccount.put(acc.id,acc);
            }

        }
        
        if(mapAccount.size() >0)
        {
            conlist=[Select MailingStreet,MailingCity,AccountId from Contact Where AccountId IN :maplist.keyset()];
        }
        
        if(conlist.size()> 0)
        {
            for(Contact c:conlist)
            {
                c.MailingStreet=mapAccount.get(c.AccountId).BillingStreet;
                c.MailingCity =mapAccount.get(c.AccountId).BillingCity;
            }
           update conlist;
        }
        
    }
    
    public static void updateaddress1(List<Account> acclist,Map<Id,Account> maplist)
    {
        Map<Id,Account> mapAccount = new Map<Id,Account>();
        List<Opportunity> opplist = new List<Opportunity>();
        List<Estimate__c> estlist = new List<Estimate__c>();
        for(Account acc:acclist)
        {
            if(acc.BillingAddress !=maplist.get(acc.id).BillingAddress)
            {
                   mapAccount.put(acc.id,acc);
            }

        }
        if(mapAccount.size() > 0)
        {
            opplist=[SELECT AccountId,BillingAddress__c from Opportunity WHERE AccountId IN:maplist.keyset()];
            estlist=[SELECT AccountId__c,BillingAddress__c from Estimate__c WHERE AccountId__c IN:maplist.keyset()];
        }
        if(opplist.size()>0)
        {
            for(Opportunity opp :opplist)
            {
               Opp.BillingAddress__c=maplist.get(opp.AccountId).BillingStreet +' '+maplist.get(opp.AccountId).BillingCity+ +' '+maplist.get(opp.AccountId).BillingState +' '+maplist.get(opp.AccountId).BillingCountry; 
            }
            update opplist;
        }
        if(estlist.size()>0)
        {
            for(Estimate__c est : estlist)
            {
                est.BillingAddress__c=maplist.get(est.AccountId__c).BillingStreet+' '+maplist.get(est.AccountId__c).BillingCity+ +' '+maplist.get(est.AccountId__c).BillingState +' '+maplist.get(est.AccountId__c).BillingCountry;
            }
            update estlist;
        }
        
    }
    
    public static void updateaddress2(List<Account> acclist,Map<Id,Account> maplist)
    {
          Map<Id,Account> mapAccount = new Map<Id,Account>();
          List<Customer_Book__c> cblist=[Select Account__c from Customer_Book__c Where Account__c IN :maplist.keyset()];
          List<Opportunity> opplist=[SELECT AccountId,BillingAddress__c from Opportunity WHERE AccountId IN:maplist.keyset()];
          List<Estimate__c> estlist=[SELECT AccountId__c,BillingAddress__c from Estimate__c WHERE AccountId__c IN:maplist.keyset()];
        
        
    }
    
   public static void HandlerMethod3(Map<Id,Account> mapAcc)
    {
        List<Contact> con = New List<Contact>();
        List<Contact> cList=[select id ,Phone,AccountId from Contact Where AccountId IN :mapAcc.keyset()];
        
        for(Contact c :cList)
        {
            c.Phone = mapAcc.get(c.AccountId).Phone;
            con.add(c);
        }
        
        update con;
    }
    
 public static void HandlerMethod4(List<Account> acList,Map<Id,Account> mapList)
    {
        List<Account> accList =new List<Account>();
        Set<id> setOwner =new Set<id>();
        for(Account a:acList)
        {
          setOwner.add(a.OwnerId);
        }
        
        Map<id,User> mapowner =new Map<id,User>([Select Name,LastLoginDate,DelegatedApproverId From User Where id IN :setOwner]);
        
        for(Account a:acList)
        {
            User u=mapowner.get(a.OwnerId);
                        if(u.LastLoginDate<=(Date.today()-90))
                           {
                               a.Type='Former Client';
                           }
                          else if(u.LastLoginDate<=(Date.today()-180))
                           {
                             if(u.DelegatedApproverId!=null)
                                 a.OwnerId=u.DelegatedApproverId;
                             else
                                a.Type='Deactivated';
                           }
            accList.add(a);
        }
        
      update accList;  
        
        
      /* List<Account> acc =[Select OwnerId,id,Name from Account where id IN :maplist.keyset()]; 
       Map<id,Account> mapowner = new Map<id,Account>();
       List<Account> aa =new List<Account>();
       for(Account a:acc)
       {
           mapowner.put(a.OwnerId,a);
       }
        
        if(mapowner.size() > 0)
        {
            List<User> uList =[Select id,Name,LastLoginDate,DelegatedApproverId From User Where id IN :mapowner.keyset()];
        
        
        if(uList.size() > 0)
        {
            for(User u:uList)
            {
                          if(u.LastLoginDate<=(Date.today()-90))
                           {
                               mapowner.get(u.id).Type='Former Client';
                               aa.add(mapowner.get(u.id));

                           }
                          else if(u.LastLoginDate<=(Date.today()-180))
                           {
                            if(u.DelegatedApproverId!=null)
                              mapowner.get(u.id).OwnerId=u.DelegatedApproverId;
                            else
                              mapowner.get(u.id).Type='Deactivated';
                               
                             aa.add(mapowner.get(u.id));

                           }
                
                
            }
         update aa;
        }
            
       }
        
        */
    }
    
    public static void HandlerMethod5(List<Account> aList)
    {
       Set<Id> setOwner = new Set<Id>();
       For(Account a : aList) 
       {
           setOwner.add(a.OwnerId);
       }
        
       Map<id,User> mapsales =new Map<id,User>([select name from user where id IN:setOwner]);
        for(Account ac : aList)
        {
            user u =mapsales.get(ac.OwnerId);
            ac.Sales_Rep__c=u.Name;
            
        }
       
      
    }
    
  public static void HandlerMethod6(List<Account> aList)
  {
      Set<id> Owner =new Set<id>();
      String email;
      for(Account a:aList)
      {
          Owner.add(a.OwnerId);
      }
      Map<id,User> mapuser = new Map<id,User>([select Name,Email,City,Country,PostalCode,State,Street from User Where Id IN :Owner]);
      for(Account a:aList)
      {
          User u=mapuser.get(a.OwnerId);
          email=u.Email;
  
          a.BillingCity=u.City;
          a.BillingCountry=u.Country;
          a.BillingPostalCode=u.PostalCode;
          a.BillingState=u.State;
          a.BillingStreet=u.Street;
          
          if(a.Name != email.substringBefore('@'))
          a.Email__c=u.Email;
         
      }
      
  }

}