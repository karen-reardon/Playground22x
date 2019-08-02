@IsTest
private class AddPrimaryContactTest {

    @testSetup
    static void setup() {
        Contact contact = new Contact(LastName = 'Test Contact');
        insert contact;
        List<Account> accounts1 = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts1.add(new Account(Name = 'Account'+i, BillingState = 'NY'));
        }
        insert accounts1;
        List<Account> accounts2 = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts2.add(new Account(Name = 'Account'+i, BillingState = 'CA'));
        }
        insert accounts2;
    }
    static testmethod void test() {
        Test.startTest();
        Contact targetContact = [SELECT Id, LastName FROM Contact WHERE LastName = 'Test Contact'];
        AddPrimaryContact updater = new AddPrimaryContact(targetContact,'CA');
        System.enqueueJob(updater);
        Test.stopTest();
        System.assertEquals(50, [select count() from  Contact where LastName = 'Test Contact' and Account.BillingState = 'CA']);    }
}