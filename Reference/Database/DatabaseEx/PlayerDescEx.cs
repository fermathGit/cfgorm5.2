
using System;
using System.Collections.Generic;
using Common;
using UnityEngine;
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
    public partial class PlayerDescEx {
        static PlayerDescEx() {
            OnLoadComplexField_Equip = PlayerDesc.LoadComplexField_Equip;
            OnLoadComplexField_normalSkill = PlayerDesc.LoadComplexField_NormalSkill;
            OnLoadComplexField_includesimbo = PlayerDesc.LoadComplexField_includesimbo;
            OnLoadComplexField_cameraPos = PlayerDesc.LoadComplexField_Camrea;
            OnLoadComplexField_Equip_show = PlayerDesc.LoadComplexField_Equip_show;
            OnLoadComplexField_name_color = PlayerDesc.LoadComplexField_NameColor;
            OnLoadComplexField_Equip_showingame = PlayerDesc.LoadComplexField_Equip_showingame;
            OnLoadComplexField_bloom_player = PlayerDesc.LoadComplexField_bloom_player;
            OnLoadComplexField_skillcolor = PlayerDesc.LoadComplexField_SkillColor;
        }
    }
    public partial class PlayerDesc {
        const String ModelPathPattern = "Prefab/role/{0}";
        TArray<int> m_equip = null;
        TArray<int> m_normalSkill = null;
        TArray<int> m_runes = null;
        Vector3 m_cameraPos = Vector3.zero;
        Vector3 m_cameraAngles = Vector3.zero;
        Vector3 m_createRolePos = Vector3.zero;
        Vector3 m_femaleRotate = Vector3.zero;
        Vector3 m_maleRotate = Vector3.zero;
        Vector3 m_selectRolePos = Vector3.zero;
        Vector3 m_selectRoleCameraPos = Vector3.zero;
        Vector3 m_selectRoleCameraAngles = Vector3.zero;
        TArray<int> m_showEquip = null;
        TArray<int> m_showInGameEquip = null;
        TArray<double> m_bloom_player = null;
        TArray<TArray<int>> m_color = null;
        String m_vfxSound = String.Empty;
        String m_femaleSound = String.Empty;
        String m_maleSound = String.Empty;
        String m_cameraAnim = String.Empty;
        Color m_skillColor = default( Color );

        public static String GetModelPath( String model ) {
            var path = Common.StringUtils.newStringBuilder;
            return path.AppendFormat( ModelPathPattern, model ).ToString();
        }
        public static String GetHighModelPath( String highmodel ) {
            var path = Common.StringUtils.newStringBuilder;
            return path.AppendFormat( ModelPathPattern, highmodel ).ToString();
        }
        public static String GetChangeHighModelPath( String changehighmodel ) {
            var path = Common.StringUtils.newStringBuilder;
            return path.AppendFormat( ModelPathPattern, changehighmodel ).ToString();
        }

        public TArray<int> showEquip {
            get {
                return m_showEquip;
            }
        }

        public TArray<int> showInGameEquip {
            get {
                return m_showInGameEquip;
            }
        }

        public String vfxSound {
            get {
                if ( m_vfxSound == String.Empty ) {
                    m_vfxSound = "player_" + id;
                }
                return m_vfxSound;
            }
        }

        public String femaleSound {
            get {
                if ( m_femaleSound == String.Empty ) {
                    m_femaleSound = string.Format( "st_{0}_f", id );
                }
                return m_femaleSound;
            }
        }

        public String cameraAnim {
            get {
                if ( m_cameraAnim == String.Empty ) {
                    m_cameraAnim = string.Format( "login_cam_player_{0}", id );
                }
                return m_cameraAnim;
            }
        }

        public String maleSound {
            get {
                if ( m_maleSound == String.Empty ) {
                    m_maleSound = string.Format( "st_{0}_m", id );
                }
                return m_maleSound;
            }
        }

        public int blur_inter {
            get { return m_bloom_player != null && m_bloom_player.Length > 1 ? ( int ) m_bloom_player[1] : 1; }
        }

        public float blursize {
            get { return m_bloom_player != null && m_bloom_player.Length > 2 ? ( float ) m_bloom_player[2] : 0.55f; }
        }

        public int down_sample {
            get { return m_bloom_player != null && m_bloom_player.Length > 0 ? ( int ) m_bloom_player[0] : 1; }
        }

        public float intensity {
            get { return m_bloom_player != null && m_bloom_player.Length > 4 ? ( float ) m_bloom_player[4] : 0.3f; }
        }

        public float threshhold {
            get { return m_bloom_player != null && m_bloom_player.Length > 3 ? ( float ) m_bloom_player[3] : 0.5f; }
        }

        public bool IsInNormalSkill( int skillId ) {
            if ( m_normalSkill != null ) {
                for ( int i = 0; i < m_normalSkill.Length; i++ ) {
                    if ( normalSkill[ i ] == skillId ) {
                        return true;
                    }
                }
            }
            return false;
        }

        public TArray<int> Equip {
            get {
                return m_equip;
            }
        }

        public TArray<int> normalSkill {
            get {
                return m_normalSkill;
            }
        }

        public TArray<int> runes {
            get {
                return m_runes;
            }
        }

        public Vector3 cameraPos {
            get {
                return m_cameraPos;
            }
        }

        public Vector3 cameraAngles {
            get {
                return m_cameraAngles;
            }
        }

        public Vector3 createRolePos {
            get {
                return m_createRolePos;
            }
        }

        public Vector3 selectRolePos {
            get {
                return m_selectRolePos;
            }
        }

        public Vector3 selectRoleCameraPos {
            get {
                return m_selectRoleCameraPos;
            }
        }

        public Vector3 selectRoleCameraAngles {
            get {
                return m_selectRoleCameraAngles;
            }
        }

        public Vector3 femaleRotate {
            get {
                return m_femaleRotate;
            }
        }

        public Vector3 maleRotate {
            get {
                return m_maleRotate;
            }
        }

        public TArray<TArray<int>> color {
            get {
                return m_color;
            }
        }

        public Color skillColor {
            get {
                return m_skillColor;
            }
        }

        internal static void LoadComplexField_NormalSkill( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_normalSkill = PlayerDescEx.IsValid_normalSkill ? Dataset.LoadIntArray( "normalSkill", q ) : __default.m_normalSkill;
        }

        internal static void LoadComplexField_Equip( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_equip = PlayerDescEx.IsValid_Equip ? Dataset.LoadIntArray( "Equip", q ) : __default.m_equip;
        }

        internal static void LoadComplexField_Equip_show( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_showEquip = PlayerDescEx.IsValid_Equip_show ? Dataset.LoadIntArray( "Equip_show", q ) : __default.m_showEquip;
        }

        internal static void LoadComplexField_Equip_showingame( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_showInGameEquip = PlayerDescEx.IsValid_Equip_showingame ? Dataset.LoadIntArray( "Equip_showingame", q ) : __default.m_showInGameEquip;
        }

        internal static void LoadComplexField_includesimbo( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_runes = PlayerDescEx.IsValid_includesimbo ? Dataset.LoadIntArray( "includesimbo", q ) : __default.m_runes;
        }

        internal static void LoadComplexField_bloom_player(PlayerDesc data, LuaDatabase.Query q) {
            data.m_bloom_player = PlayerDescEx.IsValid_bloom_player ? Dataset.LoadNumberArray( "bloom_player", q ) : __default.m_bloom_player;
        }

        internal static void LoadComplexField_Camrea( PlayerDesc data, LuaDatabase.Query q ) {
            if ( PlayerDescEx.IsValid_cameraPos ) {
                TArray<double> pos = Dataset.LoadNumberArray( "cameraPos", q );
                if ( pos != null && pos.Length >= 3 ) {
                    data.m_cameraPos.x = (float)pos[0];
                    data.m_cameraPos.y = (float)pos[1];
                    data.m_cameraPos.z = (float)pos[2];
                }
            } else {
                data.m_cameraPos = __default.m_cameraPos;
            }

            if ( PlayerDescEx.IsValid_cameraAngles ) {
                TArray<double> angles = Dataset.LoadNumberArray( "cameraAngles", q );
                if ( angles != null && angles.Length >= 3 ) {
                    data.m_cameraAngles.x = (float)angles[0];
                    data.m_cameraAngles.y = (float)angles[1];
                    data.m_cameraAngles.z = (float)angles[2];
                }
            } else {
                data.m_cameraAngles = __default.m_cameraAngles;
            }

            if ( PlayerDescEx.IsValid_rolePos ) {
                TArray<double> rolePos = Dataset.LoadNumberArray( "rolePos", q );
                if ( rolePos != null && rolePos.Length >= 3 ) {
                    data.m_createRolePos.x = (float)rolePos[0];
                    data.m_createRolePos.y = (float)rolePos[1];
                    data.m_createRolePos.z = (float)rolePos[2];
                }
            } else {
                data.m_createRolePos = __default.m_createRolePos;
            }


            if ( PlayerDescEx.IsValid_rolePos_login ) {
                var selectRolePos = Dataset.LoadNumberArray( "rolePos_login", q );
                if ( selectRolePos != null && selectRolePos.Length >= 3 ) {
                    data.m_selectRolePos.x = (float)selectRolePos[0];
                    data.m_selectRolePos.y = (float)selectRolePos[1];
                    data.m_selectRolePos.z = (float)selectRolePos[2];
                }
            } else {
                data.m_selectRolePos = __default.m_selectRolePos;
            }


            if ( PlayerDescEx.IsValid_cameraPos_login ) {
                var scp = Dataset.LoadNumberArray( "cameraPos_login", q );
                if ( scp != null && scp.Length >= 3 ) {
                    data.m_selectRoleCameraPos.x = (float)scp[0];
                    data.m_selectRoleCameraPos.y = (float)scp[1];
                    data.m_selectRoleCameraPos.z = (float)scp[2];
                }
            } else {
                data.m_selectRoleCameraPos = __default.m_selectRoleCameraPos;
            }


            if ( PlayerDescEx.IsValid_cameraAngles_login ) {
                var sca = Dataset.LoadNumberArray( "cameraAngles_login", q );
                if ( sca != null && sca.Length >= 3 ) {
                    data.m_selectRoleCameraAngles.x = (float)sca[0];
                    data.m_selectRoleCameraAngles.y = (float)sca[1];
                    data.m_selectRoleCameraAngles.z = (float)sca[2];
                }
            } else {
                data.m_selectRoleCameraAngles = __default.m_selectRoleCameraAngles;
            }


            if ( PlayerDescEx.IsValid_roleAngles_female ) {
                var femaleRotate = Dataset.LoadNumberArray( "roleAngles_female", q );
                if ( femaleRotate != null && femaleRotate.Length >= 3 ) {
                    data.m_femaleRotate.x = (float)femaleRotate[0];
                    data.m_femaleRotate.y = (float)femaleRotate[1];
                    data.m_femaleRotate.z = (float)femaleRotate[2];
                }
            } else {
                data.m_femaleRotate = __default.m_femaleRotate;
            }


            if ( PlayerDescEx.IsValid_roleAngles_male ) {
                var maleRotate = Dataset.LoadNumberArray( "roleAngles_male", q );
                if ( maleRotate != null && maleRotate.Length >= 3 ) {
                    data.m_maleRotate.x = (float)maleRotate[0];
                    data.m_maleRotate.y = (float)maleRotate[1];
                    data.m_maleRotate.z = (float)maleRotate[2];
                }
            } else {
                data.m_maleRotate = __default.m_maleRotate;
            }

        }

        internal static void LoadComplexField_NameColor( PlayerDesc data, LuaDatabase.Query q ) {
            data.m_color = Dataset.LoadIntArray2d( "name_color", q );
        }

        internal static void LoadComplexField_SkillColor( PlayerDesc data, LuaDatabase.Query q ) {
            var c = Dataset.LoadIntArray( "skillcolor", q );
            data.m_skillColor = new Color( c[0] / 255f, c[1] / 255f, c[2] / 255f );
        }
    }
}
