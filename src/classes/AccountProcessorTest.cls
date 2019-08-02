/**
 * Created by kreardon on 7/24/2019.
 */

@IsTest
private class AccountProcessorTest {
    @IsTest
    static void testBehavior() {
        Test.startTest();
        Id accountId = createTestRecords();
        AccountProcessor.countContacts(new List<Id>{accountId});
        Account account = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id = :accountId];
        Test.stopTest();
        Account accountAfter = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id = :accountId];
        System.assertEquals(2, accountAfter.Number_of_Contacts__c);

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