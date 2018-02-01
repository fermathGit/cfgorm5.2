using System.Collections.Generic;

namespace Database {

    public partial class ItemsOrm {
        private static readonly IDictionary<int, ItemsOrm> m_idCache = new Dictionary<int, ItemsOrm>();       
        
        /// <summary>
        /// index。
        /// </summary>
        public readonly int Index;

        /// <summary>
        /// ID。
        /// </summary>
        public readonly bool ID;

        /// <summary>
        /// 名称。
        /// </summary>
        public readonly bool Name;

        /// <summary>
        /// 道具类型。
        /// </summary>
        public readonly bool Itemtype;

        /// <summary>
        /// 小类型。
        /// </summary>
        public readonly bool Mintype;

        /// <summary>
        /// 品质。
        /// </summary>
        public readonly bool Quality;

        /// <summary>
        /// 货币类型。
        /// </summary>
        public readonly bool Deal;

        /// <summary>
        /// 堆叠上限。
        /// </summary>
        public readonly bool PileMax;

        /// <summary>
        /// 可否使用。
        /// </summary>
        public readonly bool IsUse;

        /// <summary>
        /// 条件。
        /// </summary>
        public readonly bool UseCondition;

        /// <summary>
        /// 使用结果。
        /// </summary>
        public readonly string UseResult;

        /// <summary>
        /// 有效时长。
        /// </summary>
        public readonly short EffectSeconds;

        /// <summary>
        /// 道具类别编号(道具掉落，宝箱相关)。
        /// </summary>
        public readonly long ItemNumber;

        /// <summary>
        /// 权重。
        /// </summary>
        public readonly int Weight;

        /// <summary>
        /// 图标。
        /// </summary>
        public readonly long Icon;

        /// <summary>
        /// 图集名称。
        /// </summary>
        public readonly short AtlasName;

        /// <summary>
        /// 功能说明。
        /// </summary>
        public readonly string Tips;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Items", m_idCache );
        }

        public static ItemsOrm Get( int id ) {
            ItemsOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}