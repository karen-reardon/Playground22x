public with sharing class CaseService {
    public static void closeCases(Set<ID> caseIds, String closeReason) {
        
        List<Case> cases = [select Id, reason from Case where Id in :caseIds];
        for (Case caseObj: cases) {
            caseObj.Status = 'Closed';
            caseObj.Reason = closeReason;
        }
        update cases;

    }
}