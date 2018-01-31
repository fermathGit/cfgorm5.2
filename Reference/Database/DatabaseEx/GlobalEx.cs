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
    public partial class GlobalEx {
        static GlobalEx() {
            OnLoadComplexField_global_para = Global.LoadComplexField_global_para;
        }
    }
    public partial class Global {
        DataTable m_setpara = null;
        TArray<TArray<int>> m_intArray2d = null;
        TArray<int> m_intArray = null;
        TArray<TArray<double>> m_numberArray2d = null;
        TArray<double> m_numberArray = null;

        public static TArray<int> m_rateValue = null;
        public DataTable setpara {
            get {
                return m_setpara;
            }
        }

        internal static void LoadComplexField_global_para( Global data, LuaDatabase.Query q ) {
            data.m_setpara = Dataset.LoadArray( "global_para", q );
        }

        static public bool GetValue<T>( string str, ref T value ) {
            bool ret = false;
            var globalSet = Get( str );
            if ( globalSet != null && globalSet.m_setpara != null ) {
                value = globalSet.m_setpara.Get<T>( 0 );
                ret = true;
            }
            return ret;
        }

        static public T GetValue<T>( string key, T defaultVal = default(T) ) {
            T ret = default( T );
            var cfg = Get( key );
            if ( cfg != null && cfg.m_setpara != null ) {
                ret = cfg.m_setpara.Get<T>( 0 );
            }else {
                ret = defaultVal;
            }
            return ret;
        }

        static public DataTable GetSetpara( string key ) {
            var cfg = Get( key );
            if ( cfg != null ) {
                return cfg.setpara;
            }
            return null ;
        }

        static public TArray<int> GetQualityArrayValue() {
            if ( m_rateValue == null ) {
                Global globalpz = Get( "equip_quality_multi" );
                if ( globalpz != null ) {
                    var list = globalpz.setpara;
                    m_rateValue = new TArray<int>( new int[ list.GetArrayCount() ] );
                    for ( int i = 0; i < list.GetArrayCount(); ++i ) {
                        var sub = list.GetValue( i ).ToTable();
                        m_rateValue[ sub.GetValue( 0 ).ToInteger() ] = ( int )( sub.GetValue( 1 ).ToNumber() * 100 );
                    }
                }
            }
            return m_rateValue;
        }

        static public int GetValueByQuality( int quality ) {
            int ret = 0;
            var rateValue = GetQualityArrayValue();
            if ( quality < rateValue.Length ) {
                ret = rateValue[ quality ];
            }
            return ret;
        }

        static public void ClearCacheEx() {
            m_rateValue = null;
        }
    }
}
