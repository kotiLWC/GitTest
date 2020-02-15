global class BatchClsExample implements Database.Batchable<SObject>, Database.Stateful{
    global database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,Name,Rating from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> lstAcc = new List<Account>();
        for(Account a:scope){
            if(a.Rating=='Hot'){
                a.Industry ='Agriculture';
            lstAcc.add(a);    
            }
        }
        update lstAcc;
    }
    global void finish(Database.BatchableContext bc){
        
    }
 
}