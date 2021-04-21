public class QBINvoiceWrapper{
	public cls_Invoice Invoice;
	public String time1;	//2015-07-24T10:33:39.11-07:00
	class cls_Invoice {
		public String DocNumber;	//1069
		public String SyncToken;	//0
		public String domain;	//QBO
		public Integer Balance;	//100
		public cls_BillAddr BillAddr;
		public String TxnDate;	//2015-07-24
		public Integer TotalAmt;	//100
		public cls_CustomerRef CustomerRef;
		public cls_ShipAddr ShipAddr;
		public cls_LinkedTxn[] LinkedTxn;
		public String DueDate;	//2015-08-23
		public String PrintStatus;	//NeedToPrint
		public Integer Deposit;	//0
		public boolean sparse;
		public String EmailStatus;	//NotSet
		public cls_Line[] Line;
		public boolean ApplyTaxAfterDiscount;
		public cls_CustomField[] CustomField;
		public String Id;	//238
		public cls_TxnTaxDetail TxnTaxDetail;
		public cls_MetaData MetaData;
	}
	class cls_BillAddr {
		public String City;	//Bayshore
		public String Line1;	//4581 Finch St.
		public String PostalCode;	//94326
		public String Lat;	//INVALID
		public String Long1;	//INVALID
		public String CountrySubDivisionCode;	//CA
		public String Id;	//2
	}
	class cls_CustomerRef {
		public String name;	//Amy's Bird Sanctuary
		public String value;	//1
	}
	class cls_ShipAddr {
		public String City;	//Bayshore
		public String Line1;	//4581 Finch St.
		public String PostalCode;	//94326
		public String Lat;	//INVALID
		public String Long2;	//INVALID
		public String CountrySubDivisionCode;	//CA
		public String Id;	//109
	}
	class cls_LinkedTxn {
	}
	class cls_Line {
		public Integer LineNum;	//1
		public Integer Amount;	//100
		public cls_SalesItemLineDetail SalesItemLineDetail;
		public String Id;	//1
		public String DetailType;	//SalesItemLineDetail
	}
	class cls_SalesItemLineDetail {
		public cls_TaxCodeRef TaxCodeRef;
		public cls_ItemRef ItemRef;
	}
	class cls_TaxCodeRef {
		public String value;	//NON
	}
	class cls_ItemRef {
		public String name;	//Services
		public String value;	//1
	}
	class cls_CustomField {
		public String DefinitionId;	//1
		public String Type;	//StringType
		public String Name;	//Crew #
	}
	class cls_TxnTaxDetail {
		public Integer TotalTax;	//0
	}
	class cls_MetaData {
		public String CreateTime;	//2015-07-24T10:33:39-07:00
		public String LastUpdatedTime;	//2015-07-24T10:33:39-07:00
	}
	public static QBINvoiceWrapper parse(String json){
		return (QBINvoiceWrapper) System.JSON.deserialize(json, QBINvoiceWrapper.class);
	}

}