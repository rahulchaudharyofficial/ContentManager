public class SalesforceAccessUtils {
    private static Map<String,Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();

    public static Boolean isAccessible(String sObjTypeName) {
        Boolean toReturn = false;
        if(!String.isBlank(sObjTypeName)) {
            for(String key : globalDescribe.keySet()) {
                if(key.equalsIgnoreCase(sObjTypeName)) {
                    toReturn = globalDescribe.get(key).getDescribe().accessible;
                }
            }
        }
        return toReturn;
    }


    public static Boolean isCreatable(String sObjTypeName) {
        Boolean toReturn = false;
        if(!String.isBlank(sObjTypeName)) {
            for(String key : globalDescribe.keySet()) {
                if(key.equalsIgnoreCase(sObjTypeName)) {
                    toReturn = globalDescribe.get(key).getDescribe().createable;
                }
            }
        }
        return toReturn;
    }

    public static Map<String,Object> accessibleFields(String sObjTy, Map<String,Object> props) {
        Map<String,Object> toReturn = new Map<String,Object>();

        if(!String.isBlank(sObjTy)) {
                Map<String, Schema.SObjectField> fieldMap = globalDescribe.get(sObjTy).getDescribe().fields.getMap();
                Set<String> keySet = fieldMap.keySet();
                for(String key : props.keySet()) {
                    if(keySet.contains(key)) {
                        Schema.SObjectField field = fieldMap.get(key);
                        Schema.DescribeFieldResult result = field.getDescribe();
                        if(result.isAccessible() && result.isCreateable()) {
                            toReturn.put(key, props.get(key));
                        }
                    }
                }
        }
        return toReturn;
    }
}
