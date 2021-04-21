public class JsonGen {
    
    public static void jsonGenMethod(){
        
        System.JSONGenerator leadGen=system.JSON.createGenerator(true);
        
        leadGen.writeStartObject();
          leadGen.writeStringField('FirtName','Karthick');
          leadGen.writeStringField('LastName','Rajavelu');
          leadGen.writeNumberField('Revenue',1000);
          leadGen.writeDateField('CloseDate',date.newInstance(1990, 10, 20));
        leadGen.writeEndObject();
        System.debug('JSON Content ..'+leadGen.getAsString());
    }

}