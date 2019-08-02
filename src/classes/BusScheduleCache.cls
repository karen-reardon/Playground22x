/**
 * Created by kreardon on 7/24/2019.
 */

public with sharing class BusScheduleCache {
    private Cache.OrgPartition part;

    public BusScheduleCache() {
        part = new Cache.OrgPartition('local.BusSchedule');
    }

    public void putSchedule (String busLine, Time[] schedule){
        part.put(busLine, schedule);
    }
    public Time[] getSchedule(String busLine) {

        Time[] returnTime;
        returnTime = (Time[])part.get(busLine);
        if (returnTime == null) {
            returnTime = new Time[]{
            Time.newInstance(8,0,0,0),
            Time.newInstance(17,0,0,0)};
        }
        return returnTime;
    }
}