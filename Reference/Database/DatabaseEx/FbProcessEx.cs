using System;
using System.Collections.Generic;
using Common;
using EquipSpace;
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
    public partial class FbProcessEx {
        static FbProcessEx() {
            OnLoadComplexField_fb_end = FbProcess.LoadComplexField_fb_end;
            OnLoadComplexField_boss = FbProcess.LoadComplexField_boss;
            OnLoadComplexField_monster = FbProcess.LoadComplexField_monster;
            OnLoadComplexField_elite = FbProcess.LoadComplexField_elite;
            OnLoadComplexField_show1 = FbProcess.LoadComplexField_show1;
        }
    }

    public partial class FbProcess {

        public enum FbProcessCutscenetype {
            PlayAndSendMsg = 0,
            PlayEndAndSendMsg = 1
        }

        TArray<TArray<int>> m_monster = null;
        TArray<TArray<int>> m_boss = null;
        TArray<TArray<int>> m_elite = null;
        TArray<TArray<int>> m_fb_end = null;
        List<int> m_allMonsters = null;

        public int show1Begin { get; set; }
        public int show1End { get; set; }

        public List<int> allMonsters {
            get {
                if ( m_allMonsters == null ) {
                    m_allMonsters = new List<int>();
                    if ( m_monster != null ) {
                        for ( int i = 0; i < m_monster.Length; i++ ) {
                            m_allMonsters.Add( m_monster[i][0] );
                        }
                    }
                    if ( m_boss != null ) {
                        for ( int i = 0; i < m_boss.Length; i++ ) {
                            int id = m_boss[i][0];
                            if ( m_allMonsters.Contains( id ) == false ) {
                                m_allMonsters.Add( id );
                            }
                        }
                    }
                    if ( m_elite != null ) {
                        for ( int i = 0; i < m_elite.Length; i++ ) {
                            int id = m_elite[i][0];
                            if ( m_allMonsters.Contains( id ) == false ) {
                                m_allMonsters.Add( id );
                            }
                        }
                    }
                }
                return m_allMonsters;
            }
        }

        public TArray<TArray<int>> fb_end {
            get { return m_fb_end; }
        }

        internal static void LoadComplexField_monster( FbProcess data, LuaDatabase.Query q ) {
            data.m_monster = FbProcessEx.IsValid_monster ? Dataset.LoadIntArray2d( "monster", q ) : __default.m_monster;
        }

        internal static void LoadComplexField_boss( FbProcess data, LuaDatabase.Query q ) {
            data.m_boss = FbProcessEx.IsValid_boss ? Dataset.LoadIntArray2d( "boss", q ) : __default.m_boss;
        }

        internal static void LoadComplexField_elite( FbProcess data, LuaDatabase.Query q ) {
            data.m_elite = FbProcessEx.IsValid_elite ? Dataset.LoadIntArray2d( "elite", q ) : __default.m_elite;
        }

        internal static void LoadComplexField_fb_end(FbProcess data, LuaDatabase.Query q) {
            data.m_fb_end = FbProcessEx.IsValid_fb_end ? Dataset.LoadIntArray2d( "fb_end", q ) : __default.m_fb_end;
        }

        internal static void LoadComplexField_show1( FbProcess data, LuaDatabase.Query q ) {
            /*
             * 数组[a,b]
                a=
                1进度开始前
                2进入开始后
                b=
                具体ID表示show1ID
                */
            if ( FbProcessEx.IsValid_show1 ) {
                var table = Dataset.LoadIntArray( "show1", q );
                int type = table.Length > 0 ? table[ 0 ] : 0;
                int val = table.Length > 1 ? table[ 1 ] : 0;
                if ( type == 1 ) {
                    data.show1Begin = val;
                } else if ( type == 2 ) {
                    data.show1End = val;
                }
            } else {
                data.show1Begin = __default.show1Begin;
                data.show1End = __default.show1End;
            }
        }

    }
}
