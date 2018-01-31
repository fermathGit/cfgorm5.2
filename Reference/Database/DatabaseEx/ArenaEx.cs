
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
    public partial class ArenaEx {
        static ArenaEx() {
            OnLoadComplexField_first_reward_item = Arena.OnLoadComplexField_first_reward_item;
        }
    }


	public partial class Arena {
        TArray<TArray<int>> m_first_reward_ite;
        public TArray<TArray<int>> first_reward_ite { get { return m_first_reward_ite; } }
        internal static void OnLoadComplexField_first_reward_item( Arena data, LuaDatabase.Query q ) {
            data.m_first_reward_ite = Dataset.LoadIntArray2d( "first_reward_item", q );
        }

        public static string GetRankNameByRanking( int rank ) {
            var list = GetKeys();
            string str = null;
            for ( int i = 0; i < list.Count; ++i ) {
                Arena are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    str = are.m_rankname;
                    break;
                }
            }
            return str;
        }

        public static TArray<TArray<int>> GetRankPropByRanking( int rank ) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                Arena are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    return are.first_reward_ite;
                }
            }
            return null;
        }

        public static string GetNextRankName( int rank ) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                Arena are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                   Arena next =  Get( are.next_rank );
                   if ( next != null) {
                       return next.rankname;
                    }
                }
            }
            return null;
        }

        public static TArray<TArray<int>> GetNextRankAwark( int rank ) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                Arena are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    Arena next = Get( are.next_rank );
                    if ( next != null ) {
                        return next.first_reward_ite;
                    }
                }
            }
            return null;
        }

        public static int GetRankMax( int rank ) {
            var list = GetKeys();
            for ( int i = 0; i < list.Count; ++i ) {
                Arena are = Get( list[i] );
                if ( are != null && are.pos_min >= rank && are.pos_max <= rank ) {
                    return are.id;
                }
            }
            return 0;
        }

    }
}
