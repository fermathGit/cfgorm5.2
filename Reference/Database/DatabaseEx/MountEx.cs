
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

    public partial class MountEx {
        static MountEx() {
            OnLoadComplexField_stage_itemid = Mount.onLoadComplexField_stage_itemid;
            OnLoadComplexField_stage_level = Mount.onLoadComplexField_stage_level;
            OnLoadComplexField_stage_itemnum = Mount.onLoadComplexField_stage_itemnum;
            OnLoadComplexField_stage_uprate = Mount.onLoadComplexField_stage_uprate;
            OnLoadComplexField_mountvfx = Mount.onLoadComplexField_mountvfx;
            OnLoadComplexField_achive_mounts = Mount.onLoadComplexField_achive_mounts;
        }
    }

    public partial class Mount {

        private TArray<int> m_stage_itemid = null;
        public TArray<int> stage_itemid { get { return m_stage_itemid; } set { m_stage_itemid = value; } }
        private TArray<int> m_stage_level = null;
        public TArray<int> stage_level { get { return m_stage_level; } set { m_stage_level = value; } }
        private TArray<int> m_stage_itemnum = null;
        public TArray<int> stage_itemnum { get { return m_stage_itemnum; } set { m_stage_itemnum = value; } }
        private TArray<double> m_stage_uprate = null;
        public TArray<double> stage_uprate { get { return m_stage_uprate; } set { m_stage_uprate = value; } }

        TArray<TArray<int>> m_levelDic = null;

        private TArray<int> m_achive_mounts = null;
        public TArray<int> achive_mounts { get { return m_achive_mounts; } set { m_achive_mounts = value; } }

        public int MountModelID {
            get { return m_id; }
        }



        internal static void onLoadComplexField_stage_itemid( Mount data, LuaDatabase.Query q ) {
            data.m_stage_itemid = MountEx.IsValid_stage_itemid ? Dataset.LoadIntArray( "stage_itemid", q ) : __default.m_stage_itemid;
        }
        internal static void onLoadComplexField_stage_level( Mount data, LuaDatabase.Query q ) {
            data.m_stage_level = MountEx.IsValid_stage_level ? Dataset.LoadIntArray( "stage_level", q ) : __default.m_stage_level;
        }
        internal static void onLoadComplexField_stage_itemnum( Mount data, LuaDatabase.Query q ) {
            data.m_stage_itemnum = MountEx.IsValid_stage_itemnum ? Dataset.LoadIntArray( "stage_itemnum", q ) : __default.m_stage_itemnum;
        }
        internal static void onLoadComplexField_stage_uprate( Mount data, LuaDatabase.Query q ) {
            data.m_stage_uprate = MountEx.IsValid_stage_uprate ? Dataset.LoadNumberArray( "stage_uprate", q ) : __default.m_stage_uprate;
        }

        internal static void onLoadComplexField_mountvfx( Mount data, LuaDatabase.Query q ) {
            data.m_levelDic = MountEx.IsValid_mountvfx ? Dataset.LoadIntArray2d( "mountvfx", q ) : __default.m_levelDic;
        }
        internal static void onLoadComplexField_achive_mounts( Mount data, LuaDatabase.Query q ) {
            data.m_achive_mounts = MountEx.IsValid_achive_mounts ? Dataset.LoadIntArray( "achive_mounts", q ) : __default.m_achive_mounts;
        }
    }
}
