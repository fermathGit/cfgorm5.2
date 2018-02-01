using System.Collections.Generic;

namespace Database {

    public partial class MalenameOrm {
        private static readonly IDictionary<int, MalenameOrm> m_idCache = new Dictionary<int, MalenameOrm>();       
        
        /// <summary>
        /// ID。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 名。
        /// </summary>
        public readonly sbyte Name;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Malename", m_idCache );
        }

        public static MalenameOrm Get( int id ) {
            MalenameOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}