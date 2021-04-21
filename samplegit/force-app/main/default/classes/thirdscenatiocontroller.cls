public with sharing class thirdscenatiocontroller {
    public Opportunity opp{get;set;}
    public Survey__c survey{get;set;}
    
    public thirdscenatiocontroller(Apexpages.StandardController scon)
    {
        opp=new Opportunity();
        opp=(Opportunity)scon.getRecord();
        survey=new Survey__c();
    }
/*public List<SelectOption> getQuestions()
{
  List<SelectOption> options = new List<SelectOption>();
        
   Schema.DescribeFieldResult fieldResult =
 Survey__c.Question__c.getDescribe();
   List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
   for( Schema.PicklistEntry f : ple)
   {
      options.add(new SelectOption(f.getLabel(), f.getValue()));
   }       
   return options;
}
  */  public PageReference submit()
    {
        opp=[Select Name from Opportunity where id=:opp.id];
        survey.Name=opp.Name;
        insert survey;
        PageReference rp = new apexpages.StandardController(survey).view();
        return rp;
    }
}