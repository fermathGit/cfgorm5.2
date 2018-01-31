
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
    public partial class BuffEx
    {
        static BuffEx()
        {
        }
    }

    public partial class Buff {
        public static bool IsShow( Database.Buff buff ) {
            return buff != null && buff.BuffICON > 0;
        }

        public static bool IsShowCd( Database.Buff buff ) {
            return buff != null && buff.Duration_display == 0;
        }
    }
}
