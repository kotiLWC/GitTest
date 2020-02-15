public class contactcontrl {
    @auraenabled
    public static string apexcontact(string fname,string lname)
    {
        System.debug('===fname==='+fname);
        System.debug('===lname==='+lname);

        Contact con = new Contact();
        con.FirstName=fname;
        con.LastName=lname;
        insert con;
         System.debug('===Contact==='+con);

        return 'success';
    }

}