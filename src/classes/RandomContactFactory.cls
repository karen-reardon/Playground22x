/**
 * Created by kreardon on 7/22/2019.
 */

public with sharing class RandomContactFactory {


    public static List<Contact> generateRandomContacts  (Integer numContact, String lastName) {

        List<Contact> contactList = new List<Contact>();

        for (Integer i=0; i<numContact; i++) {
            Contact contact = new Contact(FirstName = 'First' + i, LastName = lastName);
            contactList.add(contact);
        }
        return contactList;
    }
}