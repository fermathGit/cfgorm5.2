//=============================================================================
// DO NOT MODIFY THIS FILE MANUALLY!!
// THIS FILE IS GENERATED BY LUA DATABASE TOOL.
// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.
//=============================================================================

using System;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
using LuaTableHandle = System.Int64;
using LuaStateHandle = System.IntPtr;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaTableHandle = System.Object;
using LuaStateHandle = UniLua.ILuaState;
#endif

namespace Database {
	public partial class Mapsetting {
		const string DBName = "mapsetting";
		#region members
		private int m_id = 0;
		private int m_addmob_wait = 0;
		private int m_battle_power_press = 0;
		private int m_battle_recover = 0;
		private int m_Belongto = 0;
		private int m_bloomtype = 0;
		private int m_boss_cam = 0;
		private int m_callType = 0;
		private int m_cam_dis = 0;
		private int m_cam_pitch = 0;
		private int m_cam_type = 0;
		private int m_cam_yaw = 0;
		private int m_copyrand = 0;
		private int m_copytype = 0;
		private string m_cutscene = String.Empty;
		private string m_cutscene2 = String.Empty;
		private int m_cutscene_name = 0;
		private int m_daily_entercount = 0;
		private int m_daily_getcount = 0;
		private float m_damage_modify = 0;
		private int m_dead_fail = 0;
		private int m_deadcopy = 0;
		private string m_desc = String.Empty;
		private int m_die_auto = 0;
		private int m_difficult = 0;
		private int m_drop_count = 0;
		private int m_editor_sndpack = 0;
		private float m_expshare = 0;
		private int m_fb_modeaxis = 0;
		private int m_fb_modeyaw = 0;
		private int m_fb_ui_boss = 0;
		private string m_fb_ui_desc = String.Empty;
		private string m_fb_ui_name = String.Empty;
		private float m_fb_umodelscal = 0;
		private int m_fight_auto = 0;
		private int m_friendship_value = 0;
		private int m_hide_menu = 0;
		private int m_hide_tips = 0;
		private int m_hideonworld = 0;
		private int m_hp_yaw = 0;
		private int m_if_campmap = 0;
		private int m_if_findpath = 0;
		private int m_if_single = 0;
		private int m_ifcarry = 0;
		private int m_ifcross = 0;
		private int m_ifhide = 0;
		private int m_ifoutmap = 0;
		private int m_Instance_group = 0;
		private int m_Instance_Show = 0;
		private int m_Intimacy = 0;
		private int m_isInspire = 0;
		private int m_limit_time = 0;
		private int m_maxnum = 0;
		private float m_minimap_scale = 0;
		private int m_minimapshow = 0;
		private int m_mult_num = 0;
		private string m_music = String.Empty;
		private string m_name = String.Empty;
		private int m_needAgree = 0;
		private int m_pkflag_punish = 0;
		private int m_pkflag_support = 0;
		private string m_pkflag_uishow = String.Empty;
		private int m_pkprotect_lv = 0;
		private int m_player_state = 0;
		private int m_playerEnter_MaxLevel = 0;
		private int m_playerEnter_MinLevel = 0;
		private int m_playshow2 = 0;
		private int m_playshow3 = 0;
		private int m_Plot = 0;
		private int m_Recommend_friends = 0;
		private int m_red_mobname = 0;
		private int m_refresh_monster = 0;
		private string m_res1 = String.Empty;
		private string m_res2 = String.Empty;
		private int m_shaketype = 0;
		private int m_shield = 0;
		private int m_show_mobname = 0;
		private string m_show_name = String.Empty;
		private int m_signal_tips = 0;
		private float m_skill_dark_min = 0;
		private int m_skilldark = 0;
		private int m_subtype = 0;
		private int m_sweep = 0;
		private int m_taskdescirbe = 0;
		private int m_timeout_faild = 0;
		private int m_tipsRate = 0;
		private int m_titleshow = 0;
		private int m_type = 0;
		private string m_useminimap = String.Empty;
		private int m_wait_forcount = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, Mapsetting> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, Mapsetting>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int addmob_wait { get { return m_addmob_wait; } }
		public int battle_power_press { get { return m_battle_power_press; } }
		public int battle_recover { get { return m_battle_recover; } }
		public int Belongto { get { return m_Belongto; } }
		public int bloomtype { get { return m_bloomtype; } }
		public int boss_cam { get { return m_boss_cam; } }
		public int callType { get { return m_callType; } }
		public int cam_dis { get { return m_cam_dis; } }
		public int cam_pitch { get { return m_cam_pitch; } }
		public int cam_type { get { return m_cam_type; } }
		public int cam_yaw { get { return m_cam_yaw; } }
		public int copyrand { get { return m_copyrand; } }
		public int copytype { get { return m_copytype; } }
		public string cutscene { get { return m_cutscene; } }
		public string cutscene2 { get { return m_cutscene2; } }
		public int cutscene_name { get { return m_cutscene_name; } }
		public int daily_entercount { get { return m_daily_entercount; } }
		public int daily_getcount { get { return m_daily_getcount; } }
		public float damage_modify { get { return m_damage_modify; } }
		public int dead_fail { get { return m_dead_fail; } }
		public int deadcopy { get { return m_deadcopy; } }
		public string desc { get { return m_desc; } }
		public int die_auto { get { return m_die_auto; } }
		public int difficult { get { return m_difficult; } }
		public int drop_count { get { return m_drop_count; } }
		public int editor_sndpack { get { return m_editor_sndpack; } }
		public float expshare { get { return m_expshare; } }
		public int fb_modeaxis { get { return m_fb_modeaxis; } }
		public int fb_modeyaw { get { return m_fb_modeyaw; } }
		public int fb_ui_boss { get { return m_fb_ui_boss; } }
		public string fb_ui_desc { get { return m_fb_ui_desc; } }
		public string fb_ui_name { get { return m_fb_ui_name; } }
		public float fb_umodelscal { get { return m_fb_umodelscal; } }
		public int fight_auto { get { return m_fight_auto; } }
		public int friendship_value { get { return m_friendship_value; } }
		public int hide_menu { get { return m_hide_menu; } }
		public int hide_tips { get { return m_hide_tips; } }
		public int hideonworld { get { return m_hideonworld; } }
		public int hp_yaw { get { return m_hp_yaw; } }
		public int if_campmap { get { return m_if_campmap; } }
		public int if_findpath { get { return m_if_findpath; } }
		public int if_single { get { return m_if_single; } }
		public int ifcarry { get { return m_ifcarry; } }
		public int ifcross { get { return m_ifcross; } }
		public int ifhide { get { return m_ifhide; } }
		public int ifoutmap { get { return m_ifoutmap; } }
		public int Instance_group { get { return m_Instance_group; } }
		public int Instance_Show { get { return m_Instance_Show; } }
		public int Intimacy { get { return m_Intimacy; } }
		public int isInspire { get { return m_isInspire; } }
		public int limit_time { get { return m_limit_time; } }
		public int maxnum { get { return m_maxnum; } }
		public float minimap_scale { get { return m_minimap_scale; } }
		public int minimapshow { get { return m_minimapshow; } }
		public int mult_num { get { return m_mult_num; } }
		public string music { get { return m_music; } }
		public string name { get { return m_name; } }
		public int needAgree { get { return m_needAgree; } }
		public int pkflag_punish { get { return m_pkflag_punish; } }
		public int pkflag_support { get { return m_pkflag_support; } }
		public string pkflag_uishow { get { return m_pkflag_uishow; } }
		public int pkprotect_lv { get { return m_pkprotect_lv; } }
		public int player_state { get { return m_player_state; } }
		public int playerEnter_MaxLevel { get { return m_playerEnter_MaxLevel; } }
		public int playerEnter_MinLevel { get { return m_playerEnter_MinLevel; } }
		public int playshow2 { get { return m_playshow2; } }
		public int playshow3 { get { return m_playshow3; } }
		public int Plot { get { return m_Plot; } }
		public int Recommend_friends { get { return m_Recommend_friends; } }
		public int red_mobname { get { return m_red_mobname; } }
		public int refresh_monster { get { return m_refresh_monster; } }
		public string res1 { get { return m_res1; } }
		public string res2 { get { return m_res2; } }
		public int shaketype { get { return m_shaketype; } }
		public int shield { get { return m_shield; } }
		public int show_mobname { get { return m_show_mobname; } }
		public string show_name { get { return m_show_name; } }
		public int signal_tips { get { return m_signal_tips; } }
		public float skill_dark_min { get { return m_skill_dark_min; } }
		public int skilldark { get { return m_skilldark; } }
		public int subtype { get { return m_subtype; } }
		public int sweep { get { return m_sweep; } }
		public int taskdescirbe { get { return m_taskdescirbe; } }
		public int timeout_faild { get { return m_timeout_faild; } }
		public int tipsRate { get { return m_tipsRate; } }
		public int titleshow { get { return m_titleshow; } }
		public int type { get { return m_type; } }
		public string useminimap { get { return m_useminimap; } }
		public int wait_forcount { get { return m_wait_forcount; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static Mapsetting __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static Mapsetting() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( Mapsetting ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, Mapsetting> idCacheData {
			get { return m_idCache; }
		}

		public static void Touch() {
		}

		public static bool EnsureLoaded() {
			return Load();
		}

		static void ReadDefault() {
			var db = LuaDatabase.sharedInstance;
			var L = db.GetLuaState();
			var top = db.GetLuaTop();
			try {
				db.PushDataset( DBName );
				if ( L.IsTable( -1 ) ) {
					L.GetMetaTable( -1 );
					if ( L.IsTable( -1 ) ) {
						__this = ( LuaTableHandle )L.ToObject( -1 );
						var table = new LuaTinker.Table( L, -1 );
						var subTable = table.GetSubTable( "__default" );
						__masked = table.Get<bool>( "__masked", false );
						__hash = table.Get<int>( "__hash", 0 );
						if ( subTable != LuaTinker.Table.Empty && __hash == VersionHash ) {
							using ( var q = db.CreateQuery( subTable.index ) ) {
								__default = ReadOne( q, default( int ) );
							}
						} else {
							if ( __hash != 0 ) {
								ULogFile.sharedInstance.LogError( "Database {0} version mismatch, reader = 0x{1:x8}, data = 0x{2:x8}, masked = {3} ", DBName, VersionHash, __hash, __masked );
							}
							__masked = false;
						}
					}
				}
			} finally {
				db.SetLuaTop( top );
			}
		}

		public static bool Load() {
			bool alreadyLoaded;
			var r = LuaDatabase.sharedInstance.Load( DBName, out alreadyLoaded );
			if ( r && !alreadyLoaded ) {
				ReadDefault();
			}
			return r;
		}

		public static bool IsLoaded() {
			return LuaDatabase.sharedInstance.IsLoaded( DBName );
		}

		public static bool Unload() {
			return LuaDatabase.sharedInstance.Unload( DBName );
		}

		public static bool Reload() {
			bool ret = LuaDatabase.sharedInstance.Reload( DBName );
			ReadDefault();
			ClearCache();
			return ret;
		}

		static void OnUnload( LuaStateHandle L, LuaTableHandle tablePtr, String name ) {
			if ( name == DBName && tablePtr == __this ) {
				__this = default( LuaTableHandle );
				__default = null;
				__hash = 0;
				__masked = false;
			}
		}

		public static int CacheAll() {
			ClearCache();
			var db = LuaDatabase.sharedInstance;
			var L = db.GetLuaState();
			var top = db.GetLuaTop();
			try {
				db.PushDataset( DBName );
				using ( var gbuff = Common.GlobalBuffer<int>.Get() ) {
					LuaDatabase.LuaTable_iForEach( L,
						( _L, id ) => {
							using ( var q = db.CreateQuery( -1, DBName ) ) {
								var value = ReadOne( q, id );
								if ( value != null ) {
									m_idCache.Add( id, value );
									gbuff.Add( id );
								}
							}
						}
					);
					gbuff.Sort();
					m_ids = new IKeys( gbuff.ToList() );
				};
			} finally {
				db.SetLuaTop( top );
			}
			return m_idCache.Count;
		}

		public static void ClearCache() {
			m_idCache.Clear();
			m_ids = null;
		}

		public static int Sweep( bool force = false ) {
			return 0;
		}

		public static IKeys GetKeys( Comparison<int> pred = null ) {
			if ( m_ids == null ) {
				m_ids = new IKeys( LuaDatabase.sharedInstance.GetDatasetIKeys( DBName, true, pred ) );
			}
			var ids = m_ids;
			if ( pred != null ) {
				int count = m_ids.Count;
				var _ids = new List<int>( count );
				for ( int i = 0; i < count; ++i ) {
					_ids.Add( m_ids[i] );
				}
				_ids.Sort( pred );
				ids = new IKeys( _ids );
			}
			return ids;
		}

		static Mapsetting ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new Mapsetting();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_addmob_wait = __mask[ 0 ] ? q.GetInt( DBCache.FID_addmob_wait, 11 ) : __default.m_addmob_wait;
				temp.m_battle_power_press = __mask[ 1 ] ? q.GetInt( DBCache.FID_battle_power_press, 18 ) : __default.m_battle_power_press;
				temp.m_battle_recover = __mask[ 2 ] ? q.GetInt( DBCache.FID_battle_recover, 14 ) : __default.m_battle_recover;
				temp.m_Belongto = __mask[ 3 ] ? q.GetInt( DBCache.FID_Belongto, 8 ) : __default.m_Belongto;
				temp.m_bloomtype = __mask[ 4 ] ? q.GetInt( DBCache.FID_bloomtype, 9 ) : __default.m_bloomtype;
				temp.m_boss_cam = __mask[ 5 ] ? q.GetInt( DBCache.FID_boss_cam, 8 ) : __default.m_boss_cam;
				temp.m_callType = __mask[ 6 ] ? q.GetInt( DBCache.FID_callType, 8 ) : __default.m_callType;
				temp.m_cam_dis = __mask[ 7 ] ? q.GetInt( DBCache.FID_cam_dis, 7 ) : __default.m_cam_dis;
				temp.m_cam_pitch = __mask[ 8 ] ? q.GetInt( DBCache.FID_cam_pitch, 9 ) : __default.m_cam_pitch;
				temp.m_cam_type = __mask[ 9 ] ? q.GetInt( DBCache.FID_cam_type, 8 ) : __default.m_cam_type;
				temp.m_cam_yaw = __mask[ 10 ] ? q.GetInt( DBCache.FID_cam_yaw, 7 ) : __default.m_cam_yaw;
				temp.m_copyrand = __mask[ 11 ] ? q.GetInt( DBCache.FID_copyrand, 8 ) : __default.m_copyrand;
				temp.m_copytype = __mask[ 12 ] ? q.GetInt( DBCache.FID_copytype, 8 ) : __default.m_copytype;
				temp.m_cutscene = __mask[ 13 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_cutscene, 8 ) : __default.m_cutscene;
				temp.m_cutscene2 = __mask[ 14 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_cutscene2, 9 ) : __default.m_cutscene2;
				temp.m_cutscene_name = __mask[ 15 ] ? q.GetInt( DBCache.FID_cutscene_name, 13 ) : __default.m_cutscene_name;
				temp.m_daily_entercount = __mask[ 16 ] ? q.GetInt( DBCache.FID_daily_entercount, 16 ) : __default.m_daily_entercount;
				temp.m_daily_getcount = __mask[ 17 ] ? q.GetInt( DBCache.FID_daily_getcount, 14 ) : __default.m_daily_getcount;
				temp.m_damage_modify = __mask[ 18 ] ? q.GetFloat( DBCache.FID_damage_modify, 13 ) : __default.m_damage_modify;
				temp.m_dead_fail = __mask[ 19 ] ? q.GetInt( DBCache.FID_dead_fail, 9 ) : __default.m_dead_fail;
				temp.m_deadcopy = __mask[ 20 ] ? q.GetInt( DBCache.FID_deadcopy, 8 ) : __default.m_deadcopy;
				temp.m_desc = __mask[ 21 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_desc, 4 ) : __default.m_desc;
				temp.m_die_auto = __mask[ 22 ] ? q.GetInt( DBCache.FID_die_auto, 8 ) : __default.m_die_auto;
				temp.m_difficult = __mask[ 23 ] ? q.GetInt( DBCache.FID_difficult, 9 ) : __default.m_difficult;
				temp.m_drop_count = __mask[ 24 ] ? q.GetInt( DBCache.FID_drop_count, 10 ) : __default.m_drop_count;
				temp.m_editor_sndpack = __mask[ 27 ] ? q.GetInt( DBCache.FID_editor_sndpack, 14 ) : __default.m_editor_sndpack;
				temp.m_expshare = __mask[ 28 ] ? q.GetFloat( DBCache.FID_expshare, 8 ) : __default.m_expshare;
				temp.m_fb_modeaxis = __mask[ 29 ] ? q.GetInt( DBCache.FID_fb_modeaxis, 11 ) : __default.m_fb_modeaxis;
				temp.m_fb_modeyaw = __mask[ 30 ] ? q.GetInt( DBCache.FID_fb_modeyaw, 10 ) : __default.m_fb_modeyaw;
				temp.m_fb_ui_boss = __mask[ 31 ] ? q.GetInt( DBCache.FID_fb_ui_boss, 10 ) : __default.m_fb_ui_boss;
				temp.m_fb_ui_desc = __mask[ 32 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_fb_ui_desc, 10 ) : __default.m_fb_ui_desc;
				temp.m_fb_ui_name = __mask[ 33 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_fb_ui_name, 10 ) : __default.m_fb_ui_name;
				temp.m_fb_umodelscal = __mask[ 34 ] ? q.GetFloat( DBCache.FID_fb_umodelscal, 13 ) : __default.m_fb_umodelscal;
				temp.m_fight_auto = __mask[ 35 ] ? q.GetInt( DBCache.FID_fight_auto, 10 ) : __default.m_fight_auto;
				temp.m_friendship_value = __mask[ 36 ] ? q.GetInt( DBCache.FID_friendship_value, 16 ) : __default.m_friendship_value;
				temp.m_hide_menu = __mask[ 37 ] ? q.GetInt( DBCache.FID_hide_menu, 9 ) : __default.m_hide_menu;
				temp.m_hide_tips = __mask[ 38 ] ? q.GetInt( DBCache.FID_hide_tips, 9 ) : __default.m_hide_tips;
				temp.m_hideonworld = __mask[ 39 ] ? q.GetInt( DBCache.FID_hideonworld, 11 ) : __default.m_hideonworld;
				temp.m_hp_yaw = __mask[ 40 ] ? q.GetInt( DBCache.FID_hp_yaw, 6 ) : __default.m_hp_yaw;
				temp.m_if_campmap = __mask[ 41 ] ? q.GetInt( DBCache.FID_if_campmap, 10 ) : __default.m_if_campmap;
				temp.m_if_findpath = __mask[ 42 ] ? q.GetInt( DBCache.FID_if_findpath, 11 ) : __default.m_if_findpath;
				temp.m_if_single = __mask[ 43 ] ? q.GetInt( DBCache.FID_if_single, 9 ) : __default.m_if_single;
				temp.m_ifcarry = __mask[ 44 ] ? q.GetInt( DBCache.FID_ifcarry, 7 ) : __default.m_ifcarry;
				temp.m_ifcross = __mask[ 45 ] ? q.GetInt( DBCache.FID_ifcross, 7 ) : __default.m_ifcross;
				temp.m_ifhide = __mask[ 46 ] ? q.GetInt( DBCache.FID_ifhide, 6 ) : __default.m_ifhide;
				temp.m_ifoutmap = __mask[ 47 ] ? q.GetInt( DBCache.FID_ifoutmap, 8 ) : __default.m_ifoutmap;
				temp.m_Instance_group = __mask[ 48 ] ? q.GetInt( DBCache.FID_Instance_group, 14 ) : __default.m_Instance_group;
				temp.m_Instance_Show = __mask[ 49 ] ? q.GetInt( DBCache.FID_Instance_Show, 13 ) : __default.m_Instance_Show;
				temp.m_Intimacy = __mask[ 50 ] ? q.GetInt( DBCache.FID_Intimacy, 8 ) : __default.m_Intimacy;
				temp.m_isInspire = __mask[ 51 ] ? q.GetInt( DBCache.FID_isInspire, 9 ) : __default.m_isInspire;
				temp.m_limit_time = __mask[ 53 ] ? q.GetInt( DBCache.FID_limit_time, 10 ) : __default.m_limit_time;
				temp.m_maxnum = __mask[ 54 ] ? q.GetInt( DBCache.FID_maxnum, 6 ) : __default.m_maxnum;
				temp.m_minimap_scale = __mask[ 55 ] ? q.GetFloat( DBCache.FID_minimap_scale, 13 ) : __default.m_minimap_scale;
				temp.m_minimapshow = __mask[ 56 ] ? q.GetInt( DBCache.FID_minimapshow, 11 ) : __default.m_minimapshow;
				temp.m_mult_num = __mask[ 57 ] ? q.GetInt( DBCache.FID_mult_num, 8 ) : __default.m_mult_num;
				temp.m_music = __mask[ 58 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_music, 5 ) : __default.m_music;
				temp.m_name = __mask[ 59 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_name, 4 ) : __default.m_name;
				temp.m_needAgree = __mask[ 60 ] ? q.GetInt( DBCache.FID_needAgree, 9 ) : __default.m_needAgree;
				temp.m_pkflag_punish = __mask[ 61 ] ? q.GetInt( DBCache.FID_pkflag_punish, 13 ) : __default.m_pkflag_punish;
				temp.m_pkflag_support = __mask[ 62 ] ? q.GetInt( DBCache.FID_pkflag_support, 14 ) : __default.m_pkflag_support;
				temp.m_pkflag_uishow = __mask[ 63 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_pkflag_uishow, 13 ) : __default.m_pkflag_uishow;
				temp.m_pkprotect_lv = __mask[ 64 ] ? q.GetInt( DBCache.FID_pkprotect_lv, 12 ) : __default.m_pkprotect_lv;
				temp.m_player_state = __mask[ 65 ] ? q.GetInt( DBCache.FID_player_state, 12 ) : __default.m_player_state;
				temp.m_playerEnter_MaxLevel = __mask[ 66 ] ? q.GetInt( DBCache.FID_playerEnter_MaxLevel, 20 ) : __default.m_playerEnter_MaxLevel;
				temp.m_playerEnter_MinLevel = __mask[ 67 ] ? q.GetInt( DBCache.FID_playerEnter_MinLevel, 20 ) : __default.m_playerEnter_MinLevel;
				temp.m_playshow2 = __mask[ 68 ] ? q.GetInt( DBCache.FID_playshow2, 9 ) : __default.m_playshow2;
				temp.m_playshow3 = __mask[ 69 ] ? q.GetInt( DBCache.FID_playshow3, 9 ) : __default.m_playshow3;
				temp.m_Plot = __mask[ 70 ] ? q.GetInt( DBCache.FID_Plot, 4 ) : __default.m_Plot;
				temp.m_Recommend_friends = __mask[ 73 ] ? q.GetInt( DBCache.FID_Recommend_friends, 17 ) : __default.m_Recommend_friends;
				temp.m_red_mobname = __mask[ 74 ] ? q.GetInt( DBCache.FID_red_mobname, 11 ) : __default.m_red_mobname;
				temp.m_refresh_monster = __mask[ 75 ] ? q.GetInt( DBCache.FID_refresh_monster, 15 ) : __default.m_refresh_monster;
				temp.m_res1 = __mask[ 76 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_res1, 4 ) : __default.m_res1;
				temp.m_res2 = __mask[ 77 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_res2, 4 ) : __default.m_res2;
				temp.m_shaketype = __mask[ 80 ] ? q.GetInt( DBCache.FID_shaketype, 9 ) : __default.m_shaketype;
				temp.m_shield = __mask[ 81 ] ? q.GetInt( DBCache.FID_shield, 6 ) : __default.m_shield;
				temp.m_show_mobname = __mask[ 82 ] ? q.GetInt( DBCache.FID_show_mobname, 12 ) : __default.m_show_mobname;
				temp.m_show_name = __mask[ 83 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_show_name, 9 ) : __default.m_show_name;
				temp.m_signal_tips = __mask[ 84 ] ? q.GetInt( DBCache.FID_signal_tips, 11 ) : __default.m_signal_tips;
				temp.m_skill_dark_min = __mask[ 85 ] ? q.GetFloat( DBCache.FID_skill_dark_min, 14 ) : __default.m_skill_dark_min;
				temp.m_skilldark = __mask[ 86 ] ? q.GetInt( DBCache.FID_skilldark, 9 ) : __default.m_skilldark;
				temp.m_subtype = __mask[ 87 ] ? q.GetInt( DBCache.FID_subtype, 7 ) : __default.m_subtype;
				temp.m_sweep = __mask[ 88 ] ? q.GetInt( DBCache.FID_sweep, 5 ) : __default.m_sweep;
				temp.m_taskdescirbe = __mask[ 89 ] ? q.GetInt( DBCache.FID_taskdescirbe, 12 ) : __default.m_taskdescirbe;
				temp.m_timeout_faild = __mask[ 90 ] ? q.GetInt( DBCache.FID_timeout_faild, 13 ) : __default.m_timeout_faild;
				temp.m_tipsRate = __mask[ 91 ] ? q.GetInt( DBCache.FID_tipsRate, 8 ) : __default.m_tipsRate;
				temp.m_titleshow = __mask[ 92 ] ? q.GetInt( DBCache.FID_titleshow, 9 ) : __default.m_titleshow;
				temp.m_type = __mask[ 93 ] ? q.GetInt( DBCache.FID_type, 4 ) : __default.m_type;
				temp.m_useminimap = __mask[ 94 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_useminimap, 10 ) : __default.m_useminimap;
				temp.m_wait_forcount = __mask[ 95 ] ? q.GetInt( DBCache.FID_wait_forcount, 13 ) : __default.m_wait_forcount;
				MapsettingEx.IsValid_drop_show = __mask[ 25 ];
				MapsettingEx.IsValid_dropid = __mask[ 26 ];
				MapsettingEx.IsValid_limit_item = __mask[ 52 ];
				MapsettingEx.IsValid_point_TJ = __mask[ 71 ];
				MapsettingEx.IsValid_point_XZ = __mask[ 72 ];
				MapsettingEx.IsValid_scheduleConf = __mask[ 78 ];
				MapsettingEx.IsValid_scriptId = __mask[ 79 ];
				if ( MapsettingEx.onLoadComplexField_drop_show != null ) {
					MapsettingEx.onLoadComplexField_drop_show( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_dropid != null ) {
					MapsettingEx.onLoadComplexField_dropid( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_limit_item != null ) {
					MapsettingEx.onLoadComplexField_limit_item( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_point_TJ != null ) {
					MapsettingEx.onLoadComplexField_point_TJ( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_point_XZ != null ) {
					MapsettingEx.onLoadComplexField_point_XZ( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_scheduleConf != null ) {
					MapsettingEx.onLoadComplexField_scheduleConf( temp, q );
				}
				if ( MapsettingEx.onLoadComplexField_scriptId != null ) {
					MapsettingEx.onLoadComplexField_scriptId( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static Mapsetting Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			Mapsetting ret = null;
			if ( m_idCache.TryGetValue( id, out ret ) ) {
				return ret;
			}
			var db = LuaDatabase.sharedInstance;
			int tableIndex = db.PushDatasetValue( DBName, id );
			var L = db.GetLuaState();
			if ( L.IsTable( tableIndex ) == false ) {
			    L.Remove( tableIndex );
			    Common.UDebug.LogError( "{0}[{1}] is nil", DBName, id );
			    return null;
			}
			using ( var q = db.CreateQuery( tableIndex, DBName ) ) {
				var temp = ReadOne( q, id );
				if ( temp != null ) {
					m_idCache.Add( id, temp );
					return temp;
				}
			}
			return null;
		}

		const int VersionHash = 0x5df81d49;
		#endregion
	}

	public partial class MapsettingEx {
		public delegate void LoadComplexField( Mapsetting data, LuaDatabase.Query q );
		internal static bool IsValid_drop_show = true;
		static LoadComplexField OnLoadComplexField_drop_show = null;
		public static LoadComplexField onLoadComplexField_drop_show {
			get {
				return OnLoadComplexField_drop_show;
			}
		}
		internal static bool IsValid_dropid = true;
		static LoadComplexField OnLoadComplexField_dropid = null;
		public static LoadComplexField onLoadComplexField_dropid {
			get {
				return OnLoadComplexField_dropid;
			}
		}
		internal static bool IsValid_limit_item = true;
		static LoadComplexField OnLoadComplexField_limit_item = null;
		public static LoadComplexField onLoadComplexField_limit_item {
			get {
				return OnLoadComplexField_limit_item;
			}
		}
		internal static bool IsValid_point_TJ = true;
		static LoadComplexField OnLoadComplexField_point_TJ = null;
		public static LoadComplexField onLoadComplexField_point_TJ {
			get {
				return OnLoadComplexField_point_TJ;
			}
		}
		internal static bool IsValid_point_XZ = true;
		static LoadComplexField OnLoadComplexField_point_XZ = null;
		public static LoadComplexField onLoadComplexField_point_XZ {
			get {
				return OnLoadComplexField_point_XZ;
			}
		}
		internal static bool IsValid_scheduleConf = true;
		static LoadComplexField OnLoadComplexField_scheduleConf = null;
		public static LoadComplexField onLoadComplexField_scheduleConf {
			get {
				return OnLoadComplexField_scheduleConf;
			}
		}
		internal static bool IsValid_scriptId = true;
		static LoadComplexField OnLoadComplexField_scriptId = null;
		public static LoadComplexField onLoadComplexField_scriptId {
			get {
				return OnLoadComplexField_scriptId;
			}
		}
	}
}
//EOF