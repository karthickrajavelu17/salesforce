@isTest
public class LeadProcessorTest {
    @isTest
    public static void testit()
    {
        List<Lead> li = new List<Lead>();
        for(integer i=0;i<100;i++)
        {
            Lead l = new Lead();
            l.LastName='Name'+i;
            l.Company ='Company';
            l.Status='Random Status';
            li.add(l);
        }
      insert li;
    
    Test.startTest();
    LeadProcessor lp=new LeadProcessor();
    id batchid = Database.executeBatch(lp);
   Test.stopTest();
    }
}