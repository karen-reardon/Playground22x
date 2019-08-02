/**
 * Created by kreardon on 7/24/2019.
 */

public class AddPrimaryContact implements Queueable {

    private Contact primaryContact;
    private String targetState;
    public AddPrimaryContact(Contact contact, String state) {

        primaryContact = contact;
        targetState = state;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :targetState];
        for (Account account : accounts) {
            Contact contact = primaryContact.clone();
            contact.AccountId = account.Id;
            insert contact;
        }
    }
}