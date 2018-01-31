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
    public partial class AchievementEx {
        static AchievementEx() {
            OnLoadComplexField_targetList = Achievement.LoadComplexField_targetList;
            OnLoadComplexField_reardMoney = Achievement.LoadComplexField_reardMoney;
            OnLoadComplexField_Relation_UI = Achievement.LoadComplexField_Relation_UI;
            OnLoadComplexField_show_ui = Achievement.OnLoadComplexField_show_ui;    
            OnLoadComplexField_rewardItem = Achievement.LoadComplexField_rewardItem;
            OnLoadComplexField_activePoint = Achievement.OnLoadComplexField_activePoint;
            OnLoadComplexField_showItem = Achievement.OnLoadComplexField_showItem;
        }
    }

    public partial class Achievement {
        TArray<TArray<int>> m_targetList = null;
        TArray<TArray<int>> m_rewardItemList = null;
        TArray<TArray<int>> m_showItem = null;
        TArray<int> m_activePoint = null;
        TArray<int> m_rewardMoneyList = null;
        TArray<int> m_relationUI = null;
        TArray<int> m_show_ui = null;
        static List<List<Achievement>> m_cacheLvGroup = null;

        public TArray<int> Show_ui {
            get {
                return m_show_ui;
            }
        }

        public TArray<TArray<int>> targetList {
            get {
                return m_targetList;
            }
        }
        public TArray<int> activePoint {
            get {
                return m_activePoint;
            }
        }
        public TArray<TArray<int>> rewardItemList {
            get {
                return m_rewardItemList;
            }
        }

        public TArray<TArray<int>> showItem {
            get {
                return m_showItem;
            }
        }

        public TArray<int> rewardMoneyList {
            get {
                return m_rewardMoneyList;
            }
        }

        public TArray<int> relationUI {
            get {
                return m_relationUI;
            }
        }

        public static void ClearCacheEx() {
            if ( m_cacheLvGroup != null ) {
                m_cacheLvGroup.Clear();
                m_cacheLvGroup = null;
            }
        }

        internal static void OnLoadComplexField_activePoint( Achievement data, LuaDatabase.Query q ) {
            data.m_activePoint = AchievementEx.IsValid_activePoint ? Dataset.LoadIntArray( "activePoint", q ) : __default.m_activePoint;
        }
        internal static void LoadComplexField_targetList( Achievement data, LuaDatabase.Query q ) {
            data.m_targetList = AchievementEx.IsValid_targetList ? Dataset.LoadIntArray2d( "targetList", q ) : __default.m_targetList;
        }

        internal static void LoadComplexField_reardMoney( Achievement data, LuaDatabase.Query q ) {
            data.m_rewardMoneyList = AchievementEx.IsValid_reardMoney ? Dataset.LoadIntArray( "reardMoney", q ) : __default.m_rewardMoneyList;
        }

        internal static void LoadComplexField_Relation_UI( Achievement data, LuaDatabase.Query q ) {
            data.m_relationUI = AchievementEx.IsValid_Relation_UI ? Dataset.LoadIntArray( "Relation_UI", q ) : __default.m_relationUI;
        }

        internal static void OnLoadComplexField_show_ui( Achievement data, LuaDatabase.Query q ) {
            data.m_show_ui = AchievementEx.IsValid_show_ui ? Dataset.LoadIntArray( "show_ui", q ) : __default.m_show_ui;
        }

        internal static void LoadComplexField_rewardItem( Achievement data, LuaDatabase.Query q ) {
            data.m_rewardItemList = AchievementEx.IsValid_rewardItem ? Dataset.LoadIntArray2d( "rewardItem", q ) : __default.m_rewardItemList;
        }

        internal static void OnLoadComplexField_showItem( Achievement data, LuaDatabase.Query q ) {
            data.m_showItem = AchievementEx.IsValid_showItem ? Dataset.LoadIntArray2d( "showItem", q ) : __default.m_showItem;
        }

        public static List<List<Achievement>> GetLevelGroups( int lpLevel, out int nextLevel ) {
            nextLevel = -1;
            List<List<Achievement>> ret = new List<List<Achievement>>();

            if ( m_cacheLvGroup == null ) {
                LoadAllAchieveGroup();
            }
            if ( m_cacheLvGroup != null ) {
                for ( int i = 0; i < m_cacheLvGroup.Count; i++ ) {
                    var item = m_cacheLvGroup[i];
                    if ( item != null && item.Count > 0 ) {
                        if ( item[0].looklevel <= lpLevel ) {
                            ret.Add( item );
                        } else {
                            nextLevel = item[0].looklevel;
                            break;
                        }
                    }
                }
            }
            return ret;
        }

        public static List<Achievement> GetLevelGroup( int level ) {
            if ( m_cacheLvGroup == null ) {
                LoadAllAchieveGroup();
            }
            if ( m_cacheLvGroup != null ) {
                for ( int i = 0; i < m_cacheLvGroup.Count; i++ ) {
                    var group = m_cacheLvGroup[i];
                    if ( group.Count > 0 && group[0].looklevel == level ) {
                        return group;
                    }
                }
            }
            return null;
        }

        static void LoadAllAchieveGroup() {
            m_cacheLvGroup = new List<List<Achievement>>();
            var achieves = GetByLookLv();
            int curLevel = 0;
            List<Achievement> list = null;
            for ( int i = 0; i < achieves.Count; i++ ) {
                var item = achieves[i];
                if ( item.open == 0 && item.dailyType == 1 ) {
                    if ( curLevel != item.looklevel ) {
                        if ( list != null ) {
                            m_cacheLvGroup.Add( list );
                        }
                        curLevel = item.looklevel;
                        list = new List<Achievement>();
                    }
                    if ( list != null ) {
                        list.Add( item );
                    }
                }
            }
            if ( list != null ) {
                m_cacheLvGroup.Add( list );
            }
        }

        static List<Achievement> GetByLookLv() {
            var keys = GetKeys();
            List<Achievement> ret = new List<Achievement>(); 
            if ( keys != null ) {
                for ( int i = 0; i < keys.Count; i++ ) {
                    ret.Add( Get( keys[i] ) );
                }
                ret.Sort( ( a, b ) => { return a.looklevel - b.looklevel; } );
            }
            return ret;
        }
    }
}
