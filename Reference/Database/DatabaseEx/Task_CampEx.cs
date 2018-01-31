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
    public partial class Task_CampEx {
        static Task_CampEx() {
            OnLoadComplexField_taskId = Task_Camp.OnLoadComplexField_taskId;
        }
    }
    public partial class Task_Camp {

        TArray<int> m_TaskId;
        public TArray<int> TaskId { get { return m_TaskId; } }

        internal static void OnLoadComplexField_taskId( Task_Camp data, LuaDatabase.Query q ) {
            data.m_TaskId = Task_CampEx.IsValid_taskId ? Dataset.LoadIntArray( "taskId", q ) : __default.m_TaskId;
        }
    }
}
