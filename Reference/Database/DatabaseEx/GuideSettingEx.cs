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
    public partial class GuideSettingEx {
    }

    public partial class GuideSetting {
        public static List<GuideSetting> GetGuideSetListByPanelType( int panel, int guideType ) {
            var ret = new List<GuideSetting>();
            var keys = GetKeys();
            if ( keys != null ) {
                for ( int i = 0; i < keys.Count; i++ ) {
                    var item = GuideSetting.Get( keys[i] );
                    if ( item != null && item.planeid == panel ) {//item.guidetype == guideType 
                        ret.Add( item );
                    }
                }
            }
            return ret;
        }

        public static List<GuideSetting> GetGuideSetListByDailyId( int confId, int guideType ) {
            var ret = new List<GuideSetting>();
            var keys = GetKeys();
            if ( keys != null ) {
                for ( int i = 0; i < keys.Count; i++ ) {
                    var item = GuideSetting.Get( keys[i] );
                    if ( item != null && item.dailyid == confId ) {// && item.guidetype == guideType
                        ret.Add( item );
                    }
                }
            }
            return ret;
        }

        public static List<int> GetTypeList( int panel ) {
            var ret = new List<int>();
            var keys = GetKeys();
            if ( keys != null ) {
                for ( int i = 0; i < keys.Count; i++ ) {
                    var item = GuideSetting.Get( keys[i] );
                    if ( item != null && item.planeid == panel  ) {//&& ret.Contains( item.guidetype ) == false
                        ret.Add( 0 ); //item.guidetype 
                    }
                }
            }
            return ret;
        }
    }
}
