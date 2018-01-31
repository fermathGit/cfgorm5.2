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
    public partial class EquipIntenMain {
        public static Dictionary<int, EquipIntenMain> m_equipIntenMain = new Dictionary<int, EquipIntenMain>();

        public static EquipIntenMain GetEquipIntenMainValue( int lv ) {
            //EquipEnhancementPanel.EnhancementValueType info = new EquipEnhancementPanel.EnhancementValueType();
            if ( m_equipIntenMain.ContainsKey( lv ) ) {
                return m_equipIntenMain[lv];
            } else {
                var db = Get( lv );
                if ( db != null ) {
                    m_equipIntenMain.Add( lv, db );
                    return db;
                }
            }
            return null;
        }

        public static void ClearCacheEx() {
            m_equipIntenMain.Clear();
        }
    }
}
