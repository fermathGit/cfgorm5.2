using System.Collections.Generic;

namespace Database {

    public partial class NpcdialogOrm {
        private static readonly IDictionary<int, NpcdialogOrm> m_idCache = new Dictionary<int, NpcdialogOrm>();       
        
        /// <summary>
        /// 剧情ID。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 所属章节ID。
        /// </summary>
        public readonly short Chapter;

        /// <summary>
        /// 角色名称。
        /// </summary>
        public readonly long Name;

        /// <summary>
        /// 出现位置。
        /// </summary>
        public readonly float Side;

        /// <summary>
        /// 图集。
        /// </summary>
        public readonly int Atlas;

        /// <summary>
        /// 角色头像。
        /// </summary>
        public readonly decimal Avatar;

        /// <summary>
        /// 对话内容。
        /// </summary>
        public readonly double Content;

        /// <summary>
        /// 人场方式。
        /// </summary>
        public readonly decimal Entertype;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Npcdialog", m_idCache );
        }

        public static NpcdialogOrm Get( int id ) {
            NpcdialogOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}