public class ResponseModel {
    public static transient final String STATUS_SUCCESS='SUCCESS';
    public static transient final String STATUS_ERROR='ERROR';
    @AuraEnabled public Integer statusCode;
    @AuraEnabled public String status;
    @AuraEnabled public List<String> message;
    @AuraEnabled public SObject result;

    public ResponseModel(Integer statusCode, List<String> message,String status, SObject result) {
        this.message = message;
        this.result = result;
        this.status = status;
        this.result = result;
    }
}