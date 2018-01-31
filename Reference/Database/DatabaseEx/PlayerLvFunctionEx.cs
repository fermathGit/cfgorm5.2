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
    public partial class PlayerLvFunctionEx {
        static PlayerLvFunctionEx()
        {
            OnLoadComplexField_equip_wash_gold = PlayerLvFunction.OnLoadComplexField_equip_wash_gold;
            OnLoadComplexField_skill_lvup_item = PlayerLvFunction.LoadComplexField_skill_lvup_item;
        }
    }

    public partial class PlayerLvFunction {
        TArray<int> equip_wash_gold = new TArray<int>( new int[ 2 ] );
        TArray<int> m_lvup_item = null;

        public TArray<int> equipwashgold {
            get {
                return equip_wash_gold;
            }
        }

        public TArray<int> GetLvUpItem() {
            return m_lvup_item;
        }

        internal static void OnLoadComplexField_equip_wash_gold( PlayerLvFunction data, LuaDatabase.Query q ) {
            data.equip_wash_gold = PlayerLvFunctionEx.IsValid_equip_wash_gold ? Dataset.LoadIntArray( "equip_wash_gold", q ) : __default.equip_wash_gold;
        }

        public static void LoadComplexField_skill_lvup_item( PlayerLvFunction data, LuaDatabase.Query q ) {
            data.m_lvup_item = PlayerLvFunctionEx.IsValid_skill_lvup_item ? Dataset.LoadIntArray( "skill_lvup_item", q ) : __default.m_lvup_item;
        }
    }
}
