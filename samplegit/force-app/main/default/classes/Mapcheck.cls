public class Mapcheck {
    public static void check(){
        List<Account> accLst=[Select Name,AnnualRevenue from Account limit 10];
        Map<String,Account> mapAcc = new Map<String,Account>();
        integer i=0;
        for(Account a:accLst){
            a.AnnualRevenue=1000+(++i);
            mapAcc.put(a.Name,a);
        }
        for(Account ac:accLst)
        system.debug('annualrevenue'+mapAcc.get(ac.Name).AnnualRevenue);
        

        
    }

}