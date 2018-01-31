
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
    public partial class DailyRewardEx {
        static DailyRewardEx() {
            OnLoadComplexField_show_reward = DailyReward.OnLoadComplexField_show_reward;
        }
    }


    public partial class DailyReward {

        public TArray<TArray<int>> show_reward;

        internal static void OnLoadComplexField_show_reward( DailyReward data, LuaDatabase.Query q ) {
            data.show_reward = DailyRewardEx.IsValid_show_reward ? Dataset.LoadIntArray2d( "show_reward", q ) : __default.show_reward;
        }
    }
}
