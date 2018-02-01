using System.Collections.Generic;

namespace Database {

    public partial class NfroleOrm {
        private static readonly IDictionary<int, NfroleOrm> m_idCache = new Dictionary<int, NfroleOrm>();       
        
        /// <summary>
        /// index。
        /// </summary>
        public readonly int Index;

        /// <summary>
        /// ID。
        /// </summary>
        public readonly long Id;

        /// <summary>
        /// 名字。
        /// </summary>
        public readonly short Name;

        /// <summary>
        /// 生命值。
        /// </summary>
        public readonly float Hp;

        /// <summary>
        /// 法力值。
        /// </summary>
        public readonly int Mp;

        /// <summary>
        /// 怒气值。
        /// </summary>
        public readonly ushort AngerValue;

        /// <summary>
        /// 物理攻击力。
        /// </summary>
        public readonly int PAttack;

        /// <summary>
        /// 法术攻击力。
        /// </summary>
        public readonly int MAttack;

        /// <summary>
        /// 物理防御力。
        /// </summary>
        public readonly long PDefence;

        /// <summary>
        /// 法术防御力。
        /// </summary>
        public readonly uint MDefence;

        /// <summary>
        /// 暴击值。
        /// </summary>
        public readonly string CritRate;

        /// <summary>
        /// 暴击伤害值。
        /// </summary>
        public readonly int CritHurt;

        /// <summary>
        /// 免爆值。
        /// </summary>
        public readonly double BlockDefence;

        /// <summary>
        /// 僵直值。
        /// </summary>
        public readonly float StiffValues;

        /// <summary>
        /// 攻击频率。
        /// </summary>
        public readonly double AttackSpeed;

        /// <summary>
        /// 移动速度。
        /// </summary>
        public readonly int MoveSpeed;

        /// <summary>
        /// 带队范围。
        /// </summary>
        public readonly int TeamRage;

        /// <summary>
        /// 模型id。
        /// </summary>
        public readonly double Modelid;

        /// <summary>
        /// 音效。
        /// </summary>
        public readonly double Audio;

        /// <summary>
        /// 伙伴头像。
        /// </summary>
        public readonly double Headicon;

        /// <summary>
        /// 受击半径。
        /// </summary>
        public readonly float Attackedradius;

        /// <summary>
        /// 武器1。
        /// </summary>
        public readonly double[] Weapon;

        /// <summary>
        /// 半身像。
        /// </summary>
        public readonly double HalfRole;

        /// <summary>
        /// 半身像图集。
        /// </summary>
        public readonly int HalfRoleAtlas;

        #region method
        public static void Load() {
            CfgManager.LoadResource( "Nfrole", m_idCache );
        }

        public static NfroleOrm Get( int id ) {
            NfroleOrm data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }
        
        public static ICollection<int> GetKeys() {
            return m_idCache.Keys;
        }
        #endregion
    }
}