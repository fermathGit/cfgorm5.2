
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
    public partial class DailyGroupEx {
        static DailyGroupEx() {
            OnLoadComplexField_itemshow = DailyGroup.OnLoadComplexField_itemshow;
        }
    }

    public partial class DailyGroup {
        public TArray<int> itemshow;

        internal static void OnLoadComplexField_itemshow( DailyGroup data, LuaDatabase.Query q ) {
            data.itemshow = Dataset.LoadIntArray( "itemshow", q );
        }
    }
}
