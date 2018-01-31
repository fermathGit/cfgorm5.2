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
using Network.Messages;
#endif

namespace Database {
    public partial class GirlItemTypeEx {
        static GirlItemTypeEx() {
            OnLoadComplexField_Ornamty_show = GirlItemType.LoadComplexField_Ornamty_show;
        }
    }

    public partial class GirlItemType {
        TArray<int> m_items = null;
        public TArray<int> items {
            get {
                return m_items;
            }
        }

        internal static void LoadComplexField_Ornamty_show( GirlItemType data, LuaDatabase.Query q ) {
            data.m_items = GirlItemTypeEx.IsValid_Ornamty_show ? Dataset.LoadIntArray( "Ornamty_show", q ) : __default.m_items;
        }
    }
}
