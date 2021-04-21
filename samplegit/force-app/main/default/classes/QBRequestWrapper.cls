public class QBRequestWrapper{
	public cls_eventNotifications[] eventNotifications;
	public class cls_eventNotifications {
		public String realmId;	//1185883450
		public cls_dataChangeEvent dataChangeEvent;
	}
	public class cls_dataChangeEvent {
		public cls_entities[] entities;
	}
	public class cls_entities {
		public String name;	//Customer
		public String id;	//1
		public String operation;	//Create
		public String lastUpdated;	//2015-10-05T14:42:19-0700
	}
	public static QBRequestWrapper parse(String json){
		return (QBRequestWrapper) System.JSON.deserialize(json, QBRequestWrapper.class);
	}

/*	public static void testParse() {
		String json=		'{'+
		'   "eventNotifications":['+
		'   {'+
		'      "realmId":"1185883450",'+
		'      "dataChangeEvent":'+
		'      {'+
		'         "entities":['+
		'         {'+
		'            "name":"Customer",'+
		'            "id":"1",'+
		'            "operation":"Create",'+
		'            "lastUpdated":"2015-10-05T14:42:19-0700"'+
		'         },'+
		'         {'+
		'            "name":"Vendor",'+
		'            "id":"1",'+
		'            "operation":"Create",'+
		'            "lastUpdated":"2015-10-05T14:42:19-0700"'+
		'         }]'+
		'      }'+
		'   }]'+
		'}'+
		'';
		QBRequestWrapper obj = parse(json);
        System.debug('object '+obj);
        System.debug('Name '+obj.eventNotifications[0].dataChangeEvent.entities[0].Name);
		System.assert(obj != null);
	}
*/
}