public class ContactCreate {
    @AuraEnabled
    public static void createContactMethod( String fName, String lName){
        Contact con = new Contact();
        con.FirstName = fName;
        con.LastName = lName;
        insert con;
        
    }

}