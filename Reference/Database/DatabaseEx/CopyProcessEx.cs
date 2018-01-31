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

    public partial class CopyProcessEx {
        static CopyProcessEx() {
            OnLoadComplexField_killMonsterIds = CopyProcess.LoadComplexField_killMonsterIds;
        }
    }

    public partial class CopyProcess {

        TArray<int> m_killMonsterIds = null;

        public TArray<int> killMonsterIds {
            get {
                return m_killMonsterIds;
            }
        }

        internal static void LoadComplexField_killMonsterIds( CopyProcess data, LuaDatabase.Query q ) {
#if UNITY_EDITOR
            data.m_killMonsterIds = Dataset.LoadIntArray( "killMonsterIds", q );
#endif
        }
    }
}
