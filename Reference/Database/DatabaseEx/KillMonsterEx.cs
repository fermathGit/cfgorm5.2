
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
    public partial class KillMonsterEx {
        static KillMonsterEx() {
            OnLoadComplexField_showItems = KillMonster.onLoadComplexField_showItems;
            OnLoadComplexField_pathfinding= KillMonster.onLoadComplexField_pathfinding;
        }
    }

    public partial class KillMonster {
        TArray<TArray<int>> m_reward_ite;
        public TArray<TArray<int>> reward_ite { get { return m_reward_ite; } }

        TArray<int> m_findPath;
        public TArray<int> findPath { get { return m_findPath; } }

        internal static void onLoadComplexField_showItems( KillMonster data, LuaDatabase.Query q ) {
            data.m_reward_ite = KillMonsterEx.IsValid_showItems ? Dataset.LoadIntArray2d( "showItems", q ) : __default.m_reward_ite;
        }
        internal static void onLoadComplexField_pathfinding( KillMonster data, LuaDatabase.Query q ) {
            data.m_findPath = KillMonsterEx.IsValid_pathfinding ? Dataset.LoadIntArray( "pathfinding", q ) : __default.m_findPath;
        }
    }

}
