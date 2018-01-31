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
	public partial class Mount {
		const string DBName = "mount";
		#region members
		private int m_id = 0;
		private float m_add_speed = 0;
		private int m_atk_mag = 0;
		private int m_atk_mag_add = 0;
		private int m_atk_phy = 0;
		private int m_atk_phy_add = 0;
		private int m_auto_ride = 0;
		private int m_bigstar_num = 0;
		private int m_bigstar_ui = 0;
		private float m_camera_up = 0;
		private int m_critical = 0;
		private int m_critical_add = 0;
		private int m_critical_down = 0;
		private int m_critical_down_add = 0;
		private int m_def_mag = 0;
		private int m_def_mag_add = 0;
		private int m_def_phy = 0;
		private int m_def_phy_add = 0;
		private int m_dodge = 0;
		private int m_dodge_add = 0;
		private int m_guard = 0;
		private int m_guard_add = 0;
		private int m_guardbreak = 0;
		private int m_guardbreak_add = 0;
		private int m_headicon = 0;
		private int m_hide = 0;
		private int m_hitrate = 0;
		private int m_hitrate_add = 0;
		private int m_hpmax = 0;
		private int m_hpmax_add = 0;
		private float m_model_hight = 0;
		private int m_model_uihight = 0;
		private int m_model_uioffset = 0;
		private int m_model_uispin = 0;
		private float m_modelscale = 0;
		private float m_modelscale_ui = 0;
		private string m_mount_idle = String.Empty;
		private string m_mount_run = String.Empty;
		private string m_mountdesc = String.Empty;
		private int m_mountmodel = 0;
		private string m_mountname = String.Empty;
		private int m_mountquality = 0;
		private int m_mounttime = 0;
		private int m_move_speed = 0;
		private float m_playspeed = 0;
		private int m_schedule_goldnum = 0;
		private int m_schedule_goldtype = 0;
		private int m_schedule_num = 0;
		private int m_sort = 0;
		private int m_stage_num = 0;
		private string m_talk1 = String.Empty;
		private string m_talk2 = String.Empty;
		private int m_wing_hide = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, Mount> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, Mount>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public float add_speed { get { return m_add_speed; } }
		public int atk_mag { get { return m_atk_mag; } }
		public int atk_mag_add { get { return m_atk_mag_add; } }
		public int atk_phy { get { return m_atk_phy; } }
		public int atk_phy_add { get { return m_atk_phy_add; } }
		public int auto_ride { get { return m_auto_ride; } }
		public int bigstar_num { get { return m_bigstar_num; } }
		public int bigstar_ui { get { return m_bigstar_ui; } }
		public float camera_up { get { return m_camera_up; } }
		public int critical { get { return m_critical; } }
		public int critical_add { get { return m_critical_add; } }
		public int critical_down { get { return m_critical_down; } }
		public int critical_down_add { get { return m_critical_down_add; } }
		public int def_mag { get { return m_def_mag; } }
		public int def_mag_add { get { return m_def_mag_add; } }
		public int def_phy { get { return m_def_phy; } }
		public int def_phy_add { get { return m_def_phy_add; } }
		public int dodge { get { return m_dodge; } }
		public int dodge_add { get { return m_dodge_add; } }
		public int guard { get { return m_guard; } }
		public int guard_add { get { return m_guard_add; } }
		public int guardbreak { get { return m_guardbreak; } }
		public int guardbreak_add { get { return m_guardbreak_add; } }
		public int headicon { get { return m_headicon; } }
		public int hide { get { return m_hide; } }
		public int hitrate { get { return m_hitrate; } }
		public int hitrate_add { get { return m_hitrate_add; } }
		public int hpmax { get { return m_hpmax; } }
		public int hpmax_add { get { return m_hpmax_add; } }
		public float model_hight { get { return m_model_hight; } }
		public int model_uihight { get { return m_model_uihight; } }
		public int model_uioffset { get { return m_model_uioffset; } }
		public int model_uispin { get { return m_model_uispin; } }
		public float modelscale { get { return m_modelscale; } }
		public float modelscale_ui { get { return m_modelscale_ui; } }
		public string mount_idle { get { return m_mount_idle; } }
		public string mount_run { get { return m_mount_run; } }
		public string mountdesc { get { return m_mountdesc; } }
		public int mountmodel { get { return m_mountmodel; } }
		public string mountname { get { return m_mountname; } }
		public int mountquality { get { return m_mountquality; } }
		public int mounttime { get { return m_mounttime; } }
		public int move_speed { get { return m_move_speed; } }
		public float playspeed { get { return m_playspeed; } }
		public int schedule_goldnum { get { return m_schedule_goldnum; } }
		public int schedule_goldtype { get { return m_schedule_goldtype; } }
		public int schedule_num { get { return m_schedule_num; } }
		public int sort { get { return m_sort; } }
		public int stage_num { get { return m_stage_num; } }
		public string talk1 { get { return m_talk1; } }
		public string talk2 { get { return m_talk2; } }
		public int wing_hide { get { return m_wing_hide; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static Mount __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static Mount() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( Mount ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, Mount> idCacheData {
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

		static Mount ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new Mount();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_add_speed = __mask[ 1 ] ? q.GetFloat( DBCache.FID_add_speed, 9 ) : __default.m_add_speed;
				temp.m_atk_mag = __mask[ 2 ] ? q.GetInt( DBCache.FID_atk_mag, 7 ) : __default.m_atk_mag;
				temp.m_atk_mag_add = __mask[ 3 ] ? q.GetInt( DBCache.FID_atk_mag_add, 11 ) : __default.m_atk_mag_add;
				temp.m_atk_phy = __mask[ 4 ] ? q.GetInt( DBCache.FID_atk_phy, 7 ) : __default.m_atk_phy;
				temp.m_atk_phy_add = __mask[ 5 ] ? q.GetInt( DBCache.FID_atk_phy_add, 11 ) : __default.m_atk_phy_add;
				temp.m_auto_ride = __mask[ 6 ] ? q.GetInt( DBCache.FID_auto_ride, 9 ) : __default.m_auto_ride;
				temp.m_bigstar_num = __mask[ 7 ] ? q.GetInt( DBCache.FID_bigstar_num, 11 ) : __default.m_bigstar_num;
				temp.m_bigstar_ui = __mask[ 8 ] ? q.GetInt( DBCache.FID_bigstar_ui, 10 ) : __default.m_bigstar_ui;
				temp.m_camera_up = __mask[ 9 ] ? q.GetFloat( DBCache.FID_camera_up, 9 ) : __default.m_camera_up;
				temp.m_critical = __mask[ 10 ] ? q.GetInt( DBCache.FID_critical, 8 ) : __default.m_critical;
				temp.m_critical_add = __mask[ 11 ] ? q.GetInt( DBCache.FID_critical_add, 12 ) : __default.m_critical_add;
				temp.m_critical_down = __mask[ 12 ] ? q.GetInt( DBCache.FID_critical_down, 13 ) : __default.m_critical_down;
				temp.m_critical_down_add = __mask[ 13 ] ? q.GetInt( DBCache.FID_critical_down_add, 17 ) : __default.m_critical_down_add;
				temp.m_def_mag = __mask[ 14 ] ? q.GetInt( DBCache.FID_def_mag, 7 ) : __default.m_def_mag;
				temp.m_def_mag_add = __mask[ 15 ] ? q.GetInt( DBCache.FID_def_mag_add, 11 ) : __default.m_def_mag_add;
				temp.m_def_phy = __mask[ 16 ] ? q.GetInt( DBCache.FID_def_phy, 7 ) : __default.m_def_phy;
				temp.m_def_phy_add = __mask[ 17 ] ? q.GetInt( DBCache.FID_def_phy_add, 11 ) : __default.m_def_phy_add;
				temp.m_dodge = __mask[ 18 ] ? q.GetInt( DBCache.FID_dodge, 5 ) : __default.m_dodge;
				temp.m_dodge_add = __mask[ 19 ] ? q.GetInt( DBCache.FID_dodge_add, 9 ) : __default.m_dodge_add;
				temp.m_guard = __mask[ 20 ] ? q.GetInt( DBCache.FID_guard, 5 ) : __default.m_guard;
				temp.m_guard_add = __mask[ 21 ] ? q.GetInt( DBCache.FID_guard_add, 9 ) : __default.m_guard_add;
				temp.m_guardbreak = __mask[ 22 ] ? q.GetInt( DBCache.FID_guardbreak, 10 ) : __default.m_guardbreak;
				temp.m_guardbreak_add = __mask[ 23 ] ? q.GetInt( DBCache.FID_guardbreak_add, 14 ) : __default.m_guardbreak_add;
				temp.m_headicon = __mask[ 24 ] ? q.GetInt( DBCache.FID_headicon, 8 ) : __default.m_headicon;
				temp.m_hide = __mask[ 25 ] ? q.GetInt( DBCache.FID_hide, 4 ) : __default.m_hide;
				temp.m_hitrate = __mask[ 26 ] ? q.GetInt( DBCache.FID_hitrate, 7 ) : __default.m_hitrate;
				temp.m_hitrate_add = __mask[ 27 ] ? q.GetInt( DBCache.FID_hitrate_add, 11 ) : __default.m_hitrate_add;
				temp.m_hpmax = __mask[ 28 ] ? q.GetInt( DBCache.FID_hpmax, 5 ) : __default.m_hpmax;
				temp.m_hpmax_add = __mask[ 29 ] ? q.GetInt( DBCache.FID_hpmax_add, 9 ) : __default.m_hpmax_add;
				temp.m_model_hight = __mask[ 30 ] ? q.GetFloat( DBCache.FID_model_hight, 11 ) : __default.m_model_hight;
				temp.m_model_uihight = __mask[ 31 ] ? q.GetInt( DBCache.FID_model_uihight, 13 ) : __default.m_model_uihight;
				temp.m_model_uioffset = __mask[ 32 ] ? q.GetInt( DBCache.FID_model_uioffset, 14 ) : __default.m_model_uioffset;
				temp.m_model_uispin = __mask[ 33 ] ? q.GetInt( DBCache.FID_model_uispin, 12 ) : __default.m_model_uispin;
				temp.m_modelscale = __mask[ 34 ] ? q.GetFloat( DBCache.FID_modelscale, 10 ) : __default.m_modelscale;
				temp.m_modelscale_ui = __mask[ 35 ] ? q.GetFloat( DBCache.FID_modelscale_ui, 13 ) : __default.m_modelscale_ui;
				temp.m_mount_idle = __mask[ 36 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_mount_idle, 10 ) : __default.m_mount_idle;
				temp.m_mount_run = __mask[ 37 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_mount_run, 9 ) : __default.m_mount_run;
				temp.m_mountdesc = __mask[ 38 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_mountdesc, 9 ) : __default.m_mountdesc;
				temp.m_mountmodel = __mask[ 39 ] ? q.GetInt( DBCache.FID_mountmodel, 10 ) : __default.m_mountmodel;
				temp.m_mountname = __mask[ 40 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_mountname, 9 ) : __default.m_mountname;
				temp.m_mountquality = __mask[ 41 ] ? q.GetInt( DBCache.FID_mountquality, 12 ) : __default.m_mountquality;
				temp.m_mounttime = __mask[ 42 ] ? q.GetInt( DBCache.FID_mounttime, 9 ) : __default.m_mounttime;
				temp.m_move_speed = __mask[ 44 ] ? q.GetInt( DBCache.FID_move_speed, 10 ) : __default.m_move_speed;
				temp.m_playspeed = __mask[ 45 ] ? q.GetFloat( DBCache.FID_playspeed, 9 ) : __default.m_playspeed;
				temp.m_schedule_goldnum = __mask[ 46 ] ? q.GetInt( DBCache.FID_schedule_goldnum, 16 ) : __default.m_schedule_goldnum;
				temp.m_schedule_goldtype = __mask[ 47 ] ? q.GetInt( DBCache.FID_schedule_goldtype, 17 ) : __default.m_schedule_goldtype;
				temp.m_schedule_num = __mask[ 48 ] ? q.GetInt( DBCache.FID_schedule_num, 12 ) : __default.m_schedule_num;
				temp.m_sort = __mask[ 49 ] ? q.GetInt( DBCache.FID_sort, 4 ) : __default.m_sort;
				temp.m_stage_num = __mask[ 53 ] ? q.GetInt( DBCache.FID_stage_num, 9 ) : __default.m_stage_num;
				temp.m_talk1 = __mask[ 55 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_talk1, 5 ) : __default.m_talk1;
				temp.m_talk2 = __mask[ 56 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_talk2, 5 ) : __default.m_talk2;
				temp.m_wing_hide = __mask[ 57 ] ? q.GetInt( DBCache.FID_wing_hide, 9 ) : __default.m_wing_hide;
				MountEx.IsValid_achive_mounts = __mask[ 0 ];
				MountEx.IsValid_mountvfx = __mask[ 43 ];
				MountEx.IsValid_stage_itemid = __mask[ 50 ];
				MountEx.IsValid_stage_itemnum = __mask[ 51 ];
				MountEx.IsValid_stage_level = __mask[ 52 ];
				MountEx.IsValid_stage_uprate = __mask[ 54 ];
				if ( MountEx.onLoadComplexField_achive_mounts != null ) {
					MountEx.onLoadComplexField_achive_mounts( temp, q );
				}
				if ( MountEx.onLoadComplexField_mountvfx != null ) {
					MountEx.onLoadComplexField_mountvfx( temp, q );
				}
				if ( MountEx.onLoadComplexField_stage_itemid != null ) {
					MountEx.onLoadComplexField_stage_itemid( temp, q );
				}
				if ( MountEx.onLoadComplexField_stage_itemnum != null ) {
					MountEx.onLoadComplexField_stage_itemnum( temp, q );
				}
				if ( MountEx.onLoadComplexField_stage_level != null ) {
					MountEx.onLoadComplexField_stage_level( temp, q );
				}
				if ( MountEx.onLoadComplexField_stage_uprate != null ) {
					MountEx.onLoadComplexField_stage_uprate( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static Mount Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			Mount ret = null;
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

		const int VersionHash = 0x6696f22f;
		#endregion
	}

	public partial class MountEx {
		public delegate void LoadComplexField( Mount data, LuaDatabase.Query q );
		internal static bool IsValid_achive_mounts = true;
		static LoadComplexField OnLoadComplexField_achive_mounts = null;
		public static LoadComplexField onLoadComplexField_achive_mounts {
			get {
				return OnLoadComplexField_achive_mounts;
			}
		}
		internal static bool IsValid_mountvfx = true;
		static LoadComplexField OnLoadComplexField_mountvfx = null;
		public static LoadComplexField onLoadComplexField_mountvfx {
			get {
				return OnLoadComplexField_mountvfx;
			}
		}
		internal static bool IsValid_stage_itemid = true;
		static LoadComplexField OnLoadComplexField_stage_itemid = null;
		public static LoadComplexField onLoadComplexField_stage_itemid {
			get {
				return OnLoadComplexField_stage_itemid;
			}
		}
		internal static bool IsValid_stage_itemnum = true;
		static LoadComplexField OnLoadComplexField_stage_itemnum = null;
		public static LoadComplexField onLoadComplexField_stage_itemnum {
			get {
				return OnLoadComplexField_stage_itemnum;
			}
		}
		internal static bool IsValid_stage_level = true;
		static LoadComplexField OnLoadComplexField_stage_level = null;
		public static LoadComplexField onLoadComplexField_stage_level {
			get {
				return OnLoadComplexField_stage_level;
			}
		}
		internal static bool IsValid_stage_uprate = true;
		static LoadComplexField OnLoadComplexField_stage_uprate = null;
		public static LoadComplexField onLoadComplexField_stage_uprate {
			get {
				return OnLoadComplexField_stage_uprate;
			}
		}
	}
}
//EOF