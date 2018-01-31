
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


    public partial class MoveToRoleFaceEx {
        static MoveToRoleFaceEx() {
            OnLoadComplexField_site = MoveToRoleFace.onLoadComplexField_Site;
        }
    }

    public partial class MoveToRoleFace {
        private TArray<TArray<double>> m_moveToInfo = null;

        public TArray<TArray<double>> MoveToInfo { get { return m_moveToInfo; } }

        internal static void onLoadComplexField_Site( MoveToRoleFace data, LuaDatabase.Query q ) {
            data.m_moveToInfo = MoveToRoleFaceEx.IsValid_site ? Dataset.LoadNumberArray2d( "site", q ) : __default.m_moveToInfo;
        }

        public static bool GetMoveToFace( int mapId, float x, float y, out float face ) {
            bool ret = false;
            face = 0;
            var info = Get( mapId );
            if( info != null && info.m_moveToInfo != null ) {
                for( int i = 0; i < info.m_moveToInfo.Length; ++i ) {
                    var temp = info.m_moveToInfo[i];
                    if( temp == null || temp.Length < 3 ) {
                        continue;
                    }
                    if( Math.Abs( x - temp[0] ) < 0.5f && Math.Abs( y - temp[1] ) < 0.5f ) {
                        ret = true;
                        face = (float)temp[2];
                        break;
                    }
                }
            }
            return ret;
        }
    }
}
