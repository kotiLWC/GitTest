public class ProcessBuilderWithAcc {
    @InvocableMethod 
    public static void UpdateAccount(List<Id> accountIds){
        List<Account> upDtAcc = new List<Account>();
	List<Account> lstAcc = [Select id,Name,Rating From Account where ID IN:accountIds];
        System.debug('=====lstAcc===='+lstAcc);
        for(Account a:lstAcc){
            if(a.Rating =='Hot'){
                a.Rating = 'Warm';
            }
            
        }
       
    } 

}