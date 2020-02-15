public class DataBaseExample {
    public static void createAcc(){
        // Create two accounts, one of which is missing a required field
        Account[] accts = new List<Account>{
            new Account(Name='Account1'),
                new Account()};
                    Database.SaveResult[] srList = Database.insert(accts, false);
        
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
    public static void updateAcc(){
        // Create two accounts, one of which is missing a required field
       
        Account a1 =[select id,name,rating from account where name='Test1' limit 1];
        Account a2 =[select id,name,rating from account where name='Update Account2' limit 1];

        List<Account> accts = new List<Account>();
        a1.Name=null;
        a1.Rating ='Cold';
        accts.add(a1); 
        
        a2.Name='Update Account33';
        a2.Rating ='Cold';
        accts.add(a2);
        
        
        
        Database.SaveResult[] srList = Database.update(accts,false);
        
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
    
    
}