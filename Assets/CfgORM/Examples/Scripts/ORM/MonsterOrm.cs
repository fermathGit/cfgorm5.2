using System.Collections.Generic;

namespace Database {

    public partial class MonsterOrm {
        private static readonly IDictionary<int, MonsterOrm> m_idCache = new Dictionary<int, MonsterOrm>();       
        
        /// <summary>
        /// 怪物编号。
        /// </summary>
        public readonly int Id;

        /// <summary>
        /// 怪物名称。
        /// </summary>
        public readonly short Name;

        /// <summary>
        /// 怪物分类。
        /// </summary>
        public readonly int Type;

        /// <summary>
        /// 职业。
        /// </summary>
        public readonly float Career;

        /// <summary>
        /// 任务掉落。
        /// </summary>
        public readonly float Taskdrop;

        /// <summary>
        /// 任务关卡。
        /// </summary>
        public readonly float TaskID;

        /// <summary>
        /// 生命值。
        /// </summary>
        public readonly double Hp;

        /// <summary>
        /// 法力值。
        /// </summary>
        public readonly double Mp;

        /// <summary>
        /// 怒气值。
        /// </summary>
        public readonly float AngerValue;

        /// <summary>
        /// 物理攻击力。
        /// </summary>
        public readonly sbyte PAttack;

        /// <summary>
        /// 法术攻击力。
        /// </summary>
        public readonly decimal MAttack;

        /// <summary>
        /// 物理防御力。
        /// </summary>
        public readonly int PDefence;

        /// <summary>
        /// 法术防御力。
        /// </summary>
        public readonly double MDefence;

        /// <summary>
        /// 暴击值。
        /// </summary>
        public readonly double CritRate;

        /// <summary>
        /// 暴击伤害值。
        /// </summary>
        public readonly double CritHurt;

        /// <summary>
        /// 免爆值。
        /// </summary>
        public readonly decimal BlockDefence;

        /// <summary>
        /// 僵硬值。
        /// </summary>
        public readonly decimal StiffValues;

        /// <summary>
        /// 攻击频率。
        /// </summary>
        public readonly double AttackSpeed;

        /// <summary>
        /// 移动速度。
        /// </summary>
        public readonly float MoveSpeed;

        /// <summary>
        /// 模型资源ID。
        /// </summary>
        public readonly double Modelid;

        /// <summary>
        /// 特效倍率。
        /// </summary>
        public readonly decimal EffectScale;

        /// <summary>
        /// 模型倍率。
        /// </summary>
        public readonly decimal ModelScale;

        /// <summary>
        /// ui倍率。
        /// </summary>
        public readonly byte UiScale;

        /// <summary>
        /// 死亡模型数量。
        /// </summary>
        public readonly char Deathnum;

        /// <summary>
        /// 模型资源ID。
        /// </summary>
        public readonly byte[] Deathid;

        /// <summary>
        /// 怪物技能ID。
        /// </summary>
        public readonly uint[] SkillID;

        /// <summary>
        /// 怪物类型。
        /// </summary>
        public readonly ushort MonsterType;

        /// <summary>
        /// 头像资源。
        /// </summary>
        public readonly uint HeadIcon;

        /// <summary>
        /// 音效。
        /// </summary>
        public readonly ushort Audio;

        /// <summary>
        /// 半身像。
        /// </summary>
        public readonly ushort HalfRole;

        /// <summary>
        /// 半身像图集。
        /// </summary>
        public readonly ushort Halfroleatlas;

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
            CfgManager.LoadResource( "Monster", m_idCache );
        }

        public static MonsterOrm Get( int id ) {
            MonsterOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}