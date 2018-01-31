
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
    public partial class ShowThree {
        static Dictionary<int, List<int>> dicContentByGroupId = new Dictionary<int, List<int>>();

        public static Dictionary<int, List<int>> DicContentByGroupId {
            get { return ShowThree.dicContentByGroupId; }
        }

        public static void ClearCacheEx() {
            dicContentByGroupId.Clear();
        }

        public static List<ShowThree> GetShowThreeByGroupId( int groupId ) {
            if( dicContentByGroupId.Count <= 0 ) {
                CacheContentIdByGroup();
            }

            List<int> list = null;
            dicContentByGroupId.TryGetValue( groupId, out list );
            if( list != null ) {
                List<ShowThree> result = new List<ShowThree>();
                for( int i = 0; i < list.Count; i++ ) {
                    result.Add( Get( list[i] ) );
                }
                return result;
            }
            return null;
        }

        public static void CacheContentIdByGroup() {
            var ids = GetKeys();
            dicContentByGroupId.Clear();
            for( int i = 0; i < ids.Count; i++ ) {
                var r = Get( ids[i] );
                List<int> list = null;
                if( !dicContentByGroupId.TryGetValue( r.show3_group, out list ) ) {
                    List<int> tempList = new List<int>();
                    dicContentByGroupId.Add( r.show3_group, tempList );
                    tempList.Add( r.id );
                } else {
                    list.Add( r.id );
                }
            }
            foreach( List<int> l in dicContentByGroupId.Values ) {
                l.Sort();
            }
        }
    }
}
