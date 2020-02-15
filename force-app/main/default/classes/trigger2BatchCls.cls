global class trigger2BatchCls implements Database.Batchable<sobject> {
    global database.QueryLocator start(Database.BatchableContext BC){
     System.debug('====Batch Start====');
     //String soqlQuery = 'SELECT Name, AccountNumber, Type,Rating From Account where Rating=Cold';
     return database.getquerylocator([SELECT Name, AccountNumber, Type,Rating From Account where Rating='Cold']);  
    }
    public void execute(Database.BatchableContext BC,List<Account> Scope){
        System.debug('====Batch Execute====');
        List<Account> upDateAcc = new List<Account>();
        for(Account a:Scope){
            a.Name = a.Name +'Cold';
            upDateAcc.add(a);

        }
        Update upDateAcc;

    }
    public void finish(Database.BatchableContext BC){
      System.debug('====Batch Finish====');  
    }
}