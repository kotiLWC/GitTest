global class ParentToChildUpdate_Batch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('===Start==');
        String query = 'Select id,Product__c, Product_Category__c,Status__c,Amount__c from Parent__c Where Modified_Flag__c=true';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Parent__c> scope) {
        List<Child__c> lstUpdtChlds = new List<Child__c>();
        List<Parent__c> lstUpdtPants = new List<Parent__c>();
        Map<id,Parent__c> mapParVal = new Map<id,Parent__c>();
        for(Parent__c pp : scope)
        {
            pp.Modified_Flag__c = false; 
            mapParVal.put(pp.Id,pp);
            lstUpdtPants.add(pp);
        }
        if(lstUpdtPants.size()>0){
           update lstUpdtPants; 
        }
        List<Child__c> lstChlds = [Select id,Parent__c,Product__c, Product_Category__c,Amount__c,Status__c from Child__c where Parent__c=:mapParVal.keyset()];
        for(Child__c cc : lstChlds){
            Parent__c parntValue = mapParVal.get(cc.Parent__c);
            cc.Amount__c = parntValue.Amount__c;
            cc.Status__c = parntValue.Status__c;
            cc.Parent__c = parntValue.id;
            lstUpdtChlds.add(cc);
        }
        RecursiveTriggerHandler.isFirstTime = false;
        update lstUpdtChlds;
        
    } 
    
    global void finish(Database.BatchableContext BC) {
    }
    
}