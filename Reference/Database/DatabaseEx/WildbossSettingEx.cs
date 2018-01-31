using Common;
using System.Collections.Generic;
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
    public partial class WildbossSettingEx {
        static WildbossSettingEx() {
            OnLoadComplexField_show1 = WildbossSetting.onLoadComplexField_show1;
            OnLoadComplexField_show2 = WildbossSetting.onLoadComplexField_show2;
            OnLoadComplexField_show3 = WildbossSetting.onLoadComplexField_show3;
            OnLoadComplexField_show4 = WildbossSetting.onLoadComplexField_show4;
            OnLoadComplexField_show5 = WildbossSetting.onLoadComplexField_show5;
        }
    }

    public partial class WildbossSetting {
        private int[] m_show1 = null;
        public int[] show1 { get { return m_show1; } }

        private int[] m_show2 = null;
        public int[] show2 { get { return m_show2; } }

        private int[] m_show3 = null;
        public int[] show3 { get { return m_show3; } }

        private int[] m_show4 = null;
        public int[] show4 { get { return m_show4; } }

        private int[] m_show5 = null;
        public int[] show5 { get { return m_show5; } }

        private static List<int> m_wildBossIds = null;

        internal static void onLoadComplexField_show1( WildbossSetting data, LuaDatabase.Query q ) {
            if ( WildbossSettingEx.IsValid_show1 ) {
                var temp = Dataset.LoadArray( "show1", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_show1 = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_show1[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_show1 = __default.show1;
            }
        }

        internal static void onLoadComplexField_show2( WildbossSetting data, LuaDatabase.Query q ) {
            if ( WildbossSettingEx.IsValid_show2 ) {
                var temp = Dataset.LoadArray( "show2", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_show2 = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_show2[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_show2 = __default.show2;
            }
        }

        internal static void onLoadComplexField_show3( WildbossSetting data, LuaDatabase.Query q ) {
            if ( WildbossSettingEx.IsValid_show3 ) {
                var temp = Dataset.LoadArray( "show3", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_show3 = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_show3[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_show3 = __default.show3;
            }
        }

        internal static void onLoadComplexField_show4( WildbossSetting data, LuaDatabase.Query q ) {
            if ( WildbossSettingEx.IsValid_show4 ) {
                var temp = Dataset.LoadArray( "show4", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_show4 = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_show4[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_show4 = __default.show4;
            }
        }

        internal static void onLoadComplexField_show5( WildbossSetting data, LuaDatabase.Query q ) {
            if ( WildbossSettingEx.IsValid_show5 ) {
                var temp = Dataset.LoadArray( "show5", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_show5 = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_show5[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_show5 = __default.show5;
            }
        }

        public static bool IsWildBoss( int monsterId ) {
            if( m_wildBossIds == null ) {
                m_wildBossIds = new List<int>();
                if( m_ids == null ) {
                    GetKeys();
                }
                for( int i = 0; i < m_ids.Count; ++i ) {
                    var t = Get( m_ids[i] );
                    if( t != null ) {
                        m_wildBossIds.Add( t.m_bossid );
                    }
                }
            }
            return m_wildBossIds.Contains( monsterId );
        }

        public static void ClearCacheEx() {
            m_wildBossIds.Clear();
            m_wildBossIds = null;
        }
    }
}