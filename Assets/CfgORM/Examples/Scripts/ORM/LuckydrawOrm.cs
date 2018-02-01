using System.Collections.Generic;

namespace Database {

    public partial class LuckydrawOrm {
        private static readonly IDictionary<int, LuckydrawOrm> m_idCache = new Dictionary<int, LuckydrawOrm>();       
        
        /// <summary>
        /// ID。
        /// </summary>
        public readonly int ID;

        /// <summary>
        /// 图标。
        /// </summary>
        public readonly uint Icon;

        /// <summary>
        /// 消耗数量。
        /// </summary>
        public readonly long CostCount;

        /// <summary>
        /// 消耗类型（1金币， 2钻石）。
        /// </summary>
        public readonly short CostCountType;

        /// <summary>
        /// 抽奖类型。
        /// </summary>
        public readonly short Type;

        /// <summary>
        /// 说明。
        /// </summary>
        public readonly short Explain;

        /// <summary>
        /// 抽奖描述。
        /// </summary>
        public readonly double Des;

        /// <summary>
        /// 免费次数。
        /// </summary>
        public readonly char FreeCount;

        /// <summary>
        /// 间隔时间(s)。
        /// </summary>
        public readonly byte IntervalTime;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Luckydraw", m_idCache );
        }

        public static LuckydrawOrm Get( int id ) {
            LuckydrawOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}