
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
    public partial class TaskMasterEx {
        static TaskMasterEx() {
            OnLoadComplexField_reward_item = TaskMaster.onLoadComplexField_reward_item;
        }
    }

    public partial class TaskMaster {
        private TArray<int> m_rewardItem;
        public TArray<int> rewardItem { get { return m_rewardItem; } }

        internal static void onLoadComplexField_reward_item( TaskMaster data, LuaDatabase.Query q ) {
            data.m_rewardItem = TaskMasterEx.IsValid_reward_item ? Dataset.LoadIntArray( "reward_item", q ) : __default.rewardItem;
        }
    }
}
