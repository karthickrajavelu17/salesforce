global class Test implements Schedulable{

    global void execute(SchedulableContext SC) {

 
    QuickBookConnection.doRefreshAccessToken();

    }

}