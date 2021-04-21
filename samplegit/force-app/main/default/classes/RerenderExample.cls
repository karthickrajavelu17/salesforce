public class RerenderExample {
    public string outputstring {get;set;}
    
    public RerenderExample()
    {
        outputstring='this is value before rerender';
    }
    
    public void show()
    {
        outputstring='Value After RERENDER';
    }

}