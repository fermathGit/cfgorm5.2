
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
    public partial class RecoverEx {
        static RecoverEx() {
            OnLoadComplexField_reward_1_pay_drop = Recover.onLoadComplexField_reward_1_pay_drop;
            OnLoadComplexField_reward_2_pay_drop = Recover.onLoadComplexField_reward_2_pay_drop;
        }
    }

    public partial class Recover {
        private TArray<TArray<int>> m_reward_1_pay_drop;
        private TArray<TArray<int>> m_reward_2_pay_drop;
        public TArray<TArray<int>> reward_1_pay_drop { get { return m_reward_1_pay_drop; } set { m_reward_1_pay_drop = value; } }
        public TArray<TArray<int>> reward_2_pay_drop { get { return m_reward_2_pay_drop; } set { m_reward_2_pay_drop = value; } }

        internal static void onLoadComplexField_reward_1_pay_drop( Recover data, LuaDatabase.Query q ) {
            data.m_reward_1_pay_drop = RecoverEx.IsValid_reward_1_pay_drop ? Dataset.LoadIntArray2d( "reward_1_pay_drop", q ) : __default.m_reward_1_pay_drop;
        }

        internal static void onLoadComplexField_reward_2_pay_drop( Recover data, LuaDatabase.Query q ) {
            data.m_reward_2_pay_drop = RecoverEx.IsValid_reward_2_pay_drop ? Dataset.LoadIntArray2d( "reward_2_pay_drop", q ) : __default.m_reward_2_pay_drop;
        }
    }
}
