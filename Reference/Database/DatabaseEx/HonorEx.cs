
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
    public partial class HonorEx {
        static HonorEx() {
            OnLoadComplexField_item = Honor.onLoadComplexField_item;
            OnLoadComplexField_prop = Honor.onLoadComplexField_prop;
        }
    }

    public partial class Honor {
        TArray<int> m_item = null;
        public TArray<int> item { get { return m_item; } }

        private TArray<TArray<int>> m_prop;
        public TArray<TArray<int>> prop { get { return m_prop; } set { m_prop = value; } }

        internal static void onLoadComplexField_item( Honor data, LuaDatabase.Query q ) {
            data.m_item = HonorEx.IsValid_item ? Dataset.LoadIntArray( "item", q ) : __default.m_item;
        }

        internal static void onLoadComplexField_prop( Honor data, LuaDatabase.Query q ) {
            data.m_prop = HonorEx.IsValid_prop ? Dataset.LoadIntArray2d( "prop", q ) : __default.m_prop;
        }
    }
}
