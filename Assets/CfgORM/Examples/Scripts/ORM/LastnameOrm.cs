using System.Collections.Generic;

namespace Database {

    public partial class LastnameOrm {
        private static readonly IDictionary<int, LastnameOrm> m_idCache = new Dictionary<int, LastnameOrm>();       
        
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
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}