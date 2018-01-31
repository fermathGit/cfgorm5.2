
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
    public partial class Girl_UI_ShowEx {
        static Girl_UI_ShowEx() {
            OnLoadComplexField_Ornam = Girl_UI_Show.OnLoadComplexField_Ornam;
        }
    }


    public partial class Girl_UI_Show {

        public TArray<int> Ornam;

        internal static void OnLoadComplexField_Ornam( Girl_UI_Show data, LuaDatabase.Query q ) {
            data.Ornam = Girl_UI_ShowEx.IsValid_Ornam ? Dataset.LoadIntArray( "Ornam", q ) : __default.Ornam;
        }


    }
}
