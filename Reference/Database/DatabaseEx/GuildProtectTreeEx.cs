
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
    public partial class GuildProtectTreeEx {
        static GuildProtectTreeEx() {
            OnLoadComplexField_boss = GuildProtectTree.onLoadComplexField_boss;
        }
    }

    public partial class GuildProtectTree {
        TArray<int> m_boss = null;
        public TArray<int> bossInfo {
            get { return m_boss; }
        }

        public int bossID {
            get { return m_boss.Length > 0 ? m_boss[0] : 0; }
        }

        internal static void onLoadComplexField_boss( GuildProtectTree data, LuaDatabase.Query q ) {
            data.m_boss = GuildProtectTreeEx.IsValid_boss ? Dataset.LoadIntArray( "boss", q ) : __default.m_boss;
        }
    }
}
