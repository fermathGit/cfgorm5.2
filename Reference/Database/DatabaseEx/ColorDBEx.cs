
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

    public partial class ColorDB {

        UnityEngine.Color? m_color = null;
        public UnityEngine.Color getColor {
            get {
                if( !m_color.HasValue ) {
                    m_color = new UnityEngine.Color( red / 255.0f, green / 255.0f, blue / 255.0f, 1.0f );
                }
                return m_color.Value;
            }
        }
    }
}
