public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lname , String postal) 
    {
        List<Contact> con =[SELECT Id,Name FROM Contact WHERE LastName=:lname AND MailingPostalCode =:postal];
        return con;
    }

}