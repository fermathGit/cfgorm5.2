
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
public struct SFXCfg {
    public String ChargeSound;
    public int ChargeDelay;
    public String ActionSound;
    public int ActionDelay;
    public String PrepareSound;
    public int PrepareDelay;
    public String MissileSound;
    public int MissileDelay;
    public String BeAtkSound;
    public int BeAtkDelay;
    public String AbsorbSound;
    public int AbsorbDelay;
}

namespace Database {
    public partial class SkillEx {
        static SkillEx() {
            OnLoadComplexField_Effects = Skill.LoadComplexField;
            OnLoadComplexField_PetSkill_lvupitem=Skill.onLoadComplexField_PetSkill_lvupitem;
            OnLoadComplexField_PetSkill_lvupnum = Skill.onLoadComplexField_PetSkill_lvupnum;
            OnLoadComplexField_Skill_numdisplay = Skill.onLoadComplexField_Skill_numdisplay;
        }
    }

    public partial class Skill {
        #region member_ex
        TArray<int> m_effects = null;
        TArray<double> m_autoSkillCondition = null;
        TArray<int> m_skillGroupList = null;
        TArray<int> m_comboSkillIdList = null;
        
        Int32 m_baseCD;  // 从配置读出来的cd，用于加速运算
        float m_cd;
        Int32 m_skillID;  // 技能ID
        List<string> m_attackSfxSlotsList;            // 攻击特效自身挂载点
        bool m_isHandClick = false;
        private TArray<int> m_petSkill_lvupitem = null;
        private TArray<int> m_petSkill_lvupnum = null;
        private TArray<TArray<double>> m_numdisplay = null;
        #endregion
        #region props_ex
        public TArray<int> Effects { get { return m_effects; } }
        public TArray<double> AutoSkillCondition { get { return m_autoSkillCondition; } }
        public TArray<int> SkillGroupList { get { return m_skillGroupList; } }
        public TArray<int> ComboSkillIdList { get { return m_comboSkillIdList; } }
        public Int32 BaseCD { get { return m_baseCD; } set { m_baseCD = value; } }
        public float Cd { get { return m_cd; } set { m_cd = value; } }
        public Int32 SkillID { get { return m_skillID; } set { m_skillID = value; } }
        public List<string> AttackSfxSlotsList { get { return m_attackSfxSlotsList; } set { m_attackSfxSlotsList = value; } }
        public bool IsHandClick { get { return m_isHandClick; } set { m_isHandClick = value; } }
        public TArray<TArray<double>> numdisplay { get { return m_numdisplay; } }
        public TArray<int> PetSkill_lvupitem { get { return m_petSkill_lvupitem; } set { m_petSkill_lvupitem = value; } }
        public TArray<int> PetSkill_lvupnum { get { return m_petSkill_lvupnum; } set { m_petSkill_lvupnum = value; } }
        #endregion
        #region loadex
        public static void LoadComplexField( Skill data, LuaDatabase.Query q ){
            data.m_effects = SkillEx.IsValid_Effects ? Dataset.LoadIntArray( "Effects", q ) : __default.m_effects;
            data.m_autoSkillCondition = SkillEx.IsValid_AutoSkillCondition ? Dataset.LoadNumberArray( "AutoSkillCondition", q ) : __default.m_autoSkillCondition;
            data.m_skillGroupList = SkillEx.IsValid_SkillGroup_Lead ? Dataset.LoadIntArray( "SkillGroup_Lead", q ) : __default.m_skillGroupList;
            data.m_comboSkillIdList = SkillEx.IsValid_ComboLead ? Dataset.LoadIntArray( "ComboLead", q ) : __default.m_comboSkillIdList;
            if ( string.IsNullOrEmpty( data.SkillBeAtkSlots ) || data.SkillBeAtkSlots == "0") {
                data.m_SkillBeAtkSlots = "slot_hit";
            }
            data.BaseCD = data.SkillCoolDown;
            data.Cd = data.SkillCoolDown;
            data.SkillID = data.id;
            if ( __default == null || __default.SkillAttackSfxSlots != data.SkillAttackSfxSlots ) {
                data.AttackSfxSlotsList = ParseDataStr( ( data.SkillAttackSfxSlots == "0" ? "" : data.SkillAttackSfxSlots ) );
            } else {
                data.AttackSfxSlotsList = __default.AttackSfxSlotsList;
            }
            ResetString( data );
        }

        private static List<String> ParseDataStr( String str ) {
            String[] strs = str.Split( ',', ';', '|' );
            List<String> outStrList = new List<string>();
            for ( int n = 0; n < strs.Length; ++n ) {
                outStrList.Add( strs[n] );
            }
            return outStrList;
        }

        private static void ResetString( Skill data ) {
            string value = data.SkillName;
            data.m_SkillName = ( value == "0" ? "" : value );
            value = data.SkillAction;
            data.m_SkillAction = ( value == "0" ? "" : value );
            value = data.SkillPrepareAction;
            data.m_SkillPrepareAction = ( value == "0" ? "" : value );
            value = data.SkillPrepareSfx;
            data.m_SkillPrepareSfx = ( value == "0" ? "" : value );
            value = data.SkillPrepareSfxSlots;
            data.m_SkillPrepareSfxSlots = ( value == "0" ? "" : value );
            value = data.ChargeAction;
            data.m_ChargeAction = ( value == "0" ? "" : value );
            value = data.ChargeSfx;
            data.m_ChargeSfx = ( value == "0" ? "" : value );
            value = data.ChargeSfxSlots;
            data.m_ChargeSfxSlots = ( value == "0" ? "" : value );
            value = data.SkillAttackSfx;
            data.m_SkillAttackSfx = ( value == "0" ? "" : value );
            value = data.SkillMissileSfx;
            data.m_SkillMissileSfx = ( value == "0" ? "" : value );
            value = data.SkillMissileSfxSlot;
            data.m_SkillMissileSfxSlot = ( value == "0" ? "" : value );
            value = data.SkillBeAtkSfx;
            data.m_SkillBeAtkSfx = ( value == "0" ? "" : value );
            value = data.ActionSound;
            data.m_ActionSound = ( value == "0" ? "" : value );
        }
        #endregion

        internal static void onLoadComplexField_PetSkill_lvupitem( Skill data, LuaDatabase.Query q ) {
            data.m_petSkill_lvupitem = SkillEx.IsValid_PetSkill_lvupitem ? Dataset.LoadIntArray( "PetSkill_lvupitem", q ) : __default.m_petSkill_lvupitem;
        }

        internal static void onLoadComplexField_PetSkill_lvupnum( Skill data, LuaDatabase.Query q ) {
            data.m_petSkill_lvupnum = SkillEx.IsValid_PetSkill_lvupnum ? Dataset.LoadIntArray( "PetSkill_lvupnum", q ) : __default.m_petSkill_lvupnum;
        }

        internal static void onLoadComplexField_Skill_numdisplay( Skill data, LuaDatabase.Query q ) {
            data.m_numdisplay = SkillEx.IsValid_Skill_numdisplay ? Dataset.LoadNumberArray2d( "Skill_numdisplay", q ) : __default.m_numdisplay;
        }
    }
}
