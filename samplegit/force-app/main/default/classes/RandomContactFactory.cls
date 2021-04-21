public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer n ,String Lname)
    {
        List<Contact> listContact = new List<Contact>();
        for(integer i = 0 ; i< n;i++)
        {
          Contact c = new Contact(FirstName ='Test '+i,LastName = Lname);
          listContact.add(c);
        }
        return listContact;
    }

}