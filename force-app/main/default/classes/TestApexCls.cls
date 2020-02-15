public class TestApexCls {
    @AuraEnabled
    public static string callAction1()
    {
        system.debug('====action1=====');
     return 'action1';
    }
    @AuraEnabled
    public static string callAction2()
    {
     system.debug('====action2=====');
     return 'action2';
    }
    @AuraEnabled
    public static string callAction3()
    {
     system.debug('====action3=====');
     return 'action3';
    }


}