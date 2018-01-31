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
using Network.Messages;
#endif

namespace Database {

    public partial class NextMenuEx {
        static NextMenuEx() {
            OnLoadComplexField_item1 = NextMenu.onLoadComplexField_item1;
        }
    }

    public partial class NextMenu {
        private TArray<int> m_item1 = null;
        public TArray<int> item1 { get { return m_item1; } }

        internal static void onLoadComplexField_item1( NextMenu data, LuaDatabase.Query q ) {
            data.m_item1 = Dataset.LoadIntArray( "item1", q );
        }
    }
}
