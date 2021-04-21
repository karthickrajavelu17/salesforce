public class wordpage1 {
    
private final opportunity opp;    
   public wordpage1(ApexPages.StandardController controller) {
       this.opp=(Opportunity)controller.getRecord();
        
    }
  public pagereference survey()
  {
      PageReference rp = new PageReference('/apex/wordpage2?id='+opp.id);
      
      return rp;
  }

}