
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

    public partial class DayBuyEx {
        static DayBuyEx() {
            OnLoadComplexField_show_item = DayBuy.onLoadComplexField_show_item;
        }
    }

    public partial class DayBuy {


        TArray<TArray<int>> m_show_item = null;

        public TArray<TArray<int>> show_item { get { return m_show_item; } set { m_show_item = value; } }

        internal static void onLoadComplexField_show_item( DayBuy data, LuaDatabase.Query q ) {
            data.show_item = DayBuyEx.IsValid_show_item ? Dataset.LoadIntArray2d( "show_item", q ) : __default.m_show_item;
        }
    }
}
