/**
* Created by kreardon on 7/24/2019.
*/

@IsTest
private class LeadProcessorTest {

    @testSetup
    static void setup() {
        Account account = new Account(Name = 'TestAccount');
        insert account;
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Lead'+i, Company=account.Id));
        }
        insert leads;
    }
    static testmethod void test() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead where LeadSource = 'Dreamforce']);
    }
}