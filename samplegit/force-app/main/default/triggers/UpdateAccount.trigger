trigger UpdateAccount on Contact (after insert,after update) {
    
    if(Trigger.isInsert)
    {
        try
        {
            for(Contact c : Trigger.new)
            {
                Account a =[SELECT Id from Account Where id=:c.id];
                List<Contact> lscon =[Select id,Primary__c from Contact Where id=:a.id];
                Integer count=0;
               for(Contact con :lscon)
                {
                    if(con.Primary__c == true)
                        count++;
                }
              for(Contact conn :lscon)  
               {
                if(conn.Primary__c == true && count==1)
                   {
                 
                     a.ShippingCity=conn.City__c;
                   }
                }    
               
            }
            
            
        }
        Catch(Exception e)
        {
            System.debug('Error'+e.getMessage());
        }
       
        
    }

     if(Trigger.isInsert)
     {
        if(Trigger.isUpdate)
        {
        try
        {
            for(Contact c : Trigger.new)
            {
                Account a =[SELECT Id from Account Where id=:c.id];
                List<Contact> lscon =[Select id,Primary__c from Contact Where id=:a.id];
                Integer count=0;
               for(Contact con :lscon)
                {
                    if(con.Primary__c == true)
                        count++;
                }
              for(Contact conn :lscon)  
               {
                if(conn.Primary__c == true && count==1)
                   {
                 
                     a.ShippingCity=conn.City__c;
                   }
                }    
               
            }
            
            
        }
        Catch(Exception e)
        {
            System.debug('Error'+e.getMessage());
        }
       
        
     }
    }
}