public with sharing class CreateAcc {
    @AuraEnabled
    public static Account saveAccount (Account acc) {
     
        upsert acc;
       
        return acc;
    }
}