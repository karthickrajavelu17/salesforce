public class addProductController {

    @testVisible private Opportunity the_opp;

    public String opp_currency { get; set; }


    public addProductController(ApexPages.StandardController con) {
        the_opp = [
                Select ID, PriceBook2.Name, (Select PriceBookEntry.Product2ID, ProductCode From OpportunityLineItems)
                From Opportunity
                Where ID = :con.getId()
        ];


    }

    public PageReference priceBookCheck() {
        if (pbName == null) {
            PageReference pr = New Pagereference('/oppitm/choosepricebook.jsp');
            pr.getParameters().put('id', the_opp.id);
            pr.getParameters().put('retURL', '/' + the_opp.id);
            pr.getParameters().put('saveURL', '/apex/p/opp/pickProducts?id=' + the_opp.id + '&retURL=' + EncodingUtil.urlEncode('/apex/p/opp/pickProducts?id=' + the_opp.id + '&retURL=/' + the_opp.id, 'UTF-8'));

            pr.setRedirect(true);
            return pr;
        } else {
            return null;
        }
    }

    public PageReference gotoCustomMultiLine() {
        System.debug(the_opp.Pricebook2.Name);
        PageReference pr = Page.customMultiLine;
        pr.getParameters().put('id', the_opp.id);
        pr.setRedirect(false);
        return pr;

    }

    public String pbName {
        get {
            return the_opp.PriceBook2 == null ? null : the_opp.PriceBook2.Name;
        }
        private set;
    }

    public productSelection[] prods {
        get {
            if(prods == null) {
                prods = New productSelection[]{};

                for(PriceBookEntry pbe : [
                        Select UnitPrice, Product2.Name, ProductCode, Product2.Description
                        From PriceBookEntry
                        Where PriceBook2ID = :the_opp.PriceBook2ID
                        AND isActive = true
                ]){
                    prods.add(
                            New productSelection(pbe)
                    );
                }
            }

            if (prods.isEmpty()) {
                apexPages.addMessage(New ApexPages.Message(ApexPages.Severity.FATAL, 'Unable to find active products'));
            }

            return prods;
        }
        set;
    }

    public OpportunityLineItem[] OLIs {
        get {
            if (OLIs == null) {
                OLIs = New OpportunityLineItem[]{};

                for (productSelection ps : prods) {
                    if(ps.isSelected) {
                        OLIs.add(
                                New OpportunityLineItem(
                                        OpportunityID = the_opp.id,
                                        UnitPrice = ps.pbe.UnitPrice,
                                        PriceBookEntryID = ps.pbe.id
                                )
                        );
                        //Add names to Id map to display on page
                        prodNames.put(ps.pbe.id, ps.pbe.Product2.Name);
                    }
                }

            }


            return OLIs;

        }
        set;
    }

    public pageReference saveOLIs() {
        try {
            update the_opp;
        } catch (DMLException e) {
            apexPages.addMessage(New ApexPages.Message(ApexPages.Severity.FATAL, 'Error Updating Opportunity: ' + e.getDMLMessage(0)));
            return null;

        }

        for (OpportunityLineItem oli : OLIs) {
            if (oli.ServiceDate == null)
                oli.ServiceDate = date.today();
        }

        try {
            insert OLIs;
        } catch (DMLException e) {
            return null;
        }

        return gotoOpp();
    }

    public pageReference gotoOpp() {
        PageReference pr = New PageReference('/' + the_opp.id);
        return pr;
    }

    public Map<ID, String> prodNames {
        get {

            if (prodNames == null) {
                prodNames = New Map<ID, String>();
            }

            return prodNames;

        }
        private set;
    }


    public class productSelection{
        public boolean isSelected {get;set;}
        public PriceBookEntry pbe {get;set;}

        public productSelection(PricebookEntry pbe){
            this.pbe = pbe;
            isSelected = false;
        }
    }
}