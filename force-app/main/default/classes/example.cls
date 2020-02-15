public class example {  
    public List<Lead> insertLeadsValues{get;set;}
    Public void insertLeads(){
        insertLeadsValues = new List<lead>();
        
        Lead l = new lead(LastName='TestLead456',Company='Marlabs345',Status='Open-Not Contacted');
        insertLeadsValues.add(l);
        
        Lead l2 = new lead();
        l2.LastName='TestLead2';
        l2.Company='Marlabs2';
        l2.Status='Open-Not Contacted';
        insertLeadsValues.add(l2);
        
       insert insertLeadsValues;
       system.debug('====Lead====='+insertLeadsValues);
       //return insertLeadsValues;
    }
}