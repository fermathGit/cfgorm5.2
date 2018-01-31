
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

public enum MonsterType {
    Normal = 1,
    Boss = 2,
    Carrer = 3,
    Summon = 4, //召唤怪
    Others
}

namespace Database {

    public partial class MonsterEx {
        static MonsterEx() {
            OnLoadComplexField_monster_exskill = Monster.LoadComplexField_monster_exskill;
            OnLoadComplexField_show4 = Monster.LoadComplexField_monster_show4;
#if UNITY_EDITOR
            OnLoadComplexField_monster_baseskill = Monster.LoadComplexField_monster_baseskill;
            OnLoadComplexField_monster_HPtrigskill = Monster.LoadComplexField_monster_HPtrigskill;
#endif
        }
    }

    public partial class Monster {

        public bool IsBoss() {
            return monstertype == 2 || monstertype == 4;
        }

        public bool IsFakePlayer() {
            return specialmod != 0;
        }

        // 血量是否是万分比
        public bool hpIsExtremeRatio {
            get {
                return hp_type == 1;
            }
        }

        TArray<int> m_MonsterExSkill = null;
        Dictionary<int, List<ShowFour>> m_show4 = null;

#if UNITY_EDITOR
        TArray<int> m_BaseSkill = null;
        TArray<int> m_Hptrigskill = null;
#endif

        public TArray<int> MonsterExSkill {
            get {
                return m_MonsterExSkill;
            }
        }

        public Dictionary<int, List<ShowFour>> show4 {
            get {
                return m_show4;
            }
        }

#if UNITY_EDITOR
        public TArray<int> __BaseSkill {
            get {
                return m_BaseSkill;
            }
        }

        public TArray<int> __Hptrigskill {
            get {
                return m_Hptrigskill;
            }
        }
#endif

        internal static void LoadComplexField_monster_exskill( Monster data, LuaDatabase.Query q ) {
            data.m_MonsterExSkill = MonsterEx.IsValid_monster_exskill ? Dataset.LoadIntArray( "monster_exskill", q ) : __default.m_MonsterExSkill;
        }

        internal static void LoadComplexField_monster_show4( Monster data, LuaDatabase.Query q ) {
            if( MonsterEx.IsValid_show4 ) {
                var dic = new Dictionary<int, List<ShowFour>>();
                var temp = Dataset.LoadIntArray( "show4", q );
                if( temp != null ) {
                    for( int i = 0; i < temp.Length; ++i ) {
                        var show4Db = Database.ShowFour.Get( temp[i] );
                        if( show4Db != null ) {
                            List<ShowFour> list = null;
                            if( dic.TryGetValue( show4Db.type, out list ) ) {
                                list.Add( show4Db );
                            } else {
                                list = new List<ShowFour>();
                                list.Add( show4Db );
                                dic[show4Db.type] = list;
                            }
                        }
                    }
                }
                data.m_show4 = dic;
            } else {
                data.m_show4 = __default.show4;
            }
        }

#if UNITY_EDITOR
        internal static void LoadComplexField_monster_baseskill( Monster data, LuaDatabase.Query q ) {
            data.m_BaseSkill = MonsterEx.IsValid_monster_baseskill ? Dataset.LoadIntArray( "monster_baseskill", q ) : __default.m_BaseSkill;
        }

        internal static void LoadComplexField_monster_HPtrigskill( Monster data, LuaDatabase.Query q ) {
            data.m_Hptrigskill = MonsterEx.IsValid_monster_HPtrigskill ? Dataset.LoadIntArray( "HPtrigskill", q ) : __default.m_Hptrigskill;
        }
#endif
    }
}
