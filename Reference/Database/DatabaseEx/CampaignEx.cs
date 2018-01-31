//=============================================================================
// DO NOT MODIFY THIS FILE MANUALLY!!
// THIS FILE IS GENERATED BY LUA DATABASE TOOL.
// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.
//=============================================================================

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
    public partial class CampaignEx {
        static CampaignEx() {
            OnLoadComplexField_reward = Campaign.onLoadComplexField_reward;
        }
    }

    public partial class Campaign {
        private TArray<TArray<int>> m_rewards = null;

        public TArray<TArray<int>> rewards { get { return m_rewards; } }


        internal static void onLoadComplexField_reward( Campaign data, LuaDatabase.Query q ) {
            data.m_rewards = CampaignEx.IsValid_reward ? Dataset.LoadIntArray2d( "reward", q ) : __default.m_rewards;
        }
    }
}
//EOF
