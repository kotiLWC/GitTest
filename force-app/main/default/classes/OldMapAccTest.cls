@isTest
public class OldMapAccTest {
    public static testMethod void testAccountUpdate(){
        List<Account> lstOfAcc = new List<Account>();
        Account aa= new Account();
        aa.Name = 'Test Account';
        aa.Rating ='Hot';
        aa.Phone = '6563656';
        insert aa;
        
        Contact con = new Contact();
        con.LastName ='Test Contact';
        con.AccountId = aa.Id;
        Insert con;
        
        aa.Rating ='Warm';
        update aa;
        
        //lstOfAcc.add(aa);
        OldMapAcc.updateAcc(lstOfAcc);
    }

}