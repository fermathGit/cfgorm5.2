
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

    /*admin:
     * 地图类型
     * 0 普通地图【有子类】
     * 1 副本
     * 2 位面    【有子类】
     * 3 玩法地图【有子类】
     * 4 剧情副本[scheduleConf调用copyProcess]
    * */
    public enum TMapType {
        Map = 0,
        Copy = 1,
        Planes = 2,
        PlayMap = 3, //玩法地图
        Campaign = 4,

        NoUse, //无用
    }

    /*张龙:
     * 子类型。
        1、经验副本
        2、金币副本
        3、宠物副本
        4、镇妖塔副本
        5、守护赤炎
        6、竞技场
        7、六道轮回
        8、单人战场
        9、仙盟驻地
        10、仙盟单人副本
        11、仙盟镖车
        12.仙盟王城战
        13.永恒战场
        14.混沌战场
     * */
    public enum TPlaySubType {
        None = -1,
        Normal = 0,
        Exp = 1,
        Coin = 2,
        Pet = 3,
        Tower = 4,
        ProTectNPC = 5,
        Arena = 6,
        SixTrs = 7,
        GirlBattle = 8,
        GuildHome = 9,
        GuildOne = 10,
        GuildDart = 11,
        GuildKingBattle = 12,
        ForeverFight = 13,
        ChaosFight = 14,
        Multiple = 15,
        ExpSecret = 16,
        SingleTower = 17,
        JJC4V4 = 18,
        End,
    }

    /*张龙:
     * 普通地图的子类型。
     */
    public enum TMapSubType {
        Normal = 0,
        TrainExp = 1,
        CampWar = 2,
        GuildWar = 3
    }
    /*admin:
     * 进入地图是否自动挂机
     * 0 不自动挂机
     * 1 挂机
     * 2 不自动挂机，且不显示挂机按钮
    * */
    public enum TMapFightAuto {
        EraseAutoAttack = 0,
        AutoAttack = 1,
        HideAutoAttack = 2,
    }

    /*调用关卡配置文件
     * 0.fb_process(普通关卡文件)
     * 1.copyProcess（特殊关卡文件）
     * */

    public enum TCopyType {
        Normal = 0,
        Special = 1,
    }

    /*
     * admin:
     * pk标注
     * 1 可以切磋
     * 2 可以杀戮
     * 1+2 都可以
     * */

    public enum MapSkillEffect {
        NoEffect = 0,
        Dark = 1,
        DarkAndHideMainPanel = 2,
        HideMainPanel = 3
    }

    public static class MapUtil {
        public static bool MapIsCopy( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.Copy ) {
                return true;
            }
            return false;
        }

        public static bool MapIsPlanes( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.Planes ) {
                return true;
            }
            return false;
        }

        public static bool MapIsGuildPVP( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap && map.subtype == ( int )Database.TPlaySubType.GuildHome ) {
                return true;
            }
            return false;
        }

        public static bool MapIsGuildDart( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap && map.subtype == ( int )Database.TPlaySubType.GuildDart ) {
                return true;
            }
            return false;
        }

        public static bool MapIsPractice( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.Map &&
                 map.subtype == (int)Database.TMapSubType.TrainExp ) {
                return true;
            }
            return false;
        }

        public static bool MapIsSoul( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.SixTrs ) {
                return true;
            }
            return false;
        }

        public static bool MapIsSingleTower( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.SingleTower ) {
                return true;
            }
            return false;
        }

        public static bool MapIsExp( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Exp ) {
                return true;
            }
            return false;
        }

        public static bool MapIsCoin( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Coin ) {
                return true;
            }
            return false;
        }

        public static bool MapIsPet( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Pet ) {
                return true;
            }
            return false;
        }

        public static bool MapIsJJC( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Arena ) {
                return true;
            }
            return false;
        }

        public static bool MapIsJJC4V4( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.JJC4V4 ) {
                return true;
            }
            return false;
        }

        public static bool MapIsCityWar( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.GuildKingBattle ) {
                return true;
            }
            return false;
        }

        public static bool MapIsGirlBattle( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.GirlBattle ) {
                return true;
            }
            return false;
        }

        public static bool MapIsProtectNPC( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.ProTectNPC ) {
                return true;
            }
            return false;
        }

        public static bool MapIsTower( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Tower ) {
                return true;
            }
            return false;
        }

        public static bool MapGuildHome( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.GuildHome ) {
                return true;
            }
            return false;
        }

        public static bool MapIsForeverFight( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.ForeverFight ) {
                return true;
            }
            return false;
        }

        public static bool MapIsGuildOne( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.GuildOne ) {
                return true;
            }
            return false;
        }

        public static bool MapIsChaosFight( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.ChaosFight ) {
                return true;
            }
            return false;
        }

        public static bool MapIsMultiple( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.Multiple ) {
                return true;
            }
            return false;
        }

        public static bool MapIsExpSecret( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.PlayMap &&
                 map.subtype == ( int )Database.TPlaySubType.ExpSecret ) {
                return true;
            }
            return false;
        }

        public static bool MapIsTrainExp( Mapsetting map ) {
            if ( map != null && map.type == (int)Database.TMapType.Map &&
                     map.subtype == (int)Database.TMapSubType.TrainExp ) {
                return true;
            }
            return false;
        }

        public static bool MapIsGuildWar( Mapsetting map ) {
            if ( map != null && map.type == ( int )Database.TMapType.Map &&
                 map.subtype == ( int )TMapSubType.GuildWar ) {
                return true;
            }
            return false;
        }

        public static bool IsPathFinding( Mapsetting map ) {
            return map != null && map.if_findpath == 1;
        }

        public static bool Is3DCameraMap( int mapId ) {
            return Is3DCameraMap( Database.Mapsetting.Get( mapId ) );
        }

        public static bool Is3DCameraMap( Mapsetting map ) {
            return map != null && map.cam_type == 1;
        }

        public static bool MapNeedFindMonster( Mapsetting map ) {
            if ( map != null && map.refresh_monster != 0 ) {
                return true;
            }
            return false;
        }
    }

    public partial class MapsettingEx {
        static MapsettingEx() {
            OnLoadComplexField_scheduleConf = Mapsetting.LoadComplexField_scheduleConf;
            OnLoadComplexField_drop_show = Mapsetting.LoadComplexField_drop_show;
            OnLoadComplexField_limit_item = Mapsetting.LoadComplexField_limit_item;
            OnLoadComplexField_point_TJ = Mapsetting.LoadComplexField_PointTianJi;
            OnLoadComplexField_point_XZ = Mapsetting.LoadComplexField_pointXuanZong;
        }
    }

    public partial class Mapsetting {

        // monster element
        public enum TMonsterElement {
            Attack, // 攻击
            Defens, // 防御
        }
        Dictionary<TMonsterElement, List<int>> m_mstElement = new Dictionary<TMonsterElement, List<int>>( 2 );

        // drop show
        TArray<int> m_dropShow = null;
        TArray<int> m_pointTianJi = null;
        TArray<int> m_pointXuanZong = null;

        // condition
        public TArray<int> m_lstCopySubCondition = null;

        // limit item
        public TArray<int> limit_item = null;

        // get
        public TArray<int> dropShow {
            get { return m_dropShow; }
        }

        public TArray<int> pointTianJi {
            get { return m_pointTianJi; }
        }
        public TArray<int> pointXuanZong {
            get { return m_pointXuanZong; }
        }

        public Dictionary<TMonsterElement, List<int>> monsterElement {
            get { return m_mstElement; }
        }

        public String GetPathGridFile() {
            return m_res1;
        }

        public String GetMapInfoFile() {
            return m_res2;
        }

        public TMapType GetMapType() {
            return ( TMapType )m_type;
        }

        public String GetLevelName() {
            var s = m_res1.Split( '/', '_', '\\' );
            if ( s.Length >= 2 ) {
                return s[ 1 ];
            } else {
                return String.Empty;
            }
        }

        public String GetMapDataPath() {
            var levelName = GetLevelName();
            var suffixName = GetMapInfoSuffix();
            if ( !string.IsNullOrEmpty( suffixName ) ) {
                levelName += "_" + suffixName;
            }
            return levelName;
        }

        public String GetPathGridSuffix() {
            var s = m_res1.Split( '/', '_', '\\' );
            if ( s.Length == 4 ) {
                return s[ 2 ];
            } else {
                return String.Empty;
            }
        }

        public String GetMapInfoSuffix() {
            var s = m_res2.Split( '/', '_', '\\' );
            if ( s.Length == 4 ) {
                return s[ 2 ];
            } else {
                return String.Empty;
            }
        }

        public List<int> GetAdditionalMonsterIds() {
            var ret = new List<int>();
            if ( m_lstCopySubCondition != null ) {
                if ( copytype == 0 ) {
                    for ( int i = 0, count = m_lstCopySubCondition.Length; i < count; ++i ) {
                        var field = Database.FbProcess.Get( m_lstCopySubCondition[ i ] );
                        if ( field != null && field.allMonsters != null ) {
                            var len = field.allMonsters.Count;
                            for ( int t = 0; t < len; ++t ) {
                                ret.Add( field.allMonsters[ t ] );
                            }
                        }
                    }
                } else if ( copytype == 1 ) {
                    for ( int i = 0, count = m_lstCopySubCondition.Length; i < count; ++i ) {
                        var field = Database.CopyProcess.Get( m_lstCopySubCondition[ i ] );
                        if ( field != null && field.killMonsterIds != null ) {
                            var killMonsterIds = field.killMonsterIds;
                            var len = killMonsterIds.Length;
                            for ( int t = 0; t < len; ++t ) {
                                ret.Add( killMonsterIds[ t ] );
                            }
                        }
                    }
                }
            }
            return ret;
        }

        public int ForEach_BitPlanes<C>( C ctx, Action<C, Mapsetting> func ) {
            if ( GetMapType() != TMapType.Map ) {
                return 0;
            }
            var ids = GetKeys();
            var _thisId = this.id;
            var n = 0;
            for ( int i = 0, count = ids.Count; i < count; ++i ) {
                if ( ids[ i ] == _thisId ) {
                    continue;
                }
                var mapSet = Get( ids[ i ] );
                if ( mapSet.Belongto == _thisId ) {
                    try {
                        func( ctx, mapSet );
                    } catch ( Exception e ) {
                        ULogFile.sharedInstance.LogException( e );
                    } finally {
                        ++n;
                    }
                }
            }
            return n;
        }

        public List<Mapsetting> GetBitPlanes() {
            if ( GetMapType() != TMapType.Map ) {
                return null;
            }
            var ids = GetKeys();
            List<Mapsetting> ret = null;
            for ( int i = 0; i < ids.Count; ++i ) {
                if ( ids[ i ] == id ) {
                    continue;
                }
                var mapSet = Get( ids[ i ] );
                if ( mapSet.Belongto == this.id ) {
                    if ( ret == null ) {
                        ret = new List<Mapsetting>();
                    }
                    ret.Add( mapSet );
                }
            }
            return ret;
        }

        public unsafe static Mapsetting Get( String name, TMapType type = TMapType.Map ) {
            Mapsetting ret = null;
            int mapId = 0;
            int* p = &mapId;
            m_idCache.DoIteration(
                STuple.Create( name, ( int )type, ( IntPtr )p ),
                ( ctx, k, v ) => {
                    if ( v.m_name == ctx.Item1 && v.type == ctx.Item2 ) {
                        int* _p = ( int* )ctx.Item3;
                        *_p = v.id;
                        // break iteration
                        return false;
                    }
                    return true;
                }
            );
            if ( mapId != 0 ) {
                ret = Get( mapId );
            }
            return ret;
        }

        public static Mapsetting FindFirstOfType( TMapType type, TPlaySubType subType ) {
            Mapsetting ret = null;
            m_idCache.DoIteration(
                STuple.Create( ( int )type, ( int )subType ),
                ( ctx, k, v ) => {
                    if ( v.type == ctx.Item1 && v.subtype == ctx.Item2 ) {
                        ret = v;
                        // break iteration
                        return false;
                    }
                    return true;
                }
            );
            return ret;
        }

        internal static void LoadComplexField_drop_show( Mapsetting data, LuaDatabase.Query q ) {
            data.m_dropShow = MapsettingEx.IsValid_drop_show ? Dataset.LoadIntArray( "drop_show", q ) : __default.m_dropShow;
        }

        internal static void LoadComplexField_PointTianJi( Mapsetting data, LuaDatabase.Query q ) {
            data.m_pointTianJi = MapsettingEx.IsValid_drop_show ? Dataset.LoadIntArray( "point_TJ", q ) : __default.m_dropShow;
        }

        internal static void LoadComplexField_pointXuanZong( Mapsetting data, LuaDatabase.Query q ) {
            data.m_pointXuanZong = MapsettingEx.IsValid_drop_show ? Dataset.LoadIntArray( "point_XZ", q ) : __default.m_dropShow;
        }

        internal static void LoadComplexField_limit_item( Mapsetting data, LuaDatabase.Query q ) {
            data.limit_item = MapsettingEx.IsValid_limit_item ? Dataset.LoadIntArray( "limit_item", q ) : __default.limit_item;
        }

        internal static void LoadComplexField_scheduleConf( Mapsetting data, LuaDatabase.Query q ) {
            data.m_lstCopySubCondition = MapsettingEx.IsValid_scheduleConf ? Dataset.LoadIntArray( "scheduleConf", q ) : __default.m_lstCopySubCondition;
        }

        public static bool IsShowTailsman( int mapId ) {
            var map = Mapsetting.Get( mapId );
            return map != null && ( map.shield & 1 ) == 0;
        }

        public static bool IsCanMount( int mapId ) {
            Mapsetting map = Mapsetting.Get( mapId );
            return map != null && ( map.shield & 2 ) == 0;
        }

        public static bool IsCanPet( Mapsetting map ) {
            return map != null && ( map.shield & 8 ) == 0;
        }

        public static bool CheckMapCanTransport( int mapId, bool needTips ) {
            var enterMap = Database.Mapsetting.Get( mapId );
            if ( enterMap == null || !enterMap.MapsIsOpen( needTips ) ) {
                return false;
            }

            var curMapId = WorldState.activeSceneId;
            if ( mapId == curMapId ) {
                return true;
            }

            if ( enterMap.type != ( int )TMapType.Map || ( enterMap.subtype != 0 && enterMap.subtype != ( int )TMapSubType.CampWar ) ) {
                var desc = GameLogic.ErrorDesc.GetErrorCodeDesc( GameLogic.ErrorCode.CompanionCantTransferToNotNormalMap );
                if ( desc != null ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( desc.text );
                }
                return false;
            }

            var curMap = Get( curMapId );
            if ( curMap.type != ( int )TMapType.Map || ( curMap.subtype != 0 && curMap.subtype != ( int )TMapSubType.CampWar ) ) {
                var desc = GameLogic.ErrorDesc.GetErrorCodeDesc( GameLogic.ErrorCode.CompanionCantTransferFromNotNormalMap );
                if ( desc != null ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( desc.text );
                }
                return false;
            }

            return true;
        }

        public bool MapsIsOpen( bool needTips ) {
            var props = GwScene.LPersistentData.props;
            if ( props == null ) {
                return false;
            }
            var level = props.GetBaseProp<int>( RolebaseAttribute.Level );
            if ( level < playerEnter_MinLevel ) {
                if ( needTips ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( Locale.TextManager.GetText_S( Locale.TextDef.EnterMapFailed_LevelBelow ) );
                }
                return false;
            }
            if ( level > playerEnter_MaxLevel ) {
                if ( needTips ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( Locale.TextManager.GetText_S( Locale.TextDef.EnterMapFailed_LevelBelow ) );
                }
                return false;
            }
            if ( ( player_state & 1 ) != 0 && props.GetBaseProp<Int32>( RolebaseAttribute.Camp ) == 0 ) {
                if ( needTips ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( Locale.TextManager.GetText_S( Locale.TextDef.Entermap_need_camp ) );
                }
                return false;
            }
            if ( ( player_state & 2 ) != 0 && props.GetBaseProp<UInt64>( RolebaseAttribute.GuildID ) == 0 ) {
                if ( needTips ) {
                    GameCenter.messageBoxManager.RollUpTipsPanel( Locale.TextManager.GetText_S( Locale.TextDef.Entermap_need_guild ) );
                }
                return false;
            }
            return true;
        }

        public bool NeedAutoAttack {
            get {
                return fight_auto == ( int )TMapFightAuto.AutoAttack;
            }
        }

        public bool cutsceneSkipable {
            get {
                /*
                 * 该地图是否允许跳过剧情
                 * 只针对真机
                 * 0允许
                 * 1不允许                 
                 */
#if UNITY_EDITOR
                return true;
#else
                return this.m_Plot == 0;
#endif
            }
        }
    }
}
//EOF
