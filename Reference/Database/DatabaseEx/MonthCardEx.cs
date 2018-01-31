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

    public partial class MonthCardEx {
        static MonthCardEx() {
            OnLoadComplexField_dec = MonthCard.onLoadComplexField_dec;
            OnLoadComplexField_showItem = MonthCard.onLoadComplexField_showItem;
            OnLoadComplexField_dayAddItem = MonthCard.onLoadComplexField_dayAddItem;
        }
    }
    public partial class MonthCard {
        private TArray<int> m_dec = null;
        public TArray<int> dec { get { return m_dec; } }

        private TArray<TArray<int>> m_showItem = null;
        public TArray<TArray<int>> showItem { get { return m_showItem; } }

        private TArray<TArray<int>> m_dayAddItem = null;
        public TArray<TArray<int>> dayAddItem { get { return m_dayAddItem; } }

        internal static void onLoadComplexField_dec( MonthCard data, LuaDatabase.Query q ) {
            data.m_dec = Dataset.LoadIntArray( "dec", q );
        }

        internal static void onLoadComplexField_showItem( MonthCard data, LuaDatabase.Query q ) {
            data.m_showItem = Dataset.LoadIntArray2d( "showItem", q );
        }

        internal static void onLoadComplexField_dayAddItem( MonthCard data, LuaDatabase.Query q ) {
            data.m_dayAddItem = Dataset.LoadIntArray2d( "dayAddItem", q );
        }
    }
}
