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
    public partial class Equip_Inten_Carrier {
        public static Dictionary<int, EquipEnhancementPanel.EnhancementValueType> m_equipcarrier = new Dictionary<int, EquipEnhancementPanel.EnhancementValueType>();

        public static EquipEnhancementPanel.EnhancementValueType GetEquipCarrierValue( int carr ) {
            EquipEnhancementPanel.EnhancementValueType info = new EquipEnhancementPanel.EnhancementValueType();
            if ( m_equipcarrier.ContainsKey( carr ) ) {
                return m_equipcarrier[carr];
            } else {
                var db = Get(carr );
                if ( db != null ) {
                    info.Hp = db.hpmax;
                    info.AtkPhy = db.m_atk_phy;
                    info.AtkAmg = db.m_atk_mag;
                    info.DefMag = db.m_def_mag;
                    info.DefPhy = db.m_def_phy;
                    m_equipcarrier.Add( carr, info );
                    return info;
                }
            }
            return info;
        }

        public static void ClearCacheEx() {
            m_equipcarrier.Clear();
        }
    }

}
