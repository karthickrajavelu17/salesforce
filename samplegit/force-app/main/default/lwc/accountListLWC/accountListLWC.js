import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper1.getAccountList';
  
export default class AccountListLWC extends LightningElement {
    @wire(getAccountList) accounts;
}