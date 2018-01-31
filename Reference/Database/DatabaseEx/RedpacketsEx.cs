
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
    public partial class RedpacketsEx {
        static RedpacketsEx() {
            OnLoadComplexField_num = Redpackets.onLoadComplexField_num;
        }
    }

    public partial class Redpackets {
        private TArray<int> m_num = null;
        public TArray<int> num { get { return m_num; } set { m_num = value; } }


        internal static void onLoadComplexField_num( Redpackets data, LuaDatabase.Query q ) {
            data.m_num = RedpacketsEx.IsValid_num ? Dataset.LoadIntArray( "num", q ) : __default.m_num;
        }
    }
}
