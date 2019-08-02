/**
 * Created by kreardon on 7/23/2019.
 */

@IsTest
private class AccountManagerTest {
    @IsTest
    static void testBehavior() {
        Id recordId = createTestRecords();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
        'https://yourInstance.salesforce.com/services/apexrest/Account/'
        + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account account = AccountManager.getAccount();
        System.assert(account != null);
        System.assertEquals('Test record', account.Name);
    }
    static Id createTestRecords() {
        // Create test record
        Account accountTest = new Account(
                Name='Test record');
        insert accountTest;
        Contact contact1 = new Contact(
                LastName = 'LastName1',
                AccountId = accountTest.Id);
        insert contact1;
        Contact contact2 = new Contact(
                LastName = 'LastName2',
                AccountId = accountTest.Id);
        insert contact2;
        return accountTest.Id;
    }
}