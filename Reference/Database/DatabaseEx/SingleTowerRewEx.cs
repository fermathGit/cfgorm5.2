
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
    public partial class SingleTowerRewEx {
        static SingleTowerRewEx() {
            OnLoadComplexField_star_rew = SingleTowerRew.OnLoadComplexField_star_rew;
        }
    }


    public partial class SingleTowerRew {

        public TArray<TArray<int>> star_rew;

        internal static void OnLoadComplexField_star_rew( SingleTowerRew data, LuaDatabase.Query q ) {
            data.star_rew = SingleTowerRewEx.IsValid_star_rew ? Dataset.LoadIntArray2d( "star_rew", q ) : __default.star_rew;
        }

    }
}
