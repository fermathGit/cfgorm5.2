
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
    public partial class Pet_EquipEx {
        static Pet_EquipEx() {
            OnLoadComplexField_needItemes = Pet_Equip.OnLoadComplexField_needItemes;
            OnLoadComplexField_attes = Pet_Equip.OnLoadComplexField_attes;
        }
    }


    public partial class Pet_Equip {
        TArray<TArray<int>> m_needEquipIdes;
        public TArray<TArray<int>> needEquipIdes { get { return m_needEquipIdes; } }
        internal static void OnLoadComplexField_needItemes( Pet_Equip data, LuaDatabase.Query q ) {
            data.m_needEquipIdes = Pet_EquipEx.IsValid_needItemes ? Dataset.LoadIntArray2d( "needItemes", q ) : __default.m_needEquipIdes;
        }

        TArray<TArray<Double>> m_attes;
        public TArray<TArray<Double>> attes { get { return m_attes; } }
        internal static void OnLoadComplexField_attes( Pet_Equip data, LuaDatabase.Query q ) {
            data.m_attes = Pet_EquipEx.IsValid_attes ? Dataset.LoadNumberArray2d( "attes", q ) : __default.m_attes;
        }
    }
}
