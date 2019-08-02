/**
 * Created by kreardon on 7/22/2019.
 */

@IsTest
private class TestVerifyDate {
    @isTest static void DateWithinNext30() {
        Date oldDate = Date.today();
        Date newDate = Date.today().addDays(20);

        Date returnDate = VerifyDate.CheckDates(oldDate, newDate);

        System.assertEquals(newDate, returnDate);
    }
    @isTest static void DateEqual() {
        Date oldDate = Date.today();
        Date newDate = Date.today();

        Date returnDate = VerifyDate.CheckDates(oldDate, newDate);

        System.assertEquals(newDate, returnDate);
    }
    @isTest static void DateBeforeNext30() {
        Date oldDate = Date.today().addDays(20);
        Date newDate = Date.today();
        Integer totalDays = Date.daysInMonth(oldDate.year(), oldDate.month());
        Date expectedDate = Date.newInstance(oldDate.year(), oldDate.month(), totalDays);

        Date returnDate = VerifyDate.CheckDates(oldDate, newDate);

        System.assertEquals(expectedDate, returnDate);
    }
}