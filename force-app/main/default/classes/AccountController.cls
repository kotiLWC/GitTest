public class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts(){
       return [SELECT Id, Name, BillingState,Website, Phone, Industry,Rating,Type from Account]; 
    }

}