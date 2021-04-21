public class QBCustomerWrapper{
	public cls_IntuitResponse IntuitResponse;
	public class cls_IntuitResponse {
		public cls_Customer Customer;
		public String time1;	//2020-12-08T22:22:55.928-08:00
	}	//2020-12-08T22:22:55.928-08:00
	public class cls_Customer {
		public String Taxable;
		public cls_BillAddr BillAddr;
		public cls_ShipAddr ShipAddr;
		public String Job;
		public String BillWithParent;
		public Double Balance;	//629.1
		public Double BalanceWithJobs;	//629.1
		public cls_CurrencyRef CurrencyRef;
		public String PreferredDeliveryMethod;	//Print
		public String IsProject;
		public String domain;	//QBO
		public String sparse;
		public String Id;	//10
		public String SyncToken;	//0
		public cls_MetaData MetaData;
		public String GivenName;	//Geeta
		public String FamilyName;	//Kalapatapu
		public String FullyQualifiedName;	//Geeta Kalapatapu
		public String DisplayName;	//Geeta Kalapatapu
		public String PrintOnCheckName;	//Geeta Kalapatapu
		public String Active;
		public cls_PrimaryPhone PrimaryPhone;
		public cls_PrimaryEmailAddr PrimaryEmailAddr;
	}
	public class cls_BillAddr {
		public String Id;	//10
		public String Line1;	//1987 Main St.
		public String City;	//Middlefield
		public String CountrySubDivisionCode;	//CA
		public String PostalCode;	//94303
		public String Lat;	//37.445013
		public String Long1;	//-122.1391443
	}
	public class cls_ShipAddr {
		public String Id;	//10
		public String Line1;	//1987 Main St.
		public String City;	//Middlefield
		public String CountrySubDivisionCode;	//CA
		public String PostalCode;	//94303
		public String Lat;	//37.445013
		public String Long2;	//-122.1391443
	}
	public class cls_CurrencyRef {
		public String value;	//USD
		public String name;	//United States Dollar
	}
	public class cls_MetaData {
		public String CreateTime;	//2020-09-18T17:02:22-07:00
		public String LastUpdatedTime;	//2020-09-25T13:41:59-07:00
	}
	public class cls_PrimaryPhone {
		public String FreeFormNumber;	//(650) 555-0022
	}
	public class cls_PrimaryEmailAddr {
		public String Address;	//Geeta@Kalapatapu.com
	}
	public static QBCustomerWrapper parse(String json){
		return (QBCustomerWrapper) System.JSON.deserialize(json, QBCustomerWrapper.class);
	}

	public static void testParse() {
		String json=		'{'+
		' "Customer": {'+
		'  "Taxable": false,'+
		'  "BillAddr": {'+
		'   "Id": "10",'+
		'   "Line1": "1987 Main St.",'+
		'   "City": "Middlefield",'+
		'   "CountrySubDivisionCode": "CA",'+
		'   "PostalCode": "94303",'+
		'   "Lat": "37.445013",'+
		'   "Long": "-122.1391443"'+
		'  },'+
		'  "ShipAddr": {'+
		'   "Id": "10",'+
		'   "Line1": "1987 Main St.",'+
		'   "City": "Middlefield",'+
		'   "CountrySubDivisionCode": "CA",'+
		'   "PostalCode": "94303",'+
		'   "Lat": "37.445013",'+
		'   "Long": "-122.1391443"'+
		'  },'+
		'  "Job": false,'+
		'  "BillWithParent": false,'+
		'  "Balance": 629.1,'+
		'  "BalanceWithJobs": 629.1,'+
		'  "CurrencyRef": {'+
		'   "value": "USD",'+
		'   "name": "United States Dollar"'+
		'  },'+
		'  "PreferredDeliveryMethod": "Print",'+
		'  "IsProject": false,'+
		'  "domain": "QBO",'+
		'  "sparse": false,'+
		'  "Id": "10",'+
		'  "SyncToken": "0",'+
		'  "MetaData": {'+
		'   "CreateTime": "2020-09-18T17:02:22-07:00",'+
		'   "LastUpdatedTime": "2020-09-25T13:41:59-07:00"'+
		'  },'+
		'  "GivenName": "Geeta",'+
		'  "FamilyName": "Kalapatapu",'+
		'  "FullyQualifiedName": "Geeta Kalapatapu",'+
		'  "DisplayName": "Geeta Kalapatapu",'+
		'  "PrintOnCheckName": "Geeta Kalapatapu",'+
		'  "Active": true,'+
		'  "PrimaryPhone": {'+
		'   "FreeFormNumber": "(650) 555-0022"'+
		'  },'+
		'  "PrimaryEmailAddr": {'+
		'   "Address": "Geeta@Kalapatapu.com"'+
		'  }'+
		' },'+
		' "time": "2020-12-08T22:22:55.928-08:00"'+
		'}';
		QBCustomerWrapper obj = parse(json);
		System.assert(obj != null);
      
	}
}