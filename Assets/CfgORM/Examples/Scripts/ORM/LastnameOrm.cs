using System.Collections.Generic;

namespace Database {

    public partial class LastnameOrm {
        private static readonly IDictionary<int, LastnameOrm> m_idCache = new Dictionary<int, LastnameOrm>();
        public static IDictionary<int, LastnameOrm> datas { get { return m_idCache; } }       
        
        /// <summary>
        /// ID。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 姓。
        /// </summary>
        public readonly decimal LastName;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Lastname", m_idCache );
        }

        public static LastnameOrm Get( int id ) {
            LastnameOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        #endregion
    }
}