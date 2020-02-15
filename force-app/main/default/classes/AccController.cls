public class AccController {
   @AuraEnabled
    public static list<String> getRatingFields(){
        List<String> FinalFields = new  List<String>(); 
        List<Account> lstAcc = [Select id ,Rating From Account];
        for(Account acc :lstAcc){
            
                FinalFields.add(acc.Rating);
        }
        return FinalFields;
    }

}