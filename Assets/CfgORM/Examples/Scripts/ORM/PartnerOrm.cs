using System.Collections.Generic;

namespace Database {

    public partial class PartnerOrm {
        private static readonly IDictionary<int, PartnerOrm> m_idCache = new Dictionary<int, PartnerOrm>();
        public static IDictionary<int, PartnerOrm> datas { get { return m_idCache; } }       
        
        /// <summary>
        /// 索引。
        /// </summary>
        public readonly int Index;

        /// <summary>
        /// ID。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 名字。
        /// </summary>
        public readonly float Name;

        /// <summary>
        /// 最大等级。
        /// </summary>
        public readonly decimal MaxLv;

        /// <summary>
        /// 最大强化等级。
        /// </summary>
        public readonly float MaxStrengthLv;

        /// <summary>
        /// 升阶花费。
        /// </summary>
        public readonly double StrenghtCost;

        /// <summary>
        /// 阵营。
        /// </summary>
        public readonly double Camp;

        /// <summary>
        /// 品质。
        /// </summary>
        public readonly long Star;

        /// <summary>
        /// 招募需要碎片。
        /// </summary>
        public readonly decimal Piece;

        /// <summary>
        /// 普攻ID。
        /// </summary>
        public readonly long ComboId;

        /// <summary>
        /// 技能ID。
        /// </summary>
        public readonly int SkillId;

        /// <summary>
        /// 五行。
        /// </summary>
        public readonly decimal Fiveline;

        /// <summary>
        /// 权重。
        /// </summary>
        public readonly double Weight;

        /// <summary>
        /// 羁绊ID。
        /// </summary>
        public readonly short Connection;

        /// <summary>
        /// 获得途径。
        /// </summary>
        public readonly int Getmode;

        /// <summary>
        /// 生命值。
        /// </summary>
        public readonly decimal Hp;

        /// <summary>
        /// 法力值。
        /// </summary>
        public readonly double Mp;

        /// <summary>
        /// 物理攻击力。
        /// </summary>
        public readonly float PAttack;

        /// <summary>
        /// 法术攻击力。
        /// </summary>
        public readonly int MAttack;

        /// <summary>
        /// 物理防御力。
        /// </summary>
        public readonly int PDefence;

        /// <summary>
        /// 法术防御力。
        /// </summary>
        public readonly int MDefence;

        /// <summary>
        /// 暴击值。
        /// </summary>
        public readonly int CritRate;

        /// <summary>
        /// 暴击伤害值。
        /// </summary>
        public readonly int CritHurt;

        /// <summary>
        /// 免爆值。
        /// </summary>
        public readonly float BlockDefence;

        /// <summary>
        /// 僵直值。
        /// </summary>
        public readonly decimal StiffValues;

        /// <summary>
        /// 攻击频率。
        /// </summary>
        public readonly bool AttackSpeed;

        /// <summary>
        /// 移动速度。
        /// </summary>
        public readonly bool MoveSpeed;

        /// <summary>
        /// 职业。
        /// </summary>
        public readonly bool Profession;

        /// <summary>
        /// 模型高度比例。
        /// </summary>
        public readonly string ModelRatio;

        /// <summary>
        /// 伙伴头像。
        /// </summary>
        public readonly uint Headicon;

        /// <summary>
        /// 模型id。
        /// </summary>
        public readonly string Modelid;

        /// <summary>
        /// 站立模型id。
        /// </summary>
        public readonly uint StandAnim;

        /// <summary>
        /// 伙伴图集。
        /// </summary>
        public readonly string AtlasName;

        /// <summary>
        /// 伙伴半身像。
        /// </summary>
        public readonly ushort HalfParther;

        /// <summary>
        /// 伙伴半身像图集。
        /// </summary>
        public readonly ushort HalfPartherAtlas;

        /// <summary>
        /// 伙伴介绍。
        /// </summary>
        public readonly ushort Description;

        /// <summary>
        /// 副本头像位置。
        /// </summary>
        public readonly ushort CopyHeadPos;

        /// <summary>
        /// 副本头像大小。
        /// </summary>
        public readonly ushort CopyHeadScale;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Partner", m_idCache );
        }

        public static PartnerOrm Get( int id ) {
            PartnerOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        #endregion
    }
}