public class StringMethod {
    
    public void method()
    {
        String name='abcdef@gmail.com';
        String subname =name.substringBefore('@');
       
        System.debug(subname);
    }

}