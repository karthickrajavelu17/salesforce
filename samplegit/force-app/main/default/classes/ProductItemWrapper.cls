public class ProductItemWrapper{
	public boolean TrackQtyOnHand;
	public String Name;	//Garden Supplies
	public Integer QtyOnHand;	//10
	public cls_IncomeAccountRef IncomeAccountRef;
	public cls_AssetAccountRef AssetAccountRef;
	public String InvStartDate;	//2015-01-01
	public String Type;	//Inventory
	public cls_ExpenseAccountRef ExpenseAccountRef;
	public class cls_IncomeAccountRef {
		public String name ='Sales of Product Income';	//Sales of Product Income
		public String value='79';	//79
	}
	public class cls_AssetAccountRef {
		public String name='Inventory Asset';	//Inventory Asset
		public String value='81';	//81
	}
	public class cls_ExpenseAccountRef {
		public String name='Cost of Goods Sold';	//Cost of Goods Sold
		public String value='80';	//80
	}
}