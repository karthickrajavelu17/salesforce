public class accountfiltercon {
    Public string selectedname{get;set;}
    
    
    public Survey__c survey {get;set;}
    
    public accountfiltercon(ApexPages.StandardController controller)
    {
        
    }
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            List<Account> acclist =[SELECT id,name,phone,type,industry FROM Account limit 5];
            integer i=1;
            for(Account acc :acclist){
            lstnamesel.add(new selectoption(acc.id,'Question '+i));
            i++;
            }
            return lstnamesel; 
        }
}