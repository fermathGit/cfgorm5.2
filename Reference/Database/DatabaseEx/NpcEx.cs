
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
    public enum NPCType {
        ForMission = 0, //任务NPC
        SpaceTimeCracks = 1, //时空裂痕
        WorldBoss = 2, //世界boss
        LuckDraw = 3, //抽奖
    }

    public partial class NpcEx {
        static NpcEx() {
            OnLoadComplexField_show_range = Npc.OnLoadComplexField_show_range;
        }
    }

    public partial class Npc {
        private float m_showRangeRadiu = 0;
        protected UnityEngine.Color m_showRangeColor;

        public float showRangeRadiu { get { return m_showRangeRadiu; } }
        public UnityEngine.Color showRangeColor { get { return m_showRangeColor; } }

        public String model {
            get { return m_modelid.ToString(); }
        }

        public String GetResourcePath() {
            return "Prefab/role/npc/n_" + m_modelid;
        }

        internal static void OnLoadComplexField_show_range( Npc data, LuaDatabase.Query q ) {
            if ( NpcEx.IsValid_show_range ) {
                var showRange = Dataset.LoadNumberArray( "show_range", q );
                if ( showRange != null && showRange.Length >= 2 ) {
                    data.m_showRangeRadiu = (float)showRange[0];
                    var colorDb = ColorDB.Get( (int)showRange[1] );
                    if ( colorDb != null ) {
                        data.m_showRangeColor = colorDb.getColor;
                    }
                }
            } else {
                data.m_showRangeRadiu = __default.m_showRangeRadiu;
                data.m_showRangeColor = __default.m_showRangeColor;
            }
        }
    }
}
