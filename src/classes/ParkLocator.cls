/**
 * Created by kreardon on 7/23/2019.
 */

public class ParkLocator {
    public static List<String> country (String countryName) {

        List<String> parks = new List<String>();
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();

        parks = parkService.byCountry(countryName);
        System.Debug(parks);
        return parks;
    }
}