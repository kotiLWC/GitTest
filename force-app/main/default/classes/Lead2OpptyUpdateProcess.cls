public class Lead2OpptyUpdateProcess {
    @InvocableMethod
    public static void updateOppty(List<Id> LeadIds){
     List<Lead> lstLead = [SELECT id, Amount__c, Staus__c FROM Lead Where Modified_Flag__c=true and id IN:LeadIds];
        Map<id,Lead> leadMap = new Map<id,Lead>();
        List<Opportunity> upDateOpp = new List<Opportunity>();
        for(Lead a : lstLead)
        {
          system.debug('===Lead =='+a);
            leadMap.put(a.Id,a);
        }
        List<Opportunity> lstOpp = [Select id,Amount,StageName,Source_Lead__c from Opportunity where Source_Lead__c=:leadMap.keyset()];
        for(Opportunity opp : lstOpp){
            system.debug('===Opp =='+opp);
            Lead leadValue = leadMap.get(opp.Source_Lead__c);
            opp.Amount = leadValue.Amount__c;
            opp.StageName = leadValue.Staus__c;
            opp.OppFlag__c = true;
            upDateOpp.add(opp);
        }
        update upDateOpp;
        system.debug('===Opp =='+upDateOpp);  
    }

}