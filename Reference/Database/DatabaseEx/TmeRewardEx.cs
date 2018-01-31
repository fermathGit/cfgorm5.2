
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
    public partial class TmeRewardEx {
        static TmeRewardEx() {
            OnLoadComplexField_model_hight = TmeReward.OnLoadComplexField_model_hight;
            OnLoadComplexField_model_s = TmeReward.OnLoadComplexField_model_s;
            OnLoadComplexField_model_zoom = TmeReward.OnLoadComplexField_model_zoom;
            OnLoadComplexField_c1 = TmeReward.OnLoadComplexField_c1;
            OnLoadComplexField_c2 = TmeReward.OnLoadComplexField_c2;
            OnLoadComplexField_c3 = TmeReward.OnLoadComplexField_c3;
            OnLoadComplexField_c4 = TmeReward.OnLoadComplexField_c4;
        }
    }


    public partial class TmeReward {

        public TArray<double> model_zoom;
        public TArray<TArray<int>> model_hight;
        public TArray<TArray<int>> model_s;
        public TArray<TArray<int>> c1;
        public TArray<TArray<int>> c2;
        public TArray<TArray<int>> c3;
        public TArray<TArray<int>> c4;

        internal static void OnLoadComplexField_model_hight( TmeReward data, LuaDatabase.Query q ) {
            data.model_hight = TmeRewardEx.IsValid_model_hight ? Dataset.LoadIntArray2d( "model_hight", q ) : __default.model_hight;
        }
        internal static void OnLoadComplexField_model_s( TmeReward data, LuaDatabase.Query q ) {
            data.model_s = TmeRewardEx.IsValid_model_s ? Dataset.LoadIntArray2d( "model_s", q ) : __default.model_s;
        }

        internal static void OnLoadComplexField_model_zoom( TmeReward data, LuaDatabase.Query q ) {
            data.model_zoom = TmeRewardEx.IsValid_model_zoom ? Dataset.LoadNumberArray( "model_zoom", q ) : __default.model_zoom;
        }


        internal static void OnLoadComplexField_c1( TmeReward data, LuaDatabase.Query q ) {
            data.c1 = TmeRewardEx.IsValid_c1 ? Dataset.LoadIntArray2d( "c1", q ) : __default.c1;
        }

        internal static void OnLoadComplexField_c2( TmeReward data, LuaDatabase.Query q ) {
            data.c2 = TmeRewardEx.IsValid_c2 ? Dataset.LoadIntArray2d( "c2", q ) : __default.c2;
        }
        internal static void OnLoadComplexField_c3( TmeReward data, LuaDatabase.Query q ) {
            data.c3 = TmeRewardEx.IsValid_c3 ? Dataset.LoadIntArray2d( "c3", q ) : __default.c3;
        }
        internal static void OnLoadComplexField_c4( TmeReward data, LuaDatabase.Query q ) {
            data.c4 = TmeRewardEx.IsValid_c4 ? Dataset.LoadIntArray2d( "c4", q ) : __default.c4;
        }

    }
}
