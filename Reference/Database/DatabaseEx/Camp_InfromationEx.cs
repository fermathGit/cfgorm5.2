
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
    public partial class Camp_InfromationEx {
        static Camp_InfromationEx() {
            OnLoadComplexField_Campinf_proper = Camp_Infromation.OnLoadComplexField_Campinf_proper;
            OnLoadComplexField_Campinf_wages = Camp_Infromation.OnLoadComplexField_Campinf_wages;
        }
    }

    public partial class Camp_Infromation {
        TArray<TArray<int>> m_Campinfor_proper;
        public TArray<TArray<int>> Campinfor_proper { get { return m_Campinfor_proper; } }
        TArray<TArray<int>> m_Campinf_wages;
        public TArray<TArray<int>> Campinf_wages { get { return m_Campinf_wages; } }

        internal static void OnLoadComplexField_Campinf_proper( Camp_Infromation data, LuaDatabase.Query q ) {
            data.m_Campinfor_proper = Camp_InfromationEx.IsValid_Campinf_proper ? Dataset.LoadIntArray2d( "Campinf_proper", q ) : __default.Campinfor_proper;
        }
        internal static void OnLoadComplexField_Campinf_wages( Camp_Infromation data, LuaDatabase.Query q ) {
            data.m_Campinf_wages = Camp_InfromationEx.IsValid_Campinf_wages ? Dataset.LoadIntArray2d( "Campinf_wages", q ) : __default.Campinf_wages;
        }
    }
}
