public class ChildToParentUpdate_Handler {
    public static void childToParentMethod(List<Child__c> lstChlds){
        Map<id,Parent__c> fetchPar = new Map<id,Parent__c>();
        List<Id> insParIds = new List<Id>();
        List<Id> chlIds = new List<Id>();
        List<Id> parIds = new List<Id>();
        List<Parent__c> insPar = new List<Parent__c>();
        List<Child__c> upDtChld = new List<Child__c>();
        if(RecursiveTriggerHandler.isFirstTime){
            RecursiveTriggerHandler.isFirstTime = false;
            for(Child__c c: lstChlds){
                if(c.Parent__c == null){
                    Parent__c p = new Parent__c();
                    p.Name = 'Test'+c.Name;
                    insPar.add(p);
                    chlIds.add(c.Id);
                }else{
                    parIds.add(c.Parent__c);  
                }
            }
        }
        if(insPar.size()>0){
            Insert insPar;
            for(Parent__c pp:insPar){
                insParIds.add(pp.Id); 
            }
        }
        if(insParIds.size()>0){
            for(Id idValue :insParIds){
                for(Child__c c:[Select id,Parent__c,Product__c, Product_Category__c from Child__c where Id IN:chlIds]){
                    c.Parent__c = idValue;
                    upDtChld.add(c);
                }  
            }
            update upDtChld;
        }
        if(parIds.size()>0){
            fetchPar = new Map<id,Parent__c>([SELECT Id, Name, Amount__c, Status__c, Modified_Flag__c, Product__c, Product_Category__c,(Select id,Amount__c,Status__c,Product__c, Product_Category__c from Childs__r) from Parent__c where id IN:parIds]);
            system.debug('====Fetch Parents===');
        }
        if(!fetchPar.isEmpty()){
            for(Child__c cc : lstChlds){
              Parent__c parVal = fetchPar.get(cc.Parent__c);
                parVal.Amount__c = cc.Amount__c;
                parVal.Modified_Flag__c = true;
                parVal.Status__c = cc.Status__c;
                parVal.Product__c = cc.Product__c;
                parVal.Product_Category__c = cc.Product_Category__c;
            }
           update fetchPar.values(); 
        }
        
    }
    
}