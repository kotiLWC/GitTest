public class TestApexExample {
    /*TestApexExample.custMetaDatWrapp wrap = TestApexExample.TestApexExampleMethod();
    System.debug('====wrap=Opty2ref=='+wrap.Opty2RefMap);
    System.debug('====wrap=Ref2Opty=='+wrap.Ref2OptyMap);
    System.debug('====wrap=OptyFields=='+wrap.OptyFields);
    System.debug('====wrap=RefFields=='+wrap.RefFields);*/
    //Public List<custMetaDatWrapp> lstCustWrap {get; set;}
    public static custMetaDatWrapp TestApexExampleMethod(){
        custMetaDatWrapp cMDT = new custMetaDatWrapp();
        for(OpptyToReferral_Mapping__mdt mappings: [Select id, Opty_Field__c, Referral_Field__c from OpptyToReferral_Mapping__mdt]){
            cMDT.Opty2RefMap.put(mappings.Opty_Field__c, mappings.Referral_Field__c);
            cMDT.Ref2OptyMap.put(mappings.Referral_Field__c, mappings.Opty_Field__c);
            cMDT.RefFields.add(mappings.Referral_Field__c);
            cMDT.OptyFields.add(mappings.Opty_Field__c);
            
        }
        system.debug('====CMDT===='+cMDT);
        return cMDT;
    }
    public class custMetaDatWrapp{
        Public Map<string,String> Opty2RefMap{set;get;}
        Public Map<string,String> Ref2OptyMap{set;get;}
        Public List<string> RefFields{set;get;}
        Public List<string> OptyFields{set;get;}
        
        public custMetaDatWrapp(){
            Opty2RefMap = new Map<string,String>();  
            Ref2OptyMap = new Map<string,String>();
            RefFields = new List<string>();
            OptyFields = new List<string>();
            
        }
        
    }
}