
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

    public partial class EquipCollectEx {
        static EquipCollectEx() {
            OnLoadComplexField_atttype = EquipCollect.OnLoadComplexField_atttype;
        }
    }

    public partial class EquipCollect {

        public TArray<TArray<double>> attributes = null;
        static Common.Collections.Generic.Lit.Dictionary<int, List<EquipCollect>> suitEquipCollect = null;


        public static List<EquipCollect> GetEquipCollects( int suitId ) {
            if( suitEquipCollect == null ) {
                CacheAllEx();
            }
            List<EquipCollect> ret = null;
            suitEquipCollect.TryGetValue( suitId, out ret );
            return ret;
        }

        public static EquipCollect GetEquipCollect( int suitId, int count ) {
            EquipCollect ret = null;
            var collects = GetEquipCollects( suitId );
            if( collects != null ) {
                for( int i = 0; i < collects.Count; ++i ) {
                    var temp = collects[i];
                    if( temp.number > count ) {
                        break;
                    } else {
                        ret = temp;
                    }
                }
            }
            return ret;
        }

        public static void CacheAllEx() {
            suitEquipCollect = new Common.Collections.Generic.Lit.Dictionary<int, List<EquipCollect>>();
            m_idCache.DoIteration(
            ( k, v ) => {
                List<EquipCollect> ret = null;
                if( !suitEquipCollect.TryGetValue( v.collcetId, out ret ) ) {
                    ret = new List<EquipCollect>();
                    suitEquipCollect[v.collcetId] = ret;
                }
                ret.Add( v );
                return true;
            } );

            suitEquipCollect.DoIteration(
            ( k, v ) => {
                if( v != null ) {
                    v.Sort( ( a, b ) => {
                        return a.number - b.number;
                    } );
                }
                return true;
            } );
        }

        internal static void OnLoadComplexField_atttype( EquipCollect data, LuaDatabase.Query q ) {
            data.attributes = EquipCollectEx.IsValid_atttype ? Dataset.LoadNumberArray2d( "atttype", q ) : __default.attributes;
        }

        public static void ClearCacheEx() {
            ClearCache();
            suitEquipCollect = null;
        }
    }
}
