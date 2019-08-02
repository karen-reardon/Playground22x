/**
 * Created by kreardon on 7/23/2019.
 */

@IsTest
private class ParkLocatorTest {
    @IsTest
    static void testBehavior() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
// Call the method that invokes a callout
        List<String> parks = new List<String>();
        parks = ParkLocator.country('India');
        System.Debug(parks);
        System.assertEquals(2, parks.size());
    }
}