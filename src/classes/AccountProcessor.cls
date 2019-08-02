/**
 * Created by kreardon on 7/24/2019.
 */

public with sharing class AccountProcessor {

    @future
    public static void countContacts (List<Id> accountIds) {

        List<Account> accounts = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id IN :accountIds];

        for (Account a : accounts) {
            Integer numContact = [SELECT COUNT() FROM Contact WHERE AccountId = :a.Id];
            a.Number_of_Contacts__c = numContact;
        }
        update accounts;
    }
}