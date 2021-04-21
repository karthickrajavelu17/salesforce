public with sharing class TestPopup {

    public Boolean displayPopup {get;set;}
    public Contact con{get;set;}
    public TestPopup(ApexPages.StandardController controller) {
     con=[Select id from Contact where id=:controller.getId()];
    }
    
    public void showPopup()
    {
        
    displayPopup = true;

    
    }
    
    public void closePopup() {
        displayPopup = false;
        
    }
    
    public PageReference redirectPopup()
    {
    displayPopup = false;
        //Please uncomment below 3 statements and replace YourObjectId
       PageReference p=new Pagereference('/'+con.id);
       p.setRedirect(true);
       return p;
        
    }
    


}