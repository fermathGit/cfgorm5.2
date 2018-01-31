
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
     public partial class Guild_InformationEx {
        static Guild_InformationEx() {
            OnLoadComplexField_Guildinfor_proper = Guild_Information.OnLoadComplexField_Guildinfor_proper;
            OnLoadComplexField_Guildinfor_wages = Guild_Information.OnLoadComplexField_Guildinfor_wages;
        }
    }
     public partial class Guild_Information {
        TArray<TArray<int>> m_Guildinfor_proper;
        public TArray<TArray<int>> Guildinfor_proper { get { return m_Guildinfor_proper; } }
        TArray<TArray<int>> m_Guildinfor_wages;
        public TArray<TArray<int>> Guildinfor_wages { get { return m_Guildinfor_wages; } }
        internal static void OnLoadComplexField_Guildinfor_proper( Guild_Information data, LuaDatabase.Query q ) {
            data.m_Guildinfor_proper = Guild_InformationEx.IsValid_Guildinfor_proper ? Dataset.LoadIntArray2d( "Guildinfor_proper", q ) : __default.m_Guildinfor_proper;
        }
        internal static void OnLoadComplexField_Guildinfor_wages( Guild_Information data, LuaDatabase.Query q ) {
            data.m_Guildinfor_wages = Guild_InformationEx.IsValid_Guildinfor_wages ? Dataset.LoadIntArray2d( "Guildinfor_wages", q ) : __default.m_Guildinfor_wages;
        }
    }
}
