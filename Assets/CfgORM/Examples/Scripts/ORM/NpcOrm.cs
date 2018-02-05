using System.Collections.Generic;

namespace Database {

    public partial class NpcOrm {
        private static readonly IDictionary<int, NpcOrm> m_idCache = new Dictionary<int, NpcOrm>();
        public static IDictionary<int, NpcOrm> datas { get { return m_idCache; } }       
        
        /// <summary>
        /// id。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 类型。
        /// </summary>
        public readonly string Type;

        /// <summary>
        /// 名字。
        /// </summary>
        public readonly long Name;

        /// <summary>
        /// 属于主城。
        /// </summary>
        public readonly short Ownercity;

        /// <summary>
        /// 默认对话。
        /// </summary>
        public readonly long Desc;

        /// <summary>
        /// 旋转点。
        /// </summary>
        public readonly long Attention;

        /// <summary>
        /// 出生坐标。
        /// </summary>
        public readonly sbyte Position;

        /// <summary>
        /// 模型ID。
        /// </summary>
        public readonly long Model;

        /// <summary>
        /// 半身像id。
        /// </summary>
        public readonly sbyte Halficon;

        /// <summary>
        /// 半身像图集。
        /// </summary>
        public readonly sbyte Halftatlas;

        /// <summary>
        /// 随机移动点。
        /// </summary>
        public readonly int[] Point;

        /// <summary>
        /// 移动最大停顿时间。
        /// </summary>
        public readonly long MoveStopTime;

        /// <summary>
        /// 间隔对话时间。
        /// </summary>
        public readonly short DialogTime;

        /// <summary>
        /// 随机对话。
        /// </summary>
        public readonly char DialogDesc;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Npc", m_idCache );
        }

        public static NpcOrm Get( int id ) {
            NpcOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        #endregion
    }
}