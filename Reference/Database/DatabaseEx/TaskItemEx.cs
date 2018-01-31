
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
    public partial class TaskItemEx {
        static TaskItemEx() {
            OnLoadComplexField_show_range = TaskItem.OnLoadComplexField_show_range;
        }
    }

    public partial class TaskItem {
        public enum TaskItemType {
            Task = 0, // 任务采集
            BaoXiang = 1, // 可采集的宝箱
            DaPao = 2, // 仙盟王城战的大炮
            Zhanqi = 3, // 战旗
            WuZi = 4, // 可采集的物资
        }

        public enum TaskHandleType {
            None = 0,       // 不做任何处理
            PromptHandle,   // 手势提示触发
            AutoHandle      // 靠近自动触发
        }

        private float m_showRangeRadiu = 0;
        protected UnityEngine.Color m_showRangeColor;

        public float showRangeRadiu { get { return m_showRangeRadiu; } }
        public UnityEngine.Color showRangeColor { get { return m_showRangeColor; } }

        internal static void OnLoadComplexField_show_range( TaskItem data, LuaDatabase.Query q ) {
            var showRange = Dataset.LoadNumberArray( "show_range", q );
            if( showRange != null && showRange.Length >= 2 ) {
                data.m_showRangeRadiu = (float)showRange[0];
                var colorDb = ColorDB.Get( (int)showRange[1] );
                if( colorDb != null ) {
                    data.m_showRangeColor = colorDb.getColor;
                }
            }
        }
    }
}
