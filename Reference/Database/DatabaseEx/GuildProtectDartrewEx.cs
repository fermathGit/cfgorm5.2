using Common;
using System;
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
    public partial class GuildProtectDartrewEx {
        static GuildProtectDartrewEx() {
            OnLoadComplexField_guildb_basrew = GuildProtectDartrew.onLoadComplexField_guildb_basrew;
            OnLoadComplexField_guildb_hprew = GuildProtectDartrew.onLoadComplexField_guildb_hprew;
            OnLoadComplexField_guildb_losrew = GuildProtectDartrew.onLoadComplexField_guildb_losrew;
            OnLoadComplexField_successItemList = GuildProtectDartrew.onLoadComplexField_successItemList;
            OnLoadComplexField_failedItemList = GuildProtectDartrew.onLoadComplexField_failedItemList;
        }
    }

    public partial class GuildProtectDartrew {
        private int[] m_guildb_basrew = null;
        public int[] guildb_basrew { get { return m_guildb_basrew; } }

        private int[] m_guildb_hprew = null;
        public int[] guildb_hprew { get { return m_guildb_hprew; } }

        private int[] m_guildb_losrew = null;
        public int[] guildb_losrew { get { return m_guildb_losrew; } }

        private TArray<TArray<int>> m_successItemList = null;
        public TArray<TArray<int>> SuccessItemList { get { return m_successItemList; } }

        private TArray<TArray<int>> m_failedItemList = null;
        public TArray<TArray<int>> FailedItemList { get { return m_failedItemList; } }

        internal static void onLoadComplexField_guildb_basrew( GuildProtectDartrew data, LuaDatabase.Query q ) {
            if ( GuildProtectDartrewEx.IsValid_guildb_basrew ) {
                var temp = Dataset.LoadArray( "guildb_basrew", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_guildb_basrew = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_guildb_basrew[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_guildb_basrew = __default.m_guildb_basrew;
            }
        }

        internal static void onLoadComplexField_guildb_hprew( GuildProtectDartrew data, LuaDatabase.Query q ) {
            if ( GuildProtectDartrewEx.IsValid_guildb_hprew ) {
                var temp = Dataset.LoadArray( "guildb_hprew", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_guildb_hprew = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_guildb_hprew[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_guildb_hprew = __default.m_guildb_hprew;
            }
        }

        internal static void onLoadComplexField_guildb_losrew( GuildProtectDartrew data, LuaDatabase.Query q ) {
            if ( GuildProtectDartrewEx.IsValid_guildb_hprew ) {
                var temp = Dataset.LoadArray( "guildb_losrew", q );
                if ( temp != null ) {
                    var count = temp.GetArrayCount();
                    data.m_guildb_losrew = new int[count];
                    for ( int i = 0; i < count; ++i ) {
                        data.m_guildb_losrew[i] = temp.Get<int>( i );
                    }
                }
            } else {
                data.m_guildb_losrew = __default.m_guildb_losrew;
            }
        }

        internal static void onLoadComplexField_successItemList( GuildProtectDartrew data, LuaDatabase.Query q ) {
            data.m_successItemList = GuildProtectDartrewEx.IsValid_successItemList ? Dataset.LoadIntArray2d( "successItemList", q ) : __default.m_successItemList;
        }

        internal static void onLoadComplexField_failedItemList( GuildProtectDartrew data, LuaDatabase.Query q ) {
            data.m_failedItemList = GuildProtectDartrewEx.IsValid_failedItemList ? Dataset.LoadIntArray2d( "failedItemList", q ) : __default.m_failedItemList;
        }
    }
}
