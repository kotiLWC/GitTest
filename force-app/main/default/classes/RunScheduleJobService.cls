public class RunScheduleJobService {
    public static void runScheduleJobProcess(){
        ReferralToOpportunitySch pa= new ReferralToOpportunitySch();
        System.schedule('Schedule Job Name 1',  '0 00 * * * ?', pa);
        System.schedule('Schedule Job Name 2',  '0 05 * * * ?', pa);
        System.schedule('Schedule Job Name 3',  '0 10 * * * ?', pa);
        System.schedule('Schedule Job Name 4',  '0 15 * * * ?', pa);
        System.schedule('Schedule Job Name 5',  '0 20 * * * ?', pa);
        System.schedule('Schedule Job Name 6',  '0 25 * * * ?', pa);
        System.schedule('Schedule Job Name 7',  '0 30 * * * ?', pa);
        System.schedule('Schedule Job Name 8',  '0 35 * * * ?', pa);
        System.schedule('Schedule Job Name 9',  '0 40 * * * ?', pa);
        System.schedule('Schedule Job Name 10', '0 45 * * * ?', pa);
        System.schedule('Schedule Job Name 11', '0 50 * * * ?', pa);
        System.schedule('Schedule Job Name 12', '0 55 * * * ?', pa);   
    }
}