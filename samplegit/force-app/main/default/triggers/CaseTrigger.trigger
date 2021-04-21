trigger CaseTrigger on Case (after undelete) {
    
    if( trigger.isundelete){

      list<Case> casesUnDeleted = new list<Case>();
      casesUnDeleted = [SELECT id,After_Undelete__c FROM Case WHERE Id IN :trigger.newmap.keyset()];
  
      for(Case c :casesUnDeleted) {
        c.After_Undelete__c = true;
      }

      update casesUnDeleted;

    }
    

}