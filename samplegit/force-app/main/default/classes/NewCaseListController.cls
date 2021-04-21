public class NewCaseListController {
    
    public  List<Case> getNewCases()
    {
       List<Case> casess = [SELECT ID,CaseNumber FROM Case WHERE status='New'];
       
        return casess;
    }

}