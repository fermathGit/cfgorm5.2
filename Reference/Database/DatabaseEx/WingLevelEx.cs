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
#endif

namespace Database {
    public partial class WingLevelEx {
        static WingLevelEx() {
            OnLoadComplexField_basic_att1 = WingLevel.OnLoadComplexField_basic_att1;
            OnLoadComplexField_basic_att2 = WingLevel.OnLoadComplexField_basic_att2;
            OnLoadComplexField_basic_att3 = WingLevel.OnLoadComplexField_basic_att3;
            OnLoadComplexField_basic_att4 = WingLevel.OnLoadComplexField_basic_att4;
            OnLoadComplexField_basic_att5 = WingLevel.OnLoadComplexField_basic_att5;

            OnLoadComplexField_att1 = WingLevel.OnLoadComplexField_attribute_1;
            OnLoadComplexField_att2 = WingLevel.OnLoadComplexField_attribute_2;
            OnLoadComplexField_att3 = WingLevel.OnLoadComplexField_attribute_3;
            OnLoadComplexField_att4 = WingLevel.OnLoadComplexField_attribute_4;
            OnLoadComplexField_att5 = WingLevel.OnLoadComplexField_attribute_5;

            OnLoadComplexField_upLevelCostItemes1 = WingLevel.OnLoadComplexField_upLevelCostItemes1;
            OnLoadComplexField_upLevelCostItemes2 = WingLevel.OnLoadComplexField_upLevelCostItemes2;
            OnLoadComplexField_levelAtt = WingLevel.OnLoadComplexField_levelAtt;
        }
    }
    public partial class WingLevel {
        static List<int> m_openHoleLevels = new List<int>();
        static List<int> m_postIds = new List<int>();
        static int m_hostWingMaxLevel = -1;
        static TArray<TArray<double>> m_attList = new TArray<TArray<double>>( new TArray<double>[5] );

        public TArray<double> basic_att1;
        public TArray<double> basic_att2;
        public TArray<double> basic_att3;
        public TArray<double> basic_att4;
        public TArray<double> basic_att5;

        public TArray<double> attribute_1;
        public TArray<double> attribute_2;
        public TArray<double> attribute_3;
        public TArray<double> attribute_4;
        public TArray<double> attribute_5;
        
        private TArray<int> m_upLevelCostItemes1 = null;
        private TArray<int> m_upLevelCostItemes2 = null;
        public TArray<int> upLevelCostItemes1 { get { return m_upLevelCostItemes1; } }
        public TArray<int> upLevelCostItemes2 { get { return m_upLevelCostItemes2; } }
        private TArray<TArray<double>> m_levelAtt = null;
        public TArray<TArray<double>> levelAtt { get { return m_levelAtt; } }

        internal static void OnLoadComplexField_basic_att1( WingLevel data, LuaDatabase.Query q ) {
            data.basic_att1 = WingLevelEx.IsValid_basic_att1 ? Dataset.LoadNumberArray( "basic_att1", q ) : __default.basic_att1;
        }

        internal static void OnLoadComplexField_basic_att2( WingLevel data, LuaDatabase.Query q ) {
            data.basic_att2 = WingLevelEx.IsValid_basic_att2 ? Dataset.LoadNumberArray( "basic_att2", q ) : __default.basic_att2;
        }

        internal static void OnLoadComplexField_basic_att3( WingLevel data, LuaDatabase.Query q ) {
            data.basic_att3 = WingLevelEx.IsValid_basic_att3 ? Dataset.LoadNumberArray( "basic_att3", q ) : __default.basic_att3;
        }

        internal static void OnLoadComplexField_basic_att4( WingLevel data, LuaDatabase.Query q ) {
            data.basic_att4 = WingLevelEx.IsValid_basic_att4 ? Dataset.LoadNumberArray( "basic_att4", q ) : __default.basic_att4;
        }

        internal static void OnLoadComplexField_basic_att5( WingLevel data, LuaDatabase.Query q ) {
            data.basic_att5 = WingLevelEx.IsValid_basic_att5 ? Dataset.LoadNumberArray( "basic_att5", q ) : __default.basic_att5;
        }

        internal static void OnLoadComplexField_attribute_1( WingLevel data, LuaDatabase.Query q ) {
            data.attribute_1 = WingLevelEx.IsValid_att1 ? Dataset.LoadNumberArray( "att1", q ) : __default.attribute_1;
        }
        internal static void OnLoadComplexField_attribute_2( WingLevel data, LuaDatabase.Query q ) {
            data.attribute_2 = WingLevelEx.IsValid_att2 ? Dataset.LoadNumberArray( "att2", q ) : __default.attribute_2;
        }
        internal static void OnLoadComplexField_attribute_3( WingLevel data, LuaDatabase.Query q ) {
            data.attribute_3 = WingLevelEx.IsValid_att3 ? Dataset.LoadNumberArray( "att3", q ) : __default.attribute_3;
        }
        internal static void OnLoadComplexField_attribute_4( WingLevel data, LuaDatabase.Query q ) {
            data.attribute_4 = WingLevelEx.IsValid_att4 ? Dataset.LoadNumberArray( "att4", q ) : __default.attribute_4;
        }
        internal static void OnLoadComplexField_attribute_5( WingLevel data, LuaDatabase.Query q ) {
            data.attribute_5 = WingLevelEx.IsValid_att5 ? Dataset.LoadNumberArray( "att5", q ) : __default.attribute_5;
        }

        public static TArray<TArray<double>> GetAttsById( int id ) {
            //if ( m_attsCache.ContainsKey( id ) ) {
            //    return m_attsCache[id];
            //} else {
                var data = Get( id );
                if ( data != null ) {
                    TArray<TArray<double>> list = new TArray<TArray<double>>( new TArray<double>[5] );
                    if ( data.attribute_1[0] != 0 ) {
                        list[0] = new TArray<double>( new double[2] );
                        list[0][0] = data.attribute_1[0];
                        list[0][1] = data.attribute_1[1];
                    }
                    if ( data.attribute_2[0] != 0 ) {
                        list[1] = new TArray<double>( new double[2] );
                        list[1][0] = data.attribute_2[0];
                        list[1][1] = data.attribute_2[1];
                    }
                    if ( data.attribute_3[0] != 0 ) {
                        list[2] = new TArray<double>( new double[2] );
                        list[2][0] = data.attribute_3[0];
                        list[2][1] = data.attribute_3[1];
                    }
                    if ( data.attribute_4[0] != 0 ) {
                        list[3] = new TArray<double>( new double[2] );
                        list[3][0] = data.attribute_4[0];
                        list[3][1] = data.attribute_4[1];
                    }
                    if ( data.attribute_5[0] != 0 ) {
                        list[4] = new TArray<double>( new double[2] );
                        list[4][0] = data.attribute_5[0];
                        list[4][1] = data.attribute_5[1];
                    }
                    //m_attsCache.Add( id, list );
                    return list;
                }
            //}
            return null;
        }
        
        public static TArray<TArray<double>> GetBaseAttsByWingId( int id ) {
            m_attList = new TArray<TArray<double>>( new TArray<double>[5] );
            id = 1000 * id + 1;
            var data = Get( id );
            if ( data != null ) {
                if ( data.basic_att1[0] != 0 ) {
                    m_attList[0] = new TArray<double>( new double[2] );
                    m_attList[0][0] = data.basic_att1[0];
                    m_attList[0][1] = data.basic_att1[1];
                }
                if ( data.basic_att2[0] != 0 ) {
                    m_attList[1] = new TArray<double>( new double[2] );
                    m_attList[1][0] = data.basic_att2[0];
                    m_attList[1][1] = data.basic_att2[1];
                }
                if ( data.basic_att3[0] != 0 ) {
                    m_attList[2] = new TArray<double>( new double[2] );
                    m_attList[2][0] = data.basic_att3[0];
                    m_attList[2][1] = data.basic_att3[1];
                }
                if ( data.basic_att4[0] != 0 ) {
                    m_attList[3] = new TArray<double>( new double[2] );
                    m_attList[3][0] = data.basic_att4[0];
                    m_attList[3][1] = data.basic_att4[1];
                }
                if ( data.basic_att5[0] != 0 ) {
                    m_attList[4] = new TArray<double>( new double[2] );
                    m_attList[4][0] = data.basic_att5[0];
                    m_attList[4][1] = data.basic_att5[1];
                }
                return m_attList;
            }
            return null;
        }

        public static List<int> GetOpenHoleLevels() {
            m_openHoleLevels.Clear();
            int hole = 1;
            var keyList = GetKeys();
            if ( keyList != null && keyList.Count > 0 ) {
                for ( int i = 0, imax = keyList.Count; i < imax; ++i ) {
                    var temp = Get( keyList[i] );
                    if ( temp == null ) continue;
                    if ( temp.opening == hole ) {
                        m_openHoleLevels.Add( temp.level );
                        hole++;
                    }
                }
            }
            return m_openHoleLevels;
        }

        public static List<int> GetPostWingIds() {
            m_postIds.Clear();
            var keyList = GetKeys();
            if ( keyList != null && keyList.Count > 0 ) {
                for ( int i = 0, imax = keyList.Count; i < imax; ++i ) {
                    var temp = Get( keyList[i] );
                    if ( temp == null || temp.wingId == GameCenter.wingManager.c_hostWingId ) continue;
                    if ( !m_postIds.Contains( temp.wingId ) ) {
                        m_postIds.Add( temp.wingId );
                    }
                }
            }
            return m_postIds;
        }

        public static int GetWingMaxLevel( int wingId ) {
            if ( m_hostWingMaxLevel != -1 ) return m_hostWingMaxLevel;

            var keyList = GetKeys();
            if ( keyList != null && keyList.Count > 0 ) {
                for ( int i = 0, imax = keyList.Count; i < imax; ++i ) {
                    var temp = Get( keyList[i] );
                    if ( temp == null || temp.wingId != wingId ) continue;
                    m_hostWingMaxLevel = m_hostWingMaxLevel > temp.level ? m_hostWingMaxLevel : temp.level;
                }
            }
            return m_hostWingMaxLevel;
        }

        internal static void OnLoadComplexField_upLevelCostItemes1( WingLevel data, LuaDatabase.Query q ) {
            data.m_upLevelCostItemes1 = WingLevelEx.IsValid_upLevelCostItemes1 ? Dataset.LoadIntArray( "upLevelCostItemes1", q ) : __default.m_upLevelCostItemes1;
        }

        internal static void OnLoadComplexField_upLevelCostItemes2( WingLevel data, LuaDatabase.Query q ) {
            data.m_upLevelCostItemes2 = WingLevelEx.IsValid_upLevelCostItemes2 ? Dataset.LoadIntArray( "upLevelCostItemes2", q ) : __default.m_upLevelCostItemes2;
        }
        internal static void OnLoadComplexField_levelAtt( WingLevel data, LuaDatabase.Query q ) {
            data.m_levelAtt = WingLevelEx.IsValid_levelAtt ? Dataset.LoadNumberArray2d( "levelAtt", q ) : __default.m_levelAtt;
        }

        public bool IsMainWing() {
            return wingId == 1;
        }

    }
}
