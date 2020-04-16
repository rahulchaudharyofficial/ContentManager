import { LightningElement, api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CLIENT_CONTENT_OBJECT from '@salesforce/schema/Client_Content__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class BaseFileUploadComponent extends LightningElement {
    @api label;
    relatedRecordId;
    isDisabled=false;

    connectedCallback() {
        console.log("relatedRecord -> "+ this.relatedRecord);
        console.log("associatedRecords -> "+ this.associatedRecords);
        console.log("associatedRecordType -> "+ this.associatedRecordType);
        console.log("label -> "+ this.label);
    }
}