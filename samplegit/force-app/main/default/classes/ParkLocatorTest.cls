@isTest
private class ParkLocatorTest {
    @isTest static void testCallout()
    {
      test.setMock(WebServiceMock.class,new ParkServiceMock());
        List<String> result = new List<String>();
        List<String> Expected = new List<String>{'park1','park2','park23'};
        result=ParkLocator.country('india');
        system.assertEquals(Expected, result);
    }

}