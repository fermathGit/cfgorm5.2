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
    public partial class SkillSimboEx {
        static SkillSimboEx() {
            OnLoadComplexField_simbo_active_item = SkillSimbo.LoadComplexField_simbo_active_item;
            OnLoadComplexField_startskill_id = SkillSimbo.LoadComplexField_startskill_id;
            OnLoadComplexField_simbo_active_soul = SkillSimbo.LoadComplexField_activesoul_id;
        }
    }

    public partial class SkillSimbo {
        #region member_ex
        TArray<int> m_skills = null;
        TArray<int> m_activeSoul = null;
        TArray<TArray<int>> m_activeNeeds = null;

        #endregion

        #region props_ex
        public TArray<int> skills {
            get {
                return m_skills;
            }
        }

        public TArray<TArray<int>> activeNeeds {
            get {
                return m_activeNeeds;
            }
        }

        public int GetActiveSoulId( int skillId ) {
            int result = 0;
            if ( m_skills != null && m_activeSoul != null ) {
                int skillIndex = -1;
                for ( int i = 0; i < m_skills.Length; i++ ) {
                    if ( m_skills[i] == skillId ) {
                        skillIndex = i;
                        break;
                    }
                }
                if ( skillIndex >= 0 && skillIndex < m_activeSoul.Length ) {
                    result = m_activeSoul[skillIndex];
                }
            }
            return result;
        }

        public TArray<int> GetNeedsBySkillId( int skillId ) {
            TArray<int> result = null;
            if ( m_skills != null && m_activeNeeds != null ) {
                int skillIndex = -1;
                for ( int i = 0; i < m_skills.Length; i++ ) {
                    if ( m_skills[i] == skillId ) {
                        skillIndex = i;
                        break;
                    }
                }
                if ( skillIndex >= 0 && skillIndex < m_activeNeeds.Length ) {
                    result = m_activeNeeds[skillIndex];
                }
            }
            return result;
        }

        #endregion

        #region loadex
        public static void LoadComplexField_simbo_active_item( SkillSimbo data, LuaDatabase.Query q ) {
            data.m_activeNeeds = SkillSimboEx.IsValid_simbo_active_item ? Dataset.LoadIntArray2d( "simbo_active_item", q ) : __default.m_activeNeeds;
        }
        public static void LoadComplexField_startskill_id( SkillSimbo data, LuaDatabase.Query q ) {
            data.m_skills = SkillSimboEx.IsValid_startskill_id ? Dataset.LoadIntArray( "startskill_id", q ) : __default.m_skills;
        }
        public static void LoadComplexField_activesoul_id( SkillSimbo data, LuaDatabase.Query q ) {
            data.m_activeSoul = SkillSimboEx.IsValid_simbo_active_soul ? Dataset.LoadIntArray( "simbo_active_soul", q ) : __default.m_activeSoul;
        }
        #endregion

        public static List<SkillSimbo> GetSimboByRank( int career ) {
            List<SkillSimbo> simboByRank = new List<SkillSimbo>();
            var pd = PlayerDesc.Get( career );
            if ( pd != null && pd.runes != null ) {
                for ( int i = 0; i < pd.runes.Length; i++ ) {
                    var simbo = SkillSimbo.Get( pd.runes[i] );
                    if ( simbo != null ) {
                        simboByRank.Add( simbo );
                    }
                }
            }
            simboByRank.Sort( ( a, b ) => { return a.auto_rank - b.auto_rank; } );

            return simboByRank;
        }

    }
}