global class ReferralToOpportunitySch implements Schedulable{
    global void execute(SchedulableContext sc) {
        ReferralToOpportunityBatchCls obj = new ReferralToOpportunityBatchCls();
        database.executebatch(obj,2000);
        
         
    }
}