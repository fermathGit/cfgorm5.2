//=============================================================================
// DO NOT MODIFY THIS FILE MANUALLY!!
// THIS FILE IS GENERATED BY LUA DATABASE TOOL.
// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.
//=============================================================================

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
    public partial class TitleEx {
        static TitleEx() {
            OnLoadComplexField_attribute = Title.onLoadComplexField_attribute;
        }
    }

    public partial class Title {
        private TArray<TArray<int>> m_attr = null;

        public TArray<TArray<int>> attr { get { return m_attr; } }

        internal static void onLoadComplexField_attribute( Title data, LuaDatabase.Query q ) {
            data.m_attr = TitleEx.IsValid_attribute ? Dataset.LoadIntArray2d( "attribute", q ) : __default.m_attr;
        }
    }
}
//EOF
