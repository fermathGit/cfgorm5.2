
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
    public partial class GrowupRewardEx {
        static GrowupRewardEx() {
            OnLoadComplexField_rewardItem = GrowupReward.onLoadComplexField_rewardItem;
        }
    }

    public partial class GrowupReward {
        private TArray<TArray<int>> m_rewardItem;
        public TArray<TArray<int>> rewardItem { get { return m_rewardItem; }  }


        internal static void onLoadComplexField_rewardItem( GrowupReward data, LuaDatabase.Query q ) {
            data.m_rewardItem = GrowupRewardEx.IsValid_rewardItem ? Dataset.LoadIntArray2d( "rewardItem", q ) : __default.rewardItem;
        }

    }
}
