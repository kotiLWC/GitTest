public class PropertyCntrl {
    @AuraEnabled
    public static List<Property__c> getPropertyList(){
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    @AuraEnabled
    public static Property__c getPropertyDetails(String proprtyId){
        Property__c Prpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where id=:proprtyId];
        return Prpty;
        
    }
    @AuraEnabled
    public static List<Property__c> getPropertySearchByName(String searchKey){
        String name = '%' + searchKey + '%';
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where Name LIKE:name];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    //getPropertySearchByBedsValuie
    @AuraEnabled
    public static List<Property__c> getPropertySearchByBedsValuie(Integer BedVal){
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where Beds__c=:BedVal];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    @AuraEnabled
    public static List<Property__c> getPropertySearchByBathsValuie(Integer BathVal){
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where Baths__c=:BathVal];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    //
    @AuraEnabled
    public static List<Property__c> getPropertySearchByPrice(integer PriceVal){
        system.debug('======PriceValue===='+PriceVal);
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where Price__c <=:PriceVal];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    //getPropertyListInit
    @AuraEnabled
    public static List<Property__c> getPropertyListInit(String SearchKey, Integer Beds, Integer Baths,Integer minPrice,Integer maxPrice){
        system.debug('======SearchKey===='+SearchKey);
        system.debug('======Beds===='+Beds);
        system.debug('======Baths===='+Baths);
        system.debug('======minPrice===='+minPrice);
        system.debug('======maxPrice===='+maxPrice);
        
        String key = '%' + SearchKey + '%';
        
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c,title__c,city__c,tags__c FROM Property__c 
                      WHERE (title__c LIKE :key OR city__c LIKE :key OR tags__c LIKE :key)
                      AND price__c >= :minPrice
					  AND price__c <= :maxPrice
                      AND beds__c >= :Beds
                      AND baths__c >= :Baths
                      ORDER BY price__c LIMIT 100];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
    //getPropertyListInit
    @AuraEnabled
    public static List<Property__c> getPropertyListInitOnChnge(String SearchKey, Integer Beds, Integer Baths,Integer minPrice,Integer maxPrice){
        system.debug('======SearchKey===='+SearchKey);
        system.debug('======Beds===='+Beds);
        system.debug('======Baths===='+Baths);
        system.debug('======minPrice===='+minPrice);
        system.debug('======maxPrice===='+maxPrice);
        
        String key = '%' + SearchKey + '%';
        
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c,title__c,city__c,tags__c FROM Property__c 
                      WHERE (title__c LIKE :key OR city__c LIKE :key OR tags__c LIKE :key)
                      AND beds__c <= :Beds
                      AND baths__c <= :Baths
                      ORDER BY price__c LIMIT 100];
        system.debug('====lstPrpty===='+lstPrpty);
        return lstPrpty;  
        
    }
     @AuraEnabled
    public static List<Property__c> getSimilarProperties(String proprtyId){
        Property__c Prpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c FROM Property__c where id=:proprtyId];
        
        String PrptyId = Prpty.Id;
        Decimal Price = Prpty.Price__c;
        List<Property__c> lstPrpty = new List<Property__c>();
        lstPrpty = [SELECT Id,Name, Address__c, Beds__c,Baths__c, Price__c, State__c,Picture_IMG__c,Thumbnail__c,title__c,city__c,tags__c FROM Property__c where id !=: proprtyId AND Price__c=:Price];
        for(Property__c pp:lstPrpty){
         system.debug('====list of similar Properties===='+pp);
        }
        return lstPrpty;
        
    }
    
}