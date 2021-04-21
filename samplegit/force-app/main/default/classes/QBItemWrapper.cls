public class QBItemWrapper{
	public cls_Item Item;
	public String time1;	//2015-12-09T11:12:39.748-08:00

    class cls_Item {
		public String FullyQualifiedName;	//Garden Supplies
		public String domain;	//QBO
		public String Id;	//19
		public String Name;	//Garden Supplies
		public boolean TrackQtyOnHand;
		public Integer UnitPrice;	//0
		public Integer PurchaseCost;	//0
		public Integer QtyOnHand;	//10
		public cls_IncomeAccountRef IncomeAccountRef;
		public cls_AssetAccountRef AssetAccountRef;
		public boolean Taxable;
		public boolean sparse;
		public boolean Active;
		public String SyncToken;	//0
		public String InvStartDate;	//2015-01-01
		public String Type;	//Inventory
		public cls_ExpenseAccountRef ExpenseAccountRef;
		public cls_MetaData MetaData;
	}
	class cls_IncomeAccountRef {
		public String name;	//Sales of Product Income
		public String value;	//79
	}
	class cls_AssetAccountRef {
		public String name;	//Inventory Asset
		public String value;	//81
	}
	class cls_ExpenseAccountRef {
		public String name;	//Cost of Goods Sold
		public String value;	//80
	}
	class cls_MetaData {
		public String CreateTime;	//2015-12-09T11:12:39-08:00
		public String LastUpdatedTime;	//2015-12-09T11:12:41-08:00
	}
	public static QBItemWrapper parse(String json){
		return (QBItemWrapper) System.JSON.deserialize(json, QBItemWrapper.class);
	}

}