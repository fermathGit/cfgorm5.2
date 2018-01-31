
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
    public partial class HeadEx {
        static HeadEx() {
            OnLoadComplexField_attribute = Head.onLoadComplexField_attribute;
        }
    }

    public partial class Head {
        private TArray<TArray<int>> m_attribute;
        public TArray<TArray<int>> attribute { get { return m_attribute; } set { m_attribute = value; } }


        internal static void onLoadComplexField_attribute( Head data, LuaDatabase.Query q ) {
            data.m_attribute = HeadEx.IsValid_attribute ? Dataset.LoadIntArray2d( "attribute", q ) : __default.m_attribute;
        }
    }
}
