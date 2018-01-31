using System;
using System.Collections.Generic;
using Common;
using EquipSpace;
using GwScene;

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
    public partial class Equip_Inten_Part {
        public static Dictionary<EquipSpace.EquipDefine, EquipEnhancementPanel.EnhancementValueType> m_equippart = new Dictionary<EquipSpace.EquipDefine, EquipEnhancementPanel.EnhancementValueType>();

        public static EquipEnhancementPanel.EnhancementValueType GetEquipParyValue( EquipSpace.EquipDefine type ) {
            EquipEnhancementPanel.EnhancementValueType info = new EquipEnhancementPanel.EnhancementValueType();
            if ( m_equippart.ContainsKey( type ) ) {
                return m_equippart[type];
            } else {
                 var db = Get( (int)type );
                if (db != null) {
                    info.Hp = db.hpmax;
                    info.AtkPhy = db.m_atk_phy;
                    info.AtkAmg = db.m_atk_mag;
                    info.DefMag = db.m_def_mag;
                    info.DefPhy = db.m_def_phy;
                    m_equippart.Add( type, info );
                    return info;
                }
            }
            return info;
        }

        public static List<PropsInfo> GetEquipEnhancementInfo( EquipDefine type, int lv ) {
            EquipEnhancementPanel.EnhancementValueType EquipDefineinfo = GetEquipParyValue( type );
            EquipEnhancementPanel.EnhancementValueType EquipCarrinfo = Database.Equip_Inten_Carrier.GetEquipCarrierValue( ( int )LPersistentData.career );
            Database.EquipIntenMain EquipIntenMainCur = lv == 0 ? null : Database.EquipIntenMain.GetEquipIntenMainValue( lv );
            if ( EquipIntenMainCur == null) {
                return null;
            }
            List<PropsInfo> list = new List<PropsInfo>();
            int hp = lv == 0 ? 0 : (int)( EquipDefineinfo.Hp * EquipCarrinfo.Hp * EquipIntenMainCur.hpmax );
            PropsInfo hpinfo = new PropsInfo( (int)EquipPropsType.Enhancement, 1, hp );
            int atkamg = lv == 0 ? 0 : (int)( EquipDefineinfo.AtkAmg * EquipCarrinfo.AtkAmg * EquipIntenMainCur.atk_mag );
            PropsInfo atkamginfo = new PropsInfo( (int)EquipPropsType.Enhancement, 4, atkamg );
            int atkphy = lv == 0 ? 0 : (int)( EquipDefineinfo.AtkPhy * EquipCarrinfo.AtkPhy * EquipIntenMainCur.atk_phy );
            PropsInfo atkphyinfo = new PropsInfo( (int)EquipPropsType.Enhancement, 3, atkphy );
            int defmag = lv == 0 ? 0 : (int)( EquipDefineinfo.DefMag * EquipCarrinfo.DefMag * EquipIntenMainCur.def_mag );
            PropsInfo defmaginfo = new PropsInfo( (int)EquipPropsType.Enhancement, 5, defmag );
            int defphy = lv == 0 ? 0 : (int)( EquipDefineinfo.DefPhy * EquipCarrinfo.DefPhy * EquipIntenMainCur.def_phy );
            PropsInfo defphyinfo = new PropsInfo( (int)EquipPropsType.Enhancement, 6, defphy );
            list.Add( hpinfo );
            list.Add( atkphyinfo );
            list.Add( atkamginfo );
            list.Add( defmaginfo );
            list.Add( defphyinfo );
            return list;
        }

        public static void ClearCacheEx() {
            m_equippart.Clear();
        }
    }
}
