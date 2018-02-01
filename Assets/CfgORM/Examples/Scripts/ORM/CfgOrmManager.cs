
namespace Database {
    public class CfgOrmManager {
        public static void LoadAll() {
            
            CfgORMExample01Orm.Load();
            CfgORMExample02Orm.Load();
            ItemsOrm.Load();
            LastnameOrm.Load();
            LuckydrawOrm.Load();
            MalenameOrm.Load();
            MallOrm.Load();
            MonsterOrm.Load();
            NfroleOrm.Load();
            NpcOrm.Load();
            NpcdialogOrm.Load();
            PartnerOrm.Load();
        }
    }
}
