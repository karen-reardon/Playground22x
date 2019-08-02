@IsTest
private class AnimalLocatorTest {
    @IsTest
    static void testBehavior() {

// Create the mock response based on a static resource
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
//        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
//        mock.setStaticResource('GetAnimalResource');
//        mock.setStatusCode(200);
//        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
// Associate the callout with a mock response
//        Test.setMock(HttpCalloutMock.class, mock);
        String animalName = AnimalLocator.getAnimalNameById(1);
// Verify mock response is not null
        System.assertEquals('chicken', animalName);
    }
}