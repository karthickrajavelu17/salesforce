@isTest  
 private class DailyLeadProcessorTest{  
 //  @testSetup  
//   static void setup(){  
 //    List<Lead> listOfLead = new List<Lead>();  
  //   for(Integer i = 1; i <= 200; i++){  
//       Lead ld = new Lead(Company = 'Comp'+ i ,LastName = 'LN'+i, Status = 'Working - Contacted');  
 //      listOfLead.add(ld);  
 //    }  
//     insert listOfLead;  
 //  }  
   static testmethod void testDailyLeadProcessorScheduledJob(){  
     String sch = '0 43 13 * * ?';  
     DailyLeadProcessor dlp = new DailyLeadProcessor();
     List<Lead> listOfLead = new List<Lead>();  
     for(Integer i = 0; i < 200; i++){  
       Lead ld = new Lead(Company = 'Comp1'+ i ,LastName = 'LN1'+i, Status = 'Working - Contacted');  
       listOfLead.add(ld);  
     }  
     insert listOfLead;  
     Test.startTest();  
     String jobId = system.schedule('ScheduledApexTest', sch, dlp);  
  //   List<Lead> listOfLead1 = [SELECT id FROM Lead WHERE LeadSource = null LIMIT 200];  
   // System.assertEquals(200,200);  	
     Test.stopTest();  
   }  
 }