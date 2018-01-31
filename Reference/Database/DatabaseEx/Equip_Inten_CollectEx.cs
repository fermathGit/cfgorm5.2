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

    public partial class Equip_Inten_CollectEx {
        static Equip_Inten_CollectEx() {
            OnLoadComplexField_attribute_1 = Equip_Inten_Collect.OnLoadComplexField_attribute_1;
            OnLoadComplexField_attribute_2 = Equip_Inten_Collect.OnLoadComplexField_attribute_2;
            OnLoadComplexField_attribute_3 = Equip_Inten_Collect.OnLoadComplexField_attribute_3;
            OnLoadComplexField_attribute_4 = Equip_Inten_Collect.OnLoadComplexField_attribute_4;
            OnLoadComplexField_attribute_5 = Equip_Inten_Collect.OnLoadComplexField_attribute_5;
        }
    }

    public partial class Equip_Inten_Collect {
        public static Dictionary<int, List<TArray<int>>> m_equipinten = new Dictionary<int, List<TArray<int>>>();
        public TArray<int> attribute_1;
        public TArray<int> attribute_2;
        public TArray<int> attribute_3;
        public TArray<int> attribute_4;
        public TArray<int> attribute_5;

        internal static void OnLoadComplexField_attribute_1( Equip_Inten_Collect data, LuaDatabase.Query q ) {
            data.attribute_1 = Equip_Inten_CollectEx.IsValid_attribute_1 ? Dataset.LoadIntArray( "attribute_1", q ) : __default.attribute_1;
        }
        internal static void OnLoadComplexField_attribute_2( Equip_Inten_Collect data, LuaDatabase.Query q ) {
            data.attribute_2 = Equip_Inten_CollectEx.IsValid_attribute_2 ? Dataset.LoadIntArray( "attribute_2", q ) : __default.attribute_2;
        }
        internal static void OnLoadComplexField_attribute_3( Equip_Inten_Collect data, LuaDatabase.Query q ) {
            data.attribute_3 = Equip_Inten_CollectEx.IsValid_attribute_3 ? Dataset.LoadIntArray( "attribute_3", q ) : __default.attribute_3;
        }
        internal static void OnLoadComplexField_attribute_4( Equip_Inten_Collect data, LuaDatabase.Query q ) {
            data.attribute_4 = Equip_Inten_CollectEx.IsValid_attribute_4 ? Dataset.LoadIntArray( "attribute_4", q ) : __default.attribute_4;
        }
        internal static void OnLoadComplexField_attribute_5( Equip_Inten_Collect data, LuaDatabase.Query q ) {
            data.attribute_5 = Equip_Inten_CollectEx.IsValid_attribute_5 ? Dataset.LoadIntArray( "attribute_5", q ) : __default.attribute_5;
        }

        public static void ClearCacheEx() {
            m_equipinten.Clear();
        }

        public static List<TArray<int>> GetIntenValueById( int id ) {
            if ( m_equipinten.ContainsKey( id ) ) {
                return m_equipinten[id];
            } else {
                var data = Get( id );
                if (data != null)
                {
                    List<TArray<int>> list = new List<TArray<int>>();
                    if ( data.attribute_1[0] != 0 ) {
                        list.Add( data.attribute_1 );
                    }
                    if ( data.attribute_2[0] != 0 ) {
                        list.Add( data.attribute_2 );
                    }
                    if ( data.attribute_3[0] != 0) {
                        list.Add( data.attribute_3 );
                    }
                    if ( data.attribute_4[0] != 0 ) {
                        list.Add( data.attribute_4 );
                    }
                    if ( data.attribute_5[0] != 0 ) {
                        list.Add( data.attribute_5 );
                    }
                    m_equipinten.Add( id, list );
                    return list;
                }
            }
            return null;
        }

        public static Database.Equip_Inten_Collect GetVfxLv( int enhanceLevel ) {
            var keys = Database.Equip_Inten_Collect.GetKeys();
            int ret = 0;
            if ( keys != null ) {
                for ( int i = 0; i < keys.Count; i++ ) {
                    int preKey = 0;
                    if ( i - 1 > 0 ) {
                        preKey = keys[i - 1];
                    }
                    int nowKey = keys[i];
                    if ( preKey <= enhanceLevel && nowKey > enhanceLevel ) {
                        ret = preKey;
                        break;
                    }
                }
                if ( ret == 0 && enhanceLevel > keys[keys.Count - 1] ) {
                    ret = keys[keys.Count - 1];
                }
            }
            return Database.Equip_Inten_Collect.Get(ret);
        }
    }
}
