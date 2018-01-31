
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
    public partial class GirlBlessEx {
        static GirlBlessEx() {
            OnLoadComplexField_att = GirlBless.OnLoadComplexField_att;
        }
    }


    public partial class GirlBless {

        public TArray<TArray<double>> att;

        internal static void OnLoadComplexField_att( GirlBless data, LuaDatabase.Query q ) {
            data.att = GirlBlessEx.IsValid_att ? Dataset.LoadNumberArray2d( "att", q ) : __default.att;
        }


    }
}
