/**
 * Created by kreardon on 7/22/2019.
 */
@isTest
private class TestRestrictContactByName {

    @isTest static void TestInvalidName() {
        Test.startTest();
        Contact newContact = new Contact(LastName= 'InvalidName');
        Database.SaveResult result = Database.insert(newContact,false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        String expectedError = 'The Last Name \"InvalidName\" is not allowed for DML';
        String returnedError = result.getErrors()[0].getMessage();
        System.assertEquals(expectedError, returnedError);
    }
    @isTest static void TestValidName() {
        Test.startTest();
        Contact newContact = new Contact(LastName= 'ValidName');
        Database.SaveResult result = Database.insert(newContact);
        Test.stopTest();
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    }

}