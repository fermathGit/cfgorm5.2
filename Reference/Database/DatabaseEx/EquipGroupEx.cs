
using System;
using System.Text;
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

    public partial class EquipGroupEx {
        static EquipGroupEx() {
            OnLoadComplexField_equips = EquipGroup.OnLoadComplexField_equips;
        }
    }

    public partial class EquipGroup {

        private TArray<int> m_allEquipIds = null;
        private static List<EquipGroup>[] m_idCacheEx = null;

        public TArray<int> allEquipIds { get { return m_allEquipIds; } }
        public int sellEquipKey { get { return 1 << sell; } }

        public static List<EquipGroup> GetByCareer( int career ) {
            if( m_idCacheEx == null ) {
                CacheAllEx();
            }

            List<EquipGroup> ret = null;
            if( career >= 0 && career < m_idCacheEx.Length ) {
                ret = m_idCacheEx[career];
            }
            return ret;
        }

        public static void CacheAllEx() {
            int careerCount = (int)Career.Count;
            m_idCacheEx = new List<EquipGroup>[careerCount];
            for( int i = 0; i < careerCount; ++i ) {
                m_idCacheEx[i] = new List<EquipGroup>();
            }

            int maxLevel = int.MaxValue;
            Database.Global.GetValue( "maxLevel", ref maxLevel );

            m_idCache.DoIteration(
                STuple.Create( m_idCacheEx, careerCount, maxLevel ),
                ( ctx, k, v ) => {
                    if ( v.Carrier < ctx.Item2 && v.level <= ctx.Item3 && v.hide == 0 ) {
                        ctx.Item1[ v.Carrier ].Add( v );
                    }
                    return true;
                }
            );

            for ( int i = 0; i < careerCount; ++i ) {
                m_idCacheEx[ i ].Sort( ( a, b ) => a.order - b.order );
            }
        }

        internal static void OnLoadComplexField_equips( EquipGroup data, LuaDatabase.Query q ) {
            data.m_allEquipIds = EquipGroupEx.IsValid_equips ? Dataset.LoadIntArray( "equips", q ) : __default.m_allEquipIds;
        }

        public static void ClearCacheEx() {
            ClearCache();
            m_idCacheEx = null;
        }
    }
}
