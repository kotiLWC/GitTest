public class AccLightningDataCntrllr {
    @AuraEnabled
    public static List<Account> getAccounts(){
      List<String> custMetaDataFlds = new List<String>();
      
        for(Account_CustMetadata__mdt mapping:[SELECT Id, Label, QualifiedApiName, Account_Fields__c FROM Account_CustMetadata__mdt]){
        custMetaDataFlds.add(mapping.Account_Fields__c);
        }
        string CustMetaFlds = string.join(custMetaDataFlds,',');
        String query = 'Select id,Name,'+CustMetaFlds+ ' From Account limit 20';
        List<Account> lstAcc = Database.query(query);
        system.debug('====lstAcc==='+lstAcc);
        return lstAcc;
    }

}