
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
    public partial class SngleTowerEx {
        static SngleTowerEx() {
            OnLoadComplexField_floor_firstrew = SngleTower.OnLoadComplexField_floor_firstrew;
            OnLoadComplexField_floor_twostar_rew = SngleTower.OnLoadComplexField_floor_twostar_rew;
            OnLoadComplexField_floor_thistar_rew = SngleTower.OnLoadComplexField_floor_thistar_rew;
            OnLoadComplexField_star_condition = SngleTower.OnLoadComplexField_star_condition;
            OnLoadComplexField_special_show = SngleTower.OnLoadComplexField_special_show;
        }
    }


    public partial class SngleTower {

        public TArray<TArray<int>> floor_firstrew;
        public TArray<TArray<int>> floor_twostrew;
        public TArray<TArray<int>> floor_thistrew;
        public TArray<int> star_condition;
        public TArray<int> special_show;

        internal static void OnLoadComplexField_floor_firstrew( SngleTower data, LuaDatabase.Query q ) {
            data.floor_firstrew = SngleTowerEx.IsValid_floor_firstrew ? Dataset.LoadIntArray2d( "floor_firstrew", q ) : __default.floor_firstrew;
        }

        internal static void OnLoadComplexField_floor_twostar_rew( SngleTower data, LuaDatabase.Query q ) {
            data.floor_twostrew = SngleTowerEx.IsValid_floor_twostar_rew ? Dataset.LoadIntArray2d( "floor_twostar_rew", q ) : __default.floor_twostrew;
        }

        internal static void OnLoadComplexField_floor_thistar_rew( SngleTower data, LuaDatabase.Query q ) {
            data.floor_thistrew = SngleTowerEx.IsValid_floor_thistar_rew ? Dataset.LoadIntArray2d( "floor_thistar_rew", q ) : __default.floor_thistrew;
        }


        internal static void OnLoadComplexField_star_condition( SngleTower data, LuaDatabase.Query q ) {
            data.star_condition = SngleTowerEx.IsValid_star_condition ? Dataset.LoadIntArray( "star_condition", q ) : __default.star_condition;
        }

        internal static void OnLoadComplexField_special_show( SngleTower data, LuaDatabase.Query q ) {
            data.special_show = SngleTowerEx.IsValid_special_show ? Dataset.LoadIntArray( "special_show", q ) : __default.special_show;
        }
    }
}
