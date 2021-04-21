trigger UpdateOwner on Account (after insert,after update) {
    
    if(Trigger.isInsert)
    {
     for(Account a:Trigger.new)
      {
        
        User u=[SELECT id,Name,LastLoginDate,DelegatedApproverId From User Where id=:a.OwnerId ] ;
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
         
      }
    }

    
    if(Trigger.isInsert)
    {
        if(Trigger.isUpdate)
        {
     for(Account a:Trigger.new)
      {
        
        User u=[SELECT id,Name,LastLoginDate,DelegatedApproverId From User Where id=:a.OwnerId ] ;
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
        
      }
    }
    }
}