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
using Network.Messages;
using GwScene;
#endif

namespace Database {
    public partial class GuildTaskRewEx {
        static GuildTaskRewEx() {
            OnLoadComplexField_Guildta_reward = GuildTaskRew.onLoadComplexField_Guildta_reward;
        }
    }

    public partial class GuildTaskRew{
        TArray<TArray<int>> m_guildtaReward = null;
        public TArray<TArray<int>> rewardItems {
            get { return m_guildtaReward; }
        }

        internal static void onLoadComplexField_Guildta_reward( GuildTaskRew data, LuaDatabase.Query q ) {
            data.m_guildtaReward = GuildTaskRewEx.IsValid_Guildta_reward ? Dataset.LoadIntArray2d( "Guildta_reward", q ) : __default.m_guildtaReward;
        }

}
}
