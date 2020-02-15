public class LeadUpdateUsingBatchClass {
    public static void getLeads( list<id> leadIds){
        system.debug('===Lead Valuesss=='+leadIds);
        List<Lead> upDateLead = new List<Lead>();
        List<Lead> lstLeads = [SELECT id, Amount__c, Staus__c,Modified_Flag__c FROM Lead where id IN: leadIds and Modified_Flag__c =true];
        for(Lead a : lstLeads)
        {
         system.debug('===Lead Valuesss=='+a);
            a.Modified_Flag__c = false;
            upDateLead.add(a);
        }
       
        update upDateLead;
        system.debug('===lead =='+upDateLead);
    }

}