public class fromJSON{
	public cls_eventNotifications[] eventNotifications;
	class cls_eventNotifications {
		public String realmId;	//1185883450
		public cls_dataChangeEvent dataChangeEvent;
	}
	class cls_dataChangeEvent {
		public cls_entities[] entities;
	}
	class cls_entities {
		public String name;	//Customer
		public String id;	//1
		public String operation;	//Create
		public String lastUpdated;	//2015-10-05T14:42:19-0700
	}
	public static fromJSON parse(String json){
		return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
	}


}