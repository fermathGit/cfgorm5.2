
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
    public partial class Pet_StarEx {
        static Pet_StarEx() {
            OnLoadComplexField_attes = Pet_Star.OnLoadComplexField_attes;
        }
    }

    public partial class Pet_Star {
        TArray<TArray<double>> m_attes;
        public TArray<TArray<double>> attes { get { return m_attes; } }
        internal static void OnLoadComplexField_attes( Pet_Star data, LuaDatabase.Query q ) {
            data.m_attes = Pet_StarEx.IsValid_attes ? Dataset.LoadNumberArray2d( "attes", q ) : __default.attes;
        }
    }
}
