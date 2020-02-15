public class DemoController {
Public List<Account> accList {get;set;}
    public DemoController(){
        accList = [Select id,Name,Rating,AccountNumber,Type,Industry from Account where Rating !=null AND Rating='Hot'];
        //accList.add(new Account());
    }
}