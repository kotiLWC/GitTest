public class AccountDeleteCntrl {
@Auraenabled
    public static List<Account> getAccounts(){
        List<Account> lstAcc =[Select id,Name,Rating,Industry from Account where Phone!=null limit 15];
        return lstAcc;
    }
}