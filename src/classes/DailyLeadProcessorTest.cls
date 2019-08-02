/**
* Created by kreardon on 7/24/2019.
*/

/**
* Created by kreardon on 7/24/2019.
*/

@IsTest
private class DailyLeadProcessorTest {

    @testSetup
    static void setup() {
        Account account = new Account(Name = 'TestAccount');
        insert account;
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Lead' + i, Company = account.Id));
        }
        insert leads;
    }
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
                CRON_EXP,
                new DailyLeadProcessor());
        Test.stopTest();

        Integer modLeads = [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, modLeads);
    }
}