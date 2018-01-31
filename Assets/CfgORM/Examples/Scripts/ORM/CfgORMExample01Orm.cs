using System.Collections.Generic;

namespace Database {

    public partial class CfgORMExample01Orm {
        private static readonly IDictionary<string, CfgORMExample01Orm> m_idCache = new Dictionary<string, CfgORMExample01Orm>();       
        
        /// <summary>
        /// 技能ID。
        /// </summary>
        public readonly int ID;

        /// <summary>
        /// 职业。
        /// </summary>
        public readonly string FLD1;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "CfgORMExample01", m_idCache );
        }

        public static CfgORMExample01Orm Get( string id ) {
            CfgORMExample01Orm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<string> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}