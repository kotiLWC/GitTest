global class ReferralToOpportunityBatchCls implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('===Start==');
        String query = 'SELECT id, Amount__c, Staus__c FROM Lead Where Modified_Flag__c=true';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> scope) {
        system.debug('===Lead Valuesss=='+scope);
        List<id> leadIds = new List<id>();
        List<Lead> upDateLead = new List<Lead>();
        Map<id,Lead> leadMap = new Map<id,Lead>();
        List<Opportunity> upDateOpp = new List<Opportunity>();
        for(Lead a : scope)
        {
            leadMap.put(a.Id,a);
            leadIds.add(a.Id);
            system.debug('===Lead =='+a);
        }
        if(leadIds.size()>0){
           LeadUpdateUsingBatchClass.getLeads(leadIds); 
        }
        List<Opportunity> lstOpp = [Select id,Amount,StageName,Source_Lead__c from Opportunity where Source_Lead__c=:leadMap.keyset()];
        for(Opportunity opp : lstOpp){
            system.debug('===Opp =='+opp);
            Lead leadValue = leadMap.get(opp.Source_Lead__c);
            opp.Amount = leadValue.Amount__c;
            opp.StageName = leadValue.Staus__c;
            opp.OppFlag__c = true;
            opp.Source_Lead__c = leadValue.id;
            upDateOpp.add(opp);
        }
        update upDateOpp;
        system.debug('===Opp =='+upDateOpp);
        
    } 
    
    global void finish(Database.BatchableContext BC) {
    }
    
}