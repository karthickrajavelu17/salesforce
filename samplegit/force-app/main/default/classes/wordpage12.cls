public with sharing class wordpage12 {
   
    public list<OpportunityLineItem> myopp { get; set; }
    
    public wordpage12(ApexPages.StandardController std) {
    
    Id id=ApexPages.currentPage().getParameters().get('id');
    myopp=[select id,Name,Quantity from OpportunityLineItem where OpportunityId=:id];
    }

    


   
}