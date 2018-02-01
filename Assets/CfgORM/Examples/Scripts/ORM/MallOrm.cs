using System.Collections.Generic;

namespace Database {

    public partial class MallOrm {
        private static readonly IDictionary<int, MallOrm> m_idCache = new Dictionary<int, MallOrm>();       
        
        /// <summary>
        /// 商城索引。
        /// </summary>
        public readonly int Index;

        /// <summary>
        /// 物品Id。
        /// </summary>
        public readonly double Itemid;

        /// <summary>
        /// 物品类型。
        /// </summary>
        public readonly sbyte ItemType;

        /// <summary>
        /// 货币类型。
        /// </summary>
        public readonly char PriceType;

        /// <summary>
        /// 价格。
        /// </summary>
        public readonly float Price;

        /// <summary>
        /// 剩余数量。
        /// </summary>
        public readonly float LeftNum;

        /// <summary>
        /// 分页。
        /// </summary>
        public readonly int Page;

        /// <summary>
        /// 位置(0-3)。
        /// </summary>
        public readonly float Postion;

        /// <summary>
        /// 是否限购。
        /// </summary>
        public readonly string IsPurLimit;

        /// <summary>
        /// 限购次数。
        /// </summary>
        public readonly float PurCount;

        /// <summary>
        /// 是否提示。
        /// </summary>
        public readonly double IsTips;

        /// <summary>
        /// 提示描述。
        /// </summary>
        public readonly double TipsDes;

        /// <summary>
        /// 商品描述。
        /// </summary>
        public readonly double Description;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Mall", m_idCache );
        }

        public static MallOrm Get( int id ) {
            MallOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}