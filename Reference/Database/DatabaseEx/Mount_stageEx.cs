
using System;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
using LuaTableHandle = System.Int64;
using LuaStateHandle = System.IntPtr;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaTableHandle = System.Object;
using LuaStateHandle = UniLua.ILuaState;
#endif
namespace Database {
    public partial class Mount_stage {
        private TArray<TArray<int>> m_mounts_stage_basc = null;
        public TArray<TArray<int>> mounts_stage_basc { get { return m_mounts_stage_basc; } set { m_mounts_stage_basc = value; } }


        internal static void onLoadComplexField_mounts_stage_basc( Mount_stage data, LuaDatabase.Query q ) {
            data.m_mounts_stage_basc = Mount_stageEx.IsValid_mounts_stage_basc ? Dataset.LoadIntArray2d( "mounts_stage_basc", q ) : __default.m_mounts_stage_basc;
        }
    }
    public partial class Mount_stageEx {
        static Mount_stageEx() {
            OnLoadComplexField_mounts_stage_basc = Mount_stage.onLoadComplexField_mounts_stage_basc;
        }
    }
}
