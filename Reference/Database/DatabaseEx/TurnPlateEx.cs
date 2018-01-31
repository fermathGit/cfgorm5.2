
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
    //奖励类型:
    public enum ETurnPlateRewardType {
        Gold = 1,// 1：金币
        Ingot = 2,//2：元宝
        Coupons = 3,//3：绑元
        Item = 4,//4：道具
    }

    public partial class TurnPlateEx {
        static TurnPlateEx() {
            OnLoadComplexField_reward = TurnPlate.onLoadComplexField_reward;
			OnLoadComplexField_weight = TurnPlate.onLoadComplexField_weight;
            OnLoadComplexField_pile = TurnPlate.onLoadComplexField_pile;
        }
    }

    public partial class TurnPlate {
        private TArray<int> m_pile;
        private TArray<int> m_reward;
        private TArray<double> m_weight;
        private int m_maxVal = -1;

        public TArray<int> pile { get { return m_pile; } }
        public TArray<int> reward { get { return m_reward; }  }
        public TArray<double> weight { get { return m_weight; }  }

        public int GetMaxReward(){
            if ( m_maxVal < 0 ) {
                if ( m_reward != null && m_reward.Length > 0 ) {
                    for (int i = 0; i < m_reward.Length; ++i ) {
                        if (m_reward[i] > m_maxVal ) {
                            m_maxVal = m_reward[i];
                        }
                    }
                }
            }
            return m_maxVal;
        }

        internal static void onLoadComplexField_reward( TurnPlate data, LuaDatabase.Query q ) {
            data.m_reward = TurnPlateEx.IsValid_reward ? Dataset.LoadIntArray( "reward", q ) : __default.reward;
        }
		
		internal static void onLoadComplexField_weight( TurnPlate data, LuaDatabase.Query q ) {
           data.m_weight = TurnPlateEx.IsValid_weight ? Dataset.LoadNumberArray( "weight", q ) : __default.weight;
        }

        internal static void onLoadComplexField_pile( TurnPlate data, LuaDatabase.Query q ) {
            data.m_pile = TurnPlateEx.IsValid_pile ? Dataset.LoadIntArray( "pile", q ) : __default.pile;
        }
    }
}
