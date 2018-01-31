
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
    public partial class Camp_RewEx {
        static Camp_RewEx() {
            OnLoadComplexField_rew_item = Camp_Rew.OnLoadComplexField_rew_item;
        }
    }


    public partial class Camp_Rew {

        public TArray<TArray<int>> m_rew_item;

        internal static void OnLoadComplexField_rew_item( Camp_Rew data, LuaDatabase.Query q ) {
            data.m_rew_item = Camp_RewEx.IsValid_rew_item ? Dataset.LoadIntArray2d( "rew_item", q ) : __default.m_rew_item;
        }
    }
}
