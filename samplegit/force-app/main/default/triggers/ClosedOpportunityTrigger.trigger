trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    List<Task> listTask = new List<Task>();
    
    for(Opportunity o : trigger.new)
    {
        if(o.StageName.equals('Closed Won'))
        {
        Task t = new Task(Subject='Follow Up Test Task' ,WhatId = o.Id);
        listTask.add(t);
        }
    }
 insert listTask;
}