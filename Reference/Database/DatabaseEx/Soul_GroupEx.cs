
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
    public partial class Soul_GroupEx {
        static Soul_GroupEx() {
            OnLoadComplexField_skillIds = Soul_Group.OnLoadComplexField_skillIds;
        }
    }

    public partial class Soul_Group {

        public TArray<int> skillIds;

        internal static void OnLoadComplexField_skillIds( Soul_Group data, LuaDatabase.Query q ) {
            data.skillIds = Soul_GroupEx.IsValid_skillIds ? Dataset.LoadIntArray( "skillIds", q ) : __default.skillIds;
        }
    }
}
