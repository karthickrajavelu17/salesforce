global class scheduledTest implements Schedulable{

    global void execute(SchedulableContext SC) {

 
    QuickBookConnection.doRefreshAccessToken();
   //  String jobname='Scheduled'+String.valueOf(System.now());
 //   System.schedule('Scheduled Job 1', '0 0 * * * ?', new scheduledTest());
   // System.schedule(jobname, '0 10 * * * ?', new scheduledTest());
    //System.schedule('Scheduled Job 3', '0 20 * * * ?', new scheduledTest());
    //System.schedule('Scheduled Job 4', '0 30 * * * ?', new scheduledTest());
    //System.schedule('Scheduled Job 5', '0 40 * * * ?', new scheduledTest());
    //System.schedule('Scheduled Job 6', '0 50 * * * ?', new scheduledTest());
            String day = string.valueOf(system.now().day());

        String month = string.valueOf(system.now().month());
        String minute;
        String hour;
         Integer min=system.now().minute()+55;
         Integer hrs;
         if(min > 60)
         {
         min=min-60;
         minute = string.valueOf(min);
        // hour = string.valueOf(system.now().hour()+1); 
         hrs=system.now().hour()+1;  
         } 
        else{
        minute = string.valueOf(min);
         hrs = system.now().hour(); 
        }
        if(hrs > 24){
            hrs=hrs-24;
        }
       hour=string.valueOf(hrs);
       String second = string.valueOf(system.now().second());

        String year = string.valueOf(system.now().year());



        String strJobName = 'Job-' + second + '_' + minute + '_' + hour + '_' + day + '_' + month + '_' + year;

        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;

        System.schedule(strJobName, strSchedule, new scheduledTest());
    }

}