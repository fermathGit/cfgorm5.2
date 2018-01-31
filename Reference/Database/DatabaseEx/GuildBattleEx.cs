
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
    public partial class GuildBattleEx {
        static GuildBattleEx() {
            OnLoadComplexField_winItem = GuildBattle.OnLoadComplexField_winItem;
            OnLoadComplexField_loseItem = GuildBattle.OnLoadComplexField_loseItem;
            OnLoadComplexField_byeItem = GuildBattle.OnLoadComplexField_byeItem;
            OnLoadComplexField_showItem = GuildBattle.OnLoadComplexField_showItem;
        }
    }

    public partial class GuildBattle {
        TArray<TArray<int>> m_winShowItem;

        public TArray<TArray<int>> winShowItem { 
            get { 
                return m_winShowItem; 
            } 
        }

        TArray<TArray<int>> m_loseShowItem;

        public TArray<TArray<int>> loseShowItem {
            get {
                return m_loseShowItem;
            }
        }

        TArray<TArray<int>> m_byeShowItem;

        public TArray<TArray<int>> byeShowItem {
            get {
                return m_byeShowItem;
            }
        }

       TArray<int> m_showItem;

        public TArray<int> showItem {
            get {
                return m_showItem;
            }
        }

        internal static void OnLoadComplexField_winItem( GuildBattle data, LuaDatabase.Query q ) {
            data.m_winShowItem = GuildBattleEx.IsValid_winItem ? Dataset.LoadIntArray2d( "winItem", q ) : __default.m_winShowItem;
        }
        internal static void OnLoadComplexField_loseItem( GuildBattle data, LuaDatabase.Query q ) {
            data.m_loseShowItem = GuildBattleEx.IsValid_loseItem ? Dataset.LoadIntArray2d( "loseItem", q ) : __default.m_loseShowItem;
        }
        internal static void OnLoadComplexField_byeItem( GuildBattle data, LuaDatabase.Query q ) {
            data.m_byeShowItem = GuildBattleEx.IsValid_byeItem ? Dataset.LoadIntArray2d( "byeItem", q ) : __default.m_byeShowItem;
        }
        internal static void OnLoadComplexField_showItem( GuildBattle data, LuaDatabase.Query q ) {
            data.m_showItem = GuildBattleEx.IsValid_showItem ? Dataset.LoadIntArray( "showItem", q ) : __default.m_showItem;
        }
    }
}
