
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
    public partial class ImprovePowerEx {
        static ImprovePowerEx() {
            OnLoadComplexField_Relation_UI = ImprovePower.LoadComplexField_Relation_UI;
            OnLoadComplexField_allParameter = ImprovePower.LoadComplexField_allParameter;
        }
    }

    public partial class ImprovePower {

        int[] m_parameters = null;
        int m_menuId = 0;
        int m_menuSonId = 0;

        public int menuId { get { return m_menuId; } }
        public int menuSonId { get { return m_menuSonId; } }

        // 获取不大于当前值的最大值
        public int GetMaxParameter( int value ) {
            int ret = 0;
            if( m_parameters != null ) {
                for( int i = 0; i < m_parameters.Length; ++i ) {
                    if( m_parameters[i] <= value ) {
                        ret = m_parameters[i];
                    } else {
                        break;
                    }
                }
            }
            return ret;
        }

        // 获取大于当前值的最小值
        public int GetMinParameter( int value ) {
            int ret = 0;
            if( m_parameters != null ) {
                for( int i = 0; i < m_parameters.Length; ++i ) {
                    if( m_parameters[i] > value ) {
                        ret = m_parameters[i];
                        break;
                    }
                }
            }
            return ret;
        }

        // 获取开始的一个参数
        public int GetStartParameter() {
            return m_parameters == null ? 0 : m_parameters[0];
        }

        // 0：直接配置			                        [0, 2, 10, 20]	
        // 1：等差配置 (初始值， 间距， 最大值)			[1, 1, 60]	
        internal static void LoadComplexField_allParameter( ImprovePower data, LuaDatabase.Query q ) {
            var temp = Dataset.LoadArray( "allParameter", q );
            if( temp != null ) {
                var count = temp.GetArrayCount();
                switch( data.parameterType ) {
                    case 0:
                        data.m_parameters = new int[count];
                        for( int i = 0; i < count; ++i ) {
                            data.m_parameters[i] = temp.Get<int>( i );
                        }
                        break;
                    case 1:
                        if( count == 3 ) {
                            int min = temp.Get<int>( 0 );
                            int dis = temp.Get<int>( 1 );
                            int max = temp.Get<int>( 2 );
                            count = ( max - min ) / dis + 1;
                            data.m_parameters = new int[count];
                            for( int i = 0; i < count; ++i ) {
                                data.m_parameters[i] = min + i * dis;
                            }
                        }
                        break;
                }
            }
        }

        internal static void LoadComplexField_Relation_UI( ImprovePower data, LuaDatabase.Query q ) {
            if ( ImprovePowerEx.IsValid_Relation_UI ) {
                var temp = Dataset.LoadArray( "Relation_UI", q );
                if ( temp != null && temp.GetArrayCount() == 2 ) {
                    data.m_menuId = temp.Get<int>( 0 );
                    data.m_menuSonId = temp.Get<int>( 0 );
                }
            } else {
                data.m_menuId = __default.m_menuId;
                data.m_menuSonId = __default.m_menuSonId;
            }
        }
    }
}
