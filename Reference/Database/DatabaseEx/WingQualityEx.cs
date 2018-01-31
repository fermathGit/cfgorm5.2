using System;
using System.Collections.Generic;
using Common;
using UniLuax;
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
    public partial class WingQualityEx {
        static WingQualityEx() {
            OnLoadComplexField_upQualityCostItemes = WingQuality.OnLoadComplexField_upQualityCostItemes;
        }
    }

    public partial class WingQuality {
        static Dictionary<int, TArray<TArray<double>>> m_attsCache = new Dictionary<int, TArray<TArray<double>>>();

        private TArray<int> m_upQualityCostItems = null;
        public TArray<int> upQualityCostItems { get { return m_upQualityCostItems; } }
        
        internal static void OnLoadComplexField_upQualityCostItemes( WingQuality data, LuaDatabase.Query q ) {
            data.m_upQualityCostItems = WingQualityEx.IsValid_upQualityCostItemes ? Dataset.LoadIntArray( "upQualityCostItemes", q ) : __default.m_upQualityCostItems;
        }
        
        public static void ClearCacheEx() {
            m_attsCache.Clear();
        }

    }
}
