@isTest
private class UnitOfWorkTest {

@isTest static void challengeComplete() {

    fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
        new Schema.SObjectType[] {
            Account.SObjectType,
            Contact.SObjectType,
            Note.SObjectType
        });
    Account newAccount;
    for(Integer i=0; i<100; i++) {
        newAccount = new Account(name='Account'+i);
        uow.registerNew(newAccount);

    }
    for(Integer i=0; i<500 ;i++) {
        uow.registerNew(new Contact(lastName='Contact'+i, AccountId= newAccount.Id));
        Note newNote = new Note(Title='Note'+i);
        uow.registerRelationship(newNote, Note.ParentId, newAccount);
        uow.registerNew(newNote, Note.ParentId, newAccount);
    }
    uow.commitWork();
    System.assertEquals(100, [Select Id from Account].size());
    System.assertEquals(500, [Select Id from Contact].size());
    System.assertEquals(500, [Select Id from Note].size());
}
}