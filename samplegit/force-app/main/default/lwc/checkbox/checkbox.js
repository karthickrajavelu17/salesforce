import { LightningElement } from 'lwc';

export default class Checkbox extends LightningElement {

    areDetailsVisible=false;
    handleChange(event)
    {
        this.areDetailsVisible=event.target.checked;
    }
}