public class OldMapAcc {
    public  static void updateAcc(List<Account> lstOfAcc){
        List<Contact> lstCon = new List<Contact>();
        set<id> accIds= new set<id>();
        for(Account aa:lstOfAcc){
            system.debug('====New Rating===='+aa);
            Account oldAcc = (Account)trigger.oldMap.get(aa.Id);
            system.debug('====Old Rating===='+oldAcc.Rating);
            if(aa.Rating != oldAcc.Rating ){
                system.debug('====Accids===='+aa.Id);
                accIds.add(aa.id); 
            }
        }
        system.debug('====Accids===='+accIds);
        List<Account> lstAcc = [Select id,Name,Rating,Phone,(select id,Name,Phone From Contacts) from Account where id IN:accIds];
        system.debug('====lstAcc==='+lstAcc);
        for(Account p: lstAcc){
            system.debug('====Account===='+p);
            
            for(Contact c:p.Contacts){
                system.debug('====Contact===='+c);
                
                c.Phone = p.Phone;
                lstCon.add(c);
            }
            
        }
        Database.Update(lstCon);
        system.debug('====Update Contact===='+lstCon);
     
    }
    
}