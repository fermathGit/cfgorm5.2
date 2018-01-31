
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
namespace Database
{
    public partial class ShowOne
    {
        const string headPathPre = "NpcShow_";
        const string localPleyerNameFromConfig = "0";
        static Dictionary<int, List<int>> dicContentByGroupId = new Dictionary<int, List<int>>();

        public static Dictionary<int, List<int>> DicContentByGroupId
        {
            get { return ShowOne.dicContentByGroupId; }
        }
        
        public static void ClearCacheEx() {
            dicContentByGroupId.Clear();
        }

        public static List<ShowOne> GetShowOneByGroupId(int groupId)
        {
            List<int> list = null;
            if( dicContentByGroupId.Count == 0 ) {
                CacheContentIdByGroup();
            }
            dicContentByGroupId.TryGetValue(groupId, out list);
            if (list != null)
            {
                List<ShowOne> result = new List<ShowOne>();
                for (int i = 0; i < list.Count; i++)
                {
                    result.Add(Get(list[i]));
                }
                return result;
            }
            return null;
        }

        public static void CacheContentIdByGroup()
        {
            var ids = GetKeys();
            dicContentByGroupId.Clear();
            for (int i = 0; i < ids.Count; i++)
            {
                var r = Get(ids[i]);
                List<int> list = null;
                if (!dicContentByGroupId.TryGetValue(r.showgroupid_1, out list))
                {
                    List<int> tempList = new List<int>();
                    dicContentByGroupId.Add(r.showgroupid_1, tempList);
                    tempList.Add(r.id);
                }
                else
                {
                    list.Add(r.id);
                }
            }
            foreach (List<int> l in dicContentByGroupId.Values)
            {
                l.Sort();
            }
        }
    }
}
