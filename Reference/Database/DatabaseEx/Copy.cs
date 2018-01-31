using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Database;


namespace Database
{

    // copys
    public class Copy
    {
        #region typedef

        /*
         * 副本进入条件：
         * 1.角色等级
         * 2.前置任务
         * 3.背包内拥有道具ID
         * */
        public enum TCondition
        {
            Level = 1,
            Task = 2,
            Item = 3,
        }

        public class Condition
        {
            public TCondition m_cond;
            public int m_difficulty;            
            public int m_param;
        }

        // copy data
        public class CopyData
        {
            public Mapsetting m_map;
            public List<Condition> m_conds;
            
            public int m_highestScore = 0;
            public float m_lastReqTime = 0f;

            public CopyData()
            {
                m_conds = new List<Condition>();
            }
        }

        #endregion

        #region member

        ////<mapid, copy>
        static Dictionary<int, CopyData> s_copys = null;

        //// <group, difficultys>
        static Dictionary<int, List<CopyData>> s_copyGroup = null;

        // <subtype, Dictionary<group, List<CopyData> >
        static Dictionary<int, Dictionary<int, List<CopyData>>> s_copyDiff = null;

        #endregion


        #region method
        public static void InitCopyConfig()
        {
            if (s_copys == null)
                LoadFromMapConfig();
        }


        public static void ClearCacheEx() {
            ClearData();
        }

        public static void ClearData()
        {
            if (s_copys != null)
                s_copys.Clear();
            s_copys = null;

            //// <group, difficultys>
            if (s_copyGroup != null)
                s_copyGroup.Clear();
            s_copyGroup = null;

            // <subtype, Dictionary<group, List<CopyData> >
            if (s_copyDiff != null)
                s_copyDiff.Clear();
            s_copyDiff = null;
        }

        // load data
        static void LoadFromMapConfig()
        {
            s_copys = new Dictionary<int, CopyData>();
            s_copyGroup = new Dictionary<int, List<CopyData>>();
            s_copyDiff = new Dictionary<int, Dictionary<int, List<CopyData>>>();

            // parse
            var ids = Mapsetting.GetKeys();
            for (int i = 0; i < ids.Count; ++i)
            {
                Mapsetting map = Mapsetting.Get(ids[i]);
                if (map != null && map.type == (int)TMapType.Copy)
                {
                    CopyData cp = new CopyData();

                    // map
                    cp.m_map = map;

                    //TODO ...more condition.
                    s_copys.Add(map.id, cp);

                    // groups
                    {
                        List<CopyData> groups = null;
                        if (!s_copyGroup.TryGetValue(map.Instance_group, out groups))
                        {
                            groups = new List<CopyData>();
                            s_copyGroup.Add(map.Instance_group, groups);
                        }
                        groups.Add(cp);
                    }

                    // diffs
                    {
                        Dictionary<int, List<CopyData>> subs = null;
                        if (!s_copyDiff.TryGetValue(map.subtype, out subs))
                        {
                            subs = new Dictionary<int, List<CopyData>>();
                            s_copyDiff.Add(map.subtype, subs);
                        }
                        // groups
                        List<CopyData> diffGroup = null;
                        if (!subs.TryGetValue(map.Instance_group, out diffGroup))
                        {
                            diffGroup = new List<CopyData>();
                            subs.Add(map.Instance_group, diffGroup);
                        }
                        diffGroup.Add(cp);
                    }
                }
            }
        }

        // return copys
        protected static Dictionary<int, CopyData> copys
        {
            get
            {
                if (s_copys == null)
                    LoadFromMapConfig();

                return s_copys;
            }
        }

        protected static Dictionary<int, List<CopyData>> groups
        {
            get
            {
                if (s_copyGroup == null)
                    LoadFromMapConfig();
                return s_copyGroup;
            }
        }

        public static Dictionary<int, List<CopyData>> difficultys(int subtype)
        {
            if (s_copyDiff == null)
                LoadFromMapConfig();

            Dictionary<int, List<CopyData>> subs = null;
            s_copyDiff.TryGetValue(subtype, out subs);
            return subs;
        }

        public static bool HasDifficuty(int subtype)
        {
            return difficultys(subtype) != null;
        }

        public static bool IsMapInGroup(int mapid, int group)
        {
            CopyData cp = Copy.GetCopy(mapid);
            return (cp != null && cp.m_map.Instance_group == group);
        }

        public static List<CopyData> GetGroup(int group)
        {
            List<CopyData> diffs = null;
            Copy.groups.TryGetValue(group, out diffs);            
            return diffs;
        }

        public static int GetCount(int group)
        {
            List<CopyData> diffs = GetGroup(group);
            return diffs == null ? 0 : diffs.Count;
        }

        // return copy by mapid
        public static CopyData GetCopy(int group, int diff)
        {
            List<CopyData> diffs = null;
            Copy.groups.TryGetValue(group, out diffs);
            if ( diffs != null && diffs.Count > 0)
            {
                return diffs[0];
            }
            return null;
        }

        public static CopyData GetMinHeroGroup(int instance_group)
        {
            CopyData ret = null;
            List<CopyData> diffs = null;
            Copy.groups.TryGetValue(instance_group, out diffs);
            if (diffs != null && diffs.Count > 0)
            {
                ret = diffs[0];
                for (int i = 1; i < diffs.Count; ++i)
                {
                    ret = diffs[i];
                        
                }
            }
            return ret;
        }

        // return copy by mapid
        public static CopyData GetCopy(int id)
        {
            Dictionary<int, CopyData> cps = Copy.copys;
            CopyData cp = null;
            cps.TryGetValue(id, out cp);
            return cp;
        }

        public static void SetCopyHightScore(int id, int score, float time)
        {
            CopyData cp = Copy.GetCopy(id);
            if (cp != null)
            {
                cp.m_highestScore = score;
                cp.m_lastReqTime = time;
            }
        }

        public static void ResetScore()
        {
            if (s_copys != null)
            {
                foreach (KeyValuePair<int, CopyData> kv in s_copys)
                {
                    kv.Value.m_lastReqTime = 0f;
                    kv.Value.m_highestScore = 0;
                }
            }
        }
        #endregion
    }
}