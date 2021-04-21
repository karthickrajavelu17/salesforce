@isTest
public class TestVerifyDate {
    @isTest static void TestDateMethod()
    {
        Date startDate = date.newInstance(2015, 12, 15);
        Date endDate = date.newInstance(2015, 12, 16);
        Date method1res1 = VerifyDate.CheckDates(startDate, endDate);
        System.assertEquals(endDate, method1res1);

    }
    @isTest static void TestDateMethod2()
    {
         Date startDate = date.newInstance(2015, 10, 15);
        Date endDate = date.newInstance(2015, 12, 16);
        Date method1res1 = VerifyDate.CheckDates(startDate, endDate);
        Integer totalDays = Date.daysInMonth(startDate.year(), startDate.month());
		Date lastDay = Date.newInstance(startDate.year(), startDate.month(), totalDays);
        System.assertEquals(lastDay,method1res1);
        
    }

}