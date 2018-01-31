
using System;
using System.Collections.Generic;
using Common;
using UnityEngine;
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
    public partial class PhotoAction {
        static Dictionary<int, List<int>> photoCareerAction = new Dictionary<int, List<int>>();

        public static void ClearCacheEx() {
            photoCareerAction.Clear();
        }

        public static List<PhotoAction> GetPhotoActionByCareer( int career ) {
            if( photoCareerAction.Count <= 0 ) {
                CachePhotoActions();
            }

            List<int> list = null;
            photoCareerAction.TryGetValue( career, out list );
            if( list != null ) {
                List<PhotoAction> result = new List<PhotoAction>();
                for( int i = 0; i < list.Count; i++ ) {
                    result.Add( Get( list[i] ) );
                }
                return result;
            }
            return null;
        }

        public static void CachePhotoActions() {
            var ids = GetKeys();
            photoCareerAction.Clear();
            for( int i = 0; i < ids.Count; i++ ) {
                var r = Get( ids[i] );
                List<int> list = null;
                int careerId = r.id / 100;
                if( !photoCareerAction.TryGetValue( careerId, out list ) ) {
                    List<int> tempList = new List<int>();
                    photoCareerAction.Add( careerId, tempList );
                    tempList.Add( r.id );
                } else {
                    list.Add( r.id );
                }
            }
        }
    }
}
