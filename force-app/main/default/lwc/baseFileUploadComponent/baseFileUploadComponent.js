import { LightningElement, api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CLIENT_CONTENT_OBJECT from '@salesforce/schema/Client_Content__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class BaseFileUploadComponent extends LightningElement {
    @api label;
    relatedRecordId;
    isDisabled=false;
    fieldAPIs={};

    connectedCallback() {
        /*
         *  populate fields like below if business requirement
         * fieldAPIs[NAME_FIELD.fieldApiName] = 'account created after from connectedcallback today';
         */
        const recordInput = { apiName: CLIENT_CONTENT_OBJECT.objectApiName};

        createRecord(recordInput) //Pass record input to API
            .then(
                result => {
                    this.relatedRecordId = result.id;
                })
            .catch(
                error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error creating related record for Document Upload component',
                            message: error.body.message,
                            variant: 'error',
                        }),
                    );
            });
    }
}