
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
    public partial class Gem_BonusEx {
        static Gem_BonusEx() {
            OnLoadComplexField_bonus_prop = Gem_Bonus.OnLoadComplexField_bonus_prop;
        }
    }
    public partial class Gem_Bonus {
        TArray<TArray<double>> m_gemValue;
        public TArray<TArray<double>> GemValue { get { return m_gemValue; } }
        internal static void OnLoadComplexField_bonus_prop( Gem_Bonus data, LuaDatabase.Query q ) {
            data.m_gemValue = Gem_BonusEx.IsValid_bonus_prop ? Dataset.LoadNumberArray2d( "bonus_prop", q ) : __default.m_gemValue;
        }
    }
}
