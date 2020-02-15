public class OptyToReferllUpdt_Handler {
    public static void OptyToReferllUpdtMethod(List<Opportunity> lstOpp){
        List<Lead> updtLeads =new List<Lead>();
        List<Lead> insLeads =new List<Lead>();
        String OpptyId;
        Set<id> OppIds = new Set<id>();
        map<String,String> refKeyWithOptyValue = new map<String,String>();
        map<String,String> RefMap = new map<String,String>();
        map<String,String> OptyMap = new map<String,String>();
        List<OpptyToReferral_Mapping__mdt> mappings = [Select Opty_Field__c,Referral_Field__c from OpptyToReferral_Mapping__mdt];
        for(OpptyToReferral_Mapping__mdt mapping: mappings){
            //system.debug('=====Referral mapping==='+mapping.Referral_Field__c);
            //system.debug('===== Oppty mapping==='+mapping.Opty_Field__c);
            RefMap.put(mapping.Referral_Field__c, mapping.Opty_Field__c); 
            //system.debug('===== RefMap mapping==='+RefMap);
            OptyMap.put(mapping.Opty_Field__c, mapping.Referral_Field__c); 
            //system.debug('===== OptyMap mapping==='+OptyMap);
            for(Opportunity opp : lstOpp){
                if(opp.Leads__r != null){
                    OppIds.add(opp.Id);
                }else{
                    OpptyId = opp.id;
                }
                Opportunity op1 = opp;
                for(string key: RefMap.keySet()){
                    //system.debug('===== RefMap key==='+key); 
                    //String fieldValue = (String) acc.get(selectedField);
                    Object fldObj= op1.get(RefMap.get(key));
                    String fieldVal = string.valueOf(fldObj);
                    //system.debug('===== OppMap Value==='+fieldVal);
                    refKeyWithOptyValue.put(key,fieldVal);
                    system.debug('===== Key-Value==='+refKeyWithOptyValue);
                    
                }
            }
            
        }
        if(OppIds.size()>0){
        string finalquery ='Select id,Name,Status__c,Amount__c,Product__c from Lead where opportunity__c IN:OppIds';
        List<Lead> finalLeads = database.query(finalquery);
            for(Lead ld:finalLeads){
                for(string Key :RefMap.keySet()){
                    if( Key == 'Status__c'){
                        ld.Status__c = refKeyWithOptyValue.get(Key);
                    }else if(Key == 'Product__c'){
                        ld.Product__c = refKeyWithOptyValue.get(key);
                    }else if(Key == 'Amount__c'){
                       String amt = refKeyWithOptyValue.get(key);
                       decimal damt = decimal.valueOf(amt);
                        system.debug('=====damt===='+damt);
                        ld.Amount__c = damt;
                    }
                }
                //ld.Amount__c = decimal.valueOf(refKeyWithOptyValue.get(ld.Amount__c));
                updtLeads.add(ld);
            }
            
        update updtLeads; 
        }
        else{
            Lead l = new Lead();
            l.Company = 'Test Abc';
            l.LastName = 'Test Last';
            l.Opportunity__c = OpptyId;
             for(string Key :RefMap.keySet()){
                  if( Key == 'Status__c'){
                        l.Status__c = refKeyWithOptyValue.get(Key);
                    }else if(Key == 'Product__c'){
                        l.Product__c = refKeyWithOptyValue.get(key);
                    }else if(Key == 'Amount__c'){
                       String amt = refKeyWithOptyValue.get(key);
                       decimal damt = decimal.valueOf(amt);
                        system.debug('=====damt===='+damt);
                        l.Amount__c = damt;
                    }
                 insLeads.add(l);
             }
            insert insLeads;
        }
    }
    
}