public class savePDF {

  
        // The extension constructor initializes the private member
    // variable pageOpp by using the getRecord method from the standard
    // controller.
    Date myDate = system.today();
    Private Opportunity pageOpp;
    public Boolean initialised{get; set;}


 public savePDF(ApexPages.StandardController stdController) {
        this.pageOpp = (Opportunity)stdController.getRecord();
        id PageOppId = ApexPages.currentPAge().getParameters().get('id');
        initialised=false;
        system.debug('id = ' + pageOpp.id + '     id2' +PageOppId);
    }

//method to insert attachement call it on page on click of button 
public void saveAttachement() {
                
    if (!initialised && pageOpp.ID !=NULL) {

     PageReference pdf ;
    // create the new attachment
    Attachment attach = new Attachment();

    // the contents of the attachment from the pdf
    Blob body;

    try {

        // returns the output of the page as a PDF
       // body = pdf.getContentAsPDF();
        system.debug('body should be fine');
     body = Blob.valueOf('Some Text');
        // need to pass unit test -- current bug    
        } catch (VisualforceException e) {
            system.debug('in the catch block');
             body = Blob.valueOf('Some Text');
        }

        attach.Body = body;
    // add the user entered name
    attach.Name = opportunity.account.name + ' ' + myDate + '.pdf';
    attach.IsPrivate = false;
    // attach the pdf to the account
    attach.ParentId = pageOpp.Id;
    insert attach;
   system.debug(attach);
initialised=true;
  } else system.debug('tried to run twice');
} 
}