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
    public partial class ArenaPointEx {
        static ArenaPointEx() {
            OnLoadComplexField_arena_reward = ArenaPoint.OnLoadComplexField_arena_reward;
        }
    }

	public partial class ArenaPoint {
        TArray<TArray<int>> m_arena_reward;
        public TArray<TArray<int>> arena_reward { get { return m_arena_reward; } }

        internal static void OnLoadComplexField_arena_reward( ArenaPoint data, LuaDatabase.Query q ) {
            data.m_arena_reward = Dataset.LoadIntArray2d( "arena_reward", q );
        }

        public static TArray<TArray<int>> GetArenaRewardByRanking(int rank) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                ArenaPoint are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    return are.arena_reward;
                }
            }
            return null;
        }

        public static int GetArenaPointByRanking( int rank ) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                ArenaPoint are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    return are.arena_point;
                }
            }
            return 0;
        }
    }
}
