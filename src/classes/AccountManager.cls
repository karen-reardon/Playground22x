/**
 * Created by kreardon on 7/23/2019.
 */

@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {

        System.Debug('getAccount');
        RestRequest request = RestContext.request;
        System.Debug(request.requestURI);
        Integer lastDelimiter = request.requestURI.lastIndexOf('/');
        System.Debug(lastDelimiter);
        String accountPart = request.requestURI.left(lastDelimiter);
        System.Debug(accountPart);
        String accountId = accountPart.substring(accountPart.lastIndexOf('/')+1);
                System.Debug(accountId);
        Account account = [SELECT Id,Name,(SELECT Id,Name from Contacts) FROM Account WHERE Id = :accountId];
        return account;
    }
}