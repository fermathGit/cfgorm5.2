
using System;
using System.Collections.Generic;
using Common;
using UniLuax;
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
    public partial class UndergroundTaskEx {
        static UndergroundTaskEx() {
            OnLoadComplexField_itemList = UndergroundTask.onLoadComplexField_itemList;
        }
    }

    public partial class UndergroundTask {
        private TArray<TArray<int>> m_itemList;
        public TArray<TArray<int>> itemList { get { return m_itemList; } set { m_itemList = value; } }

        internal static void onLoadComplexField_itemList( UndergroundTask data, LuaDatabase.Query q ) {
            data.m_itemList = UndergroundTaskEx.IsValid_itemList ? Dataset.LoadIntArray2d( "itemList", q ) : __default.m_itemList;
        }
    }
}
