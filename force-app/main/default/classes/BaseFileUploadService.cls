public with sharing class BaseFileUploadService {
    public static ResponseModel createRelatedRecord(String sObjTypeName,Map<String,Object> props) {
        ResponseModel toReturn = null;
        if(!String.isBlank(sObjTypeName) && SalesforceAccessUtils.isAccessible(sObjTypeName) && SalesforceAccessUtils.isCreatable(sObjTypeName)) {
            Type t = Type.forName(sObjTypeName);    
            SObject result = (SObject) t.newInstance();
            if(props!=null && !props.isEmpty()) {
                props = SalesforceAccessUtils.accessibleFields(sObjTypeName, props);
                for(String key : props.keySet()) {
                    result.put(key, props.get(key));
                }
            }
            insert result;
            toReturn = new ResponseModel(200, new List<String> {'Successfully created related instance'}, ResponseModel.STATUS_SUCCESS, result);
        }
        else {
            toReturn = new ResponseModel(200,  new List<String> {sObjTypeName+' object either null',sObjTypeName+' type does not exist',sObjTypeName+ 'is not accessible'}, ResponseModel.STATUS_ERROR, null);
        }
        return toReturn;
    }
}
