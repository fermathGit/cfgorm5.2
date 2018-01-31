
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
    public partial class DailyEx {
        static DailyEx() {
            OnLoadComplexField_itemshow1 = Daily.OnLoadComplexField_itemshow1;
            OnLoadComplexField_itemshow2 = Daily.OnLoadComplexField_itemshow2;
            OnLoadComplexField_itemshow3 = Daily.OnLoadComplexField_itemshow3;
            OnLoadComplexField_itemshow4 = Daily.OnLoadComplexField_itemshow4;
            OnLoadComplexField_itemshow5 = Daily.OnLoadComplexField_itemshow5;
            OnLoadComplexField_daily_time = Daily.OnLoadComplexField_daily_time;
            OnLoadComplexField_Convenient_team = Daily.onLoadComplexField_Convenient_teame;
        }
    }

    public partial class Daily {
        public struct DailyItem {
            public int id;
            public bool isbound;
        }

        public class CTimeFrame {
            public int m_beginSecond;
            public int m_endSecond;
        }

        static string[] itemshowname = new string[5] { "itemshow1", "itemshow2", "itemshow3", "itemshow4", "itemshow5" };
        private List<CTimeFrame> m_timeFrames = null;
        public List<CTimeFrame> timeFrames {
            get {
                if (m_timeFrames == null ) {
                    m_timeFrames = new List<CTimeFrame>();

                    for (int i = 0; i < daily_time.Length; ++i ) {
                        var frame = new CTimeFrame();
                        frame.m_beginSecond = daily_time[i][0] * 60;
                        frame.m_endSecond = daily_time[i][1] * 60;
                        m_timeFrames.Add( frame );
                    }
                }
                return m_timeFrames;
            }
        }

        public DailyItem[] showItems = new DailyItem[5];

        public DailyItem itemshow1 {
            get { return showItems[0]; }
        }

        public DailyItem itemshow2 {
            get { return showItems[1]; }
        }

        public DailyItem itemshow3 {
            get { return showItems[2]; }
        }

        public DailyItem itemshow4 {
            get { return showItems[3]; }
        }

        public DailyItem itemshow5 {
            get { return showItems[4]; }
        }

        public TArray<TArray<int>> daily_time;

        public TArray<TArray<int>> Daily_time {
            get { return daily_time; }
        }

        TArray<TArray<int>> m_convenient_team;
        public  TArray<TArray<int>> convenient_team {
            get { return m_convenient_team; }
        }

        public int GetMapID( int lv) {
            if ( m_convenient_team != null ) {
                for ( int i = 0; i < m_convenient_team.Length; ++i ) {
                    if ( m_convenient_team[i] != null && m_convenient_team[i].Length == 3 ) {
                        if ( lv >= m_convenient_team[i][0] && lv <= m_convenient_team[i][1] ) {
                            return m_convenient_team[i][2];
                        }
                    } else {
                        UDebug.Log( "config format error" );
                    }
                }
            }
            return 0;
        }

        internal static void OnLoadComplexField_itemshow1( Daily data, LuaDatabase.Query q ) {
            if ( DailyEx.IsValid_itemshow1 ) {
                SetItemShow( data, q, 1 );
            } else {
                data.showItems[0] = __default.showItems[0];
            }
        }
        internal static void OnLoadComplexField_itemshow2( Daily data, LuaDatabase.Query q ) {
            if ( DailyEx.IsValid_itemshow2 ) {
                SetItemShow( data, q, 2 );
            } else {
                data.showItems[1] = __default.showItems[1];
            }
        }
        internal static void OnLoadComplexField_itemshow3( Daily data, LuaDatabase.Query q ) {
            if ( DailyEx.IsValid_itemshow3 ) {
                SetItemShow( data, q, 3 );
            } else {
                data.showItems[2] = __default.showItems[2];
            }
        }
        internal static void OnLoadComplexField_itemshow4( Daily data, LuaDatabase.Query q ) {
            if ( DailyEx.IsValid_itemshow4 ) {
                SetItemShow( data, q, 4 );
            } else {
                data.showItems[3] = __default.showItems[3];
            }
        }
        internal static void OnLoadComplexField_itemshow5( Daily data, LuaDatabase.Query q ) {
            if ( DailyEx.IsValid_itemshow5 ) {
                SetItemShow( data, q, 5 );
            } else {
                data.showItems[4] = __default.showItems[4];
            }
        }

        internal static void OnLoadComplexField_daily_time( Daily data, LuaDatabase.Query q ) {
            data.daily_time = Dataset.LoadIntArray2d( "daily_time", q );
        }

        internal static void onLoadComplexField_Convenient_teame(Daily data, LuaDatabase.Query q) {
            data.m_convenient_team = Dataset.LoadIntArray2d( "Convenient_team", q );
        }

        static void SetItemShow( Daily data, LuaDatabase.Query q, int i ) {
            TArray<int> info = Dataset.LoadIntArray( itemshowname[i -1], q );
            data.showItems[i -1] = new DailyItem();
            if ( info != null && info.Length >= 2 ) {
                data.showItems[i - 1].id = info[ 0 ];
                data.showItems[i - 1].isbound = ( info[ 1 ] == 0 ? false : true );
            }
        }
    }
}
