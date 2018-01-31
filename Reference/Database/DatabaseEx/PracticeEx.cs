
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
    public partial class PracticeEx {
        static PracticeEx() {
            OnLoadComplexField_dropshow = Practice.OnLoadComplexField_dropshow;
        }
    }

    public partial class Practice {
        private TArray<TArray<int>> m_dropshow = null;
        public TArray<TArray<int>> dropshow { get { return m_dropshow; } }

        internal static void OnLoadComplexField_dropshow( Practice data, LuaDatabase.Query q ) {
            data.m_dropshow = PracticeEx.IsValid_dropshow ? Dataset.LoadIntArray2d( "dropshow", q ) : __default.dropshow;
        }
    }
}
