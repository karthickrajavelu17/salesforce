trigger OppExample on Opportunity (before update) {
    
    for(Opportunity Oldopp :Trigger.old)
    {
        for(Opportunity Newopp :Trigger.new)
        {
            if(Oldopp.Id==Newopp.id && Oldopp.Amount>=Newopp.Amount)
            {
                Newopp.addError('Are you serious,you cannot change amount which is less than old');//Trigger Exception
            }
        }
    }

}