/**
 * Created by kreardon on 7/26/2019.
 */

public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        List<Camping_Item__c> campItems = new List<Camping_Item__c>();
        campItems = [SELECT Id,Name,Price__c,Quantity__c,Packed__c FROM Camping_Item__c];
        return campItems;
    }
    @AuraEnabled
    public static void saveItem(Camping_Item__c item) {
        insert item;
    }

}