public class AccountCntrller {
    @Auraenabled
    Public static List<Account> getAccounts(){
        List<Account> lstAcc = new List<Account>();
        lstAcc = [Select id,Name,Rating,Industry from Account limit 10];
        return lstAcc;
    }

}