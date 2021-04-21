public with sharing class searchOption {
     public String name { get; set;}
    public list<Contact> myconct { get; set; }
    public boolean searched{get;set;}
    public searchOption() {
    searched=false;
    string namestr=ApexPages.currentPage().getParameters().get('name');
    if(null!=namestr) {
    name=namestr;
    //executeSearch();
    }
    }
    public PageReference executeSearch() {
      searched=true;
    System.debug('name' +name);
    string searchstr=('%'+name+'%');
    System.debug(searchstr);
   // accounts= new List<Account>();
    myconct=[select id,Name from Contact where name Like:searchstr limit 20];
    System.debug(myconct);
        return null;
    }


   
}