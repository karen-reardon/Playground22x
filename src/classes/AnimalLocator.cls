/**
* Created by kreardon on 7/23/2019.
*/

public class AnimalLocator {

public static String getAnimalNameById (Integer ID) {
    String animalName = '';
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ID.format());
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    System.debug(response.getStatusCode());
    System.debug(response.getBody());
    if (response.getStatusCode() == 200) {
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String,Object> animal = (Map<String,Object>) results.get('animal');
        System.debug('Received the following animal name');
        animalName = animal.get('name').toString();
        System.debug(animalName);
    }
    return animalName;
}
}