/**
 * Created by kreardon on 7/23/2019.
 */
@IsTest
global class ParkServiceMock implements WebServiceMock {
global void doInvoke(
Object stub,
Object request,
Map<String, Object> response,
String endpoint,
String soapAction,
String requestName,
String responseNS,
String responseName,
String responseType) {
// start - specify the response you want to send
    List<String> parks = new List<String>();
    parks.add('Park1');
    parks.add('Park1');

    ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
    response_x.return_x = parks;
// end
response.put('response_x', response_x);
}
}