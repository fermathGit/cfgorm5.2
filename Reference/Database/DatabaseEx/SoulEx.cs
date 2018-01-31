
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
    public partial class SoulEx {
        static SoulEx() {
            OnLoadComplexField_needConditiones = Soul.OnLoadComplexField_needConditiones;
            OnLoadComplexField_activeSkillId = Soul.OnLoadComplexField_activeSkillId;
            OnLoadComplexField_attributes = Soul.OnLoadComplexField_attributes;
            OnLoadComplexField_attributes_special = Soul.OnLoadComplexField_attributes_special;
        }
    }


    public partial class Soul {

        public TArray<TArray<int>> m_needConditiones;

        internal static void OnLoadComplexField_needConditiones( Soul data, LuaDatabase.Query q ) {
            data.m_needConditiones = SoulEx.IsValid_needConditiones ? Dataset.LoadIntArray2d( "needConditiones", q ) : __default.m_needConditiones;
        }

        public TArray<TArray<int>> m_activeSkillId;

        internal static void OnLoadComplexField_activeSkillId( Soul data, LuaDatabase.Query q ) {
            data.m_activeSkillId = SoulEx.IsValid_activeSkillId ? Dataset.LoadIntArray2d( "activeSkillId", q ) : __default.m_activeSkillId;
        }

        public TArray<TArray<double>> m_attributes;

        internal static void OnLoadComplexField_attributes( Soul data, LuaDatabase.Query q ) {
            data.m_attributes = SoulEx.IsValid_attributes ? Dataset.LoadNumberArray2d( "attributes", q ) : __default.m_attributes;
        }

        public TArray<TArray<double>> m_attributes_special;

        internal static void OnLoadComplexField_attributes_special( Soul data, LuaDatabase.Query q ) {
            data.m_attributes_special = SoulEx.IsValid_attributes_special ? Dataset.LoadNumberArray2d( "attributes_special", q ) : __default.m_attributes_special;
        }
    }
}
