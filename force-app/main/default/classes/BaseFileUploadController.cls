public with sharing class BaseFileUploadController {
    
    @AuraEnabled
    public static ResponseModel createRelatedRecord(String sObjTypeName,Map<String,Object> props) {
        return BaseFileUploadService.createRelatedRecord(sObjTypeName,props);
    }
}
