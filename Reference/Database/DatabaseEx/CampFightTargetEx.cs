
using System;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
#endif

namespace Database {
    public partial class CampFightTargetEx {
        static CampFightTargetEx() {
            OnLoadComplexField_rewred = CampFightTarget._OnLoadComplexField_rewred;
        }
    }

    /*
     * 0 表示胜利
     * 1 表示击杀
     * 2 表示助攻
     * 3 表示积分奖励
     * 4 表示失败奖励
     * 5 表示平局奖励
     */
    public enum TCampFightTarget {
        Win     = 0,
        Kill    = 1,
        Assist  = 2,
        Score   = 3,
        Lose    = 4,
        Equal   = 5,
    }


    public partial class CampFightTarget {
        public class Reward {
            public int item_id;
            public int num;
        }
        List<Reward> m_rewards = new List<Reward>();

        public List<Reward> rewards {
            get { return m_rewards; }
        }

        internal static void _OnLoadComplexField_rewred( CampFightTarget data, LuaDatabase.Query q ) {
            if ( CampFightTargetEx.IsValid_rewred ) {
                var tmp = Dataset.LoadIntArray( "rewred", q );
                if ( tmp.Length > 0 ) {
                    Reward reward = new Reward();
                    reward.item_id = tmp[0];
                    reward.num = tmp.Length > 1 ? tmp[1] : 1;
                    data.m_rewards.Add( reward );
                }
            } else {
                data.m_rewards = __default.rewards;
            }
        }
    }
}
