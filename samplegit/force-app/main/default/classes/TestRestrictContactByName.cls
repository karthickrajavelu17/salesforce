@isTest
public class TestRestrictContactByName {
   @isTest static void RestrictContact()
   {
    Contact c = new Contact(LastName = 'INVALIDNAME');
    insert c;
       
   }
   
    
    
}