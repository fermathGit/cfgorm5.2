
using System;
using System.Text;
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

    public partial class EquipmentEx {
        static EquipmentEx() {
            OnLoadComplexField_UniqueAddprop = Equipment.LoadComplexField_UniqueAddprop;
        }
    }

    public partial class Equipment {

        #region member_ex
        public List<EquipSpace.PropsInfo> m_baseProps = null;   // 装备基础属性
        public List<EquipSpace.PropsInfo> m_otherProps = null;    // 装备附加属性

        public const int hpmaxIndex = 1;
        public const int atk_phyIndex = 3;
        public const int atk_magIndex = 4;
        public const int def_phyIndex = 5;
        public const int def_magIndex = 6;
        #endregion

        #region props_ex
        public int Quality_max = 0;
        public int Tree_front = 0;
        public int Tree_pos = 0;

        public List<EquipSpace.PropsInfo> baseProps {
            get {
                if( m_baseProps == null ) {
                    AddBaseProps();
                }
                return m_baseProps;
            }
        }

        public List<EquipSpace.PropsInfo> otherProps {
            get {
                return m_otherProps;
            }
        }
        #endregion

        #region discard_props

        public float AtkDelay = 0;
        public int baozhu = 0;
        public float battlepower_add = 0;
        public int Class = 0;
        public string Description = string.Empty;
        public int ItemLevel = 0;
        public int PropType1 = 0;
        public int PropType2 = 0;
        public int PropType3 = 0;
        public int PropType4 = 0;
        public int PropType5 = 0;
        public int Min1 = 0;
        public int Min2 = 0;
        public int Min3 = 0;
        public int Min4 = 0;
        public int Min5 = 0;
        public int need_equipit = 0;
        public int Skill1 = 0;
        public int Skill2 = 0;
        public int TierBonusID = 0;
        public Int64 usefulLife = 0;
        public int UniqTierID = 0;
        #endregion

        void AddBaseProps() {
            int basePropsIndex = (int)EquipSpace.EquipPropsType.BaseProps;
            m_baseProps = new List<EquipSpace.PropsInfo>();
            AddProps( m_baseProps, basePropsIndex, Equipment.hpmaxIndex, hpmax );
            AddProps( m_baseProps, basePropsIndex, Equipment.atk_phyIndex, atk_phy );
            AddProps( m_baseProps, basePropsIndex, Equipment.atk_magIndex, atk_mag );
            AddProps( m_baseProps, basePropsIndex, Equipment.def_phyIndex, def_phy );
            AddProps( m_baseProps, basePropsIndex, Equipment.def_magIndex, def_mag );

            m_baseProps.Sort( ( a, b ) => {
                if( a.type != b.type ) {
                    return a.type - b.type;
                }

                var aProps = Database.Battleprop.Get( a.key );
                var bProps = Database.Battleprop.Get( b.key );
                if( aProps != null && bProps != null ) {
                    return aProps.orderby - bProps.orderby;
                }
                return -1;
            } );
        }

        static void AddProps( List<EquipSpace.PropsInfo> props, int type, int key, float value ) {
            if( value != 0 ) {
                props.Add( new EquipSpace.PropsInfo( type, key, value ) );
            }
        }

        internal static void LoadComplexField_UniqueAddprop( Equipment data, LuaDatabase.Query q ) {
            if( EquipmentEx.IsValid_UniqueAddprop ) {
                int otherPropsIndex = (int)EquipSpace.EquipPropsType.AddProps;
                data.m_otherProps = new List<EquipSpace.PropsInfo>();
                var props = Dataset.LoadIntArray( "UniqueAddprop", q );
                if( props != null ) {
                    for( int i = 0; i < props.Length; ++i ) {
                        var prop = Database.Equip_Addprop.Get( props[i] );
                        if( prop != null ) {
                            AddProps( data.m_otherProps, otherPropsIndex, prop.PropType, prop.Min );
                        }
                    }
                }
            } else {
                data.m_otherProps = __default.m_otherProps;
            }
        }
    }
}
