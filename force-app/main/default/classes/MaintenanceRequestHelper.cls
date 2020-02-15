public class MaintenanceRequestHelper {
    public static void updateWorkOrders(){
        // update workorders
       List<Case> insertCaseLst = new List<Case>();
       List<Case> csList =  [select id,Vehicle__r.Id,Equipment__r.Id,(select id from Work_Parts__r) from case where status = 'Closed' and Id IN :Trigger.new and Type in('Repair','Routine Maintenance')];
        System.debug('csList-->'+csList);
        for(Case cs:csList){
            List<Work_Part__c> workPartLst = cs.Work_Parts__r;
            Case newCase = new Case(Type = 'Routine Maintenance', Subject = 'New Routine Maintenance',
                                    Date_Reported__c = System.Today(), Date_Due__c = System.Today() + calculateDueDate(workPartLst),
                                    Vehicle__c = cs.Vehicle__r.Id,Origin='Web',Status='New',Equipment__c = cs.Equipment__r.Id);
            insertCaseLst.add(newCase);
            
        }
      
       if(insertCaseLst!=null && insertCaseLst.size()>0){
            insert insertCaseLst;
        }
         

    }  

    public static Integer calculateDueDate(List<Work_Part__c> workPartLst){
       Integer count = 0;
       List<AggregateResult> agrResult = [select min(Equipment__r.Maintenance_Cycle__c) arg from Work_Part__c where id in:workPartLst ];
       for(AggregateResult ar : agrResult){
            count = (Integer) ar.get('arg');
       }
       return count !=null ? count : 0 ;
    }  
    
}