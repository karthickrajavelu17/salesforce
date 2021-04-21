public class d2 {
    
        
    
    Public account account{get;set;}
    Public d2(){
        account =new Account();
    
    }
        
        public PageReference save() {
            insert account;
            PageReference rp = new apexpages.StandardController(account).view();
            return rp;
        }
    
    }