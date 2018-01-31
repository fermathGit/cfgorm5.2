
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
    public partial class WarnTipsEx {
        static WarnTipsEx() {
            OnLoadComplexField_colour = WarnTips.OnLoadComplexField_colour;
        }
    }


    public partial class WarnTips {

        public TArray<int> m_colour;

        internal static void OnLoadComplexField_colour( WarnTips data, LuaDatabase.Query q ) {
            data.m_colour = WarnTipsEx.IsValid_colour ? Dataset.LoadIntArray( "colour", q ) : __default.m_colour;
        }

    }
}
