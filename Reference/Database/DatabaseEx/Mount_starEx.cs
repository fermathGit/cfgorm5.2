using System;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
using LuaTableHandle = System.Int64;
using LuaStateHandle = System.IntPtr;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaTableHandle = System.Object;
using LuaStateHandle = UniLua.ILuaState;
#endif

namespace Database {
    public partial class Mount_star {
        private TArray<int> m_chip_item = null;
        public TArray<int> chip_item { get { return m_chip_item; } set { m_chip_item = value; } }


        internal static void onLoadComplexField_chip_item( Mount_star data, LuaDatabase.Query q ) {
            data.m_chip_item = Mount_starEx.IsValid_chip_item ? Dataset.LoadIntArray( "chip_item", q ) : __default.m_chip_item;
        }
    }
    public partial class Mount_starEx {
        static Mount_starEx() {
            OnLoadComplexField_chip_item = Mount_star.onLoadComplexField_chip_item;
        }
    }
}
