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
	public partial class PlayerDesc {
		const string DBName = "player_desc";
		#region members
		private int m_id = 0;
		private int m_anger_attack = 0;
		private int m_anger_hurt = 0;
		private int m_camp_winglv = 0;
		private int m_default_res_wing = 0;
		private string m_found_vfx = String.Empty;
		private int m_fov = 0;
		private int m_fov_login = 0;
		private int m_head_female = 0;
		private int m_head_male = 0;
		private string m_jobdesc = String.Empty;
		private string m_jobdesc1 = String.Empty;
		private string m_jobname = String.Empty;
		private int m_maxanger = 0;
		private int m_Open = 0;
		private int m_show_equipsfxlv = 0;
		private int m_show_winglv = 0;
		private int m_sort_id = 0;
		private int m_time_lim_attack = 0;
		private int m_time_lim_hurt = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, PlayerDesc> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, PlayerDesc>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int anger_attack { get { return m_anger_attack; } }
		public int anger_hurt { get { return m_anger_hurt; } }
		public int camp_winglv { get { return m_camp_winglv; } }
		public int default_res_wing { get { return m_default_res_wing; } }
		public string found_vfx { get { return m_found_vfx; } }
		public int fov { get { return m_fov; } }
		public int fov_login { get { return m_fov_login; } }
		public int head_female { get { return m_head_female; } }
		public int head_male { get { return m_head_male; } }
		public string jobdesc { get { return m_jobdesc; } }
		public string jobdesc1 { get { return m_jobdesc1; } }
		public string jobname { get { return m_jobname; } }
		public int maxanger { get { return m_maxanger; } }
		public int Open { get { return m_Open; } }
		public int show_equipsfxlv { get { return m_show_equipsfxlv; } }
		public int show_winglv { get { return m_show_winglv; } }
		public int sort_id { get { return m_sort_id; } }
		public int time_lim_attack { get { return m_time_lim_attack; } }
		public int time_lim_hurt { get { return m_time_lim_hurt; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static PlayerDesc __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static PlayerDesc() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( PlayerDesc ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, PlayerDesc> idCacheData {
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

		static PlayerDesc ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new PlayerDesc();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_anger_attack = __mask[ 0 ] ? q.GetInt( DBCache.FID_anger_attack, 12 ) : __default.m_anger_attack;
				temp.m_anger_hurt = __mask[ 1 ] ? q.GetInt( DBCache.FID_anger_hurt, 10 ) : __default.m_anger_hurt;
				temp.m_camp_winglv = __mask[ 8 ] ? q.GetInt( DBCache.FID_camp_winglv, 11 ) : __default.m_camp_winglv;
				temp.m_default_res_wing = __mask[ 9 ] ? q.GetInt( DBCache.FID_default_res_wing, 16 ) : __default.m_default_res_wing;
				temp.m_found_vfx = __mask[ 13 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_found_vfx, 9 ) : __default.m_found_vfx;
				temp.m_fov = __mask[ 14 ] ? q.GetInt( DBCache.FID_fov, 3 ) : __default.m_fov;
				temp.m_fov_login = __mask[ 15 ] ? q.GetInt( DBCache.FID_fov_login, 9 ) : __default.m_fov_login;
				temp.m_head_female = __mask[ 16 ] ? q.GetInt( DBCache.FID_head_female, 11 ) : __default.m_head_female;
				temp.m_head_male = __mask[ 17 ] ? q.GetInt( DBCache.FID_head_male, 9 ) : __default.m_head_male;
				temp.m_jobdesc = __mask[ 19 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_jobdesc, 7 ) : __default.m_jobdesc;
				temp.m_jobdesc1 = __mask[ 20 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_jobdesc1, 8 ) : __default.m_jobdesc1;
				temp.m_jobname = __mask[ 21 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_jobname, 7 ) : __default.m_jobname;
				temp.m_maxanger = __mask[ 22 ] ? q.GetInt( DBCache.FID_maxanger, 8 ) : __default.m_maxanger;
				temp.m_Open = __mask[ 25 ] ? q.GetInt( DBCache.FID_Open, 4 ) : __default.m_Open;
				temp.m_show_equipsfxlv = __mask[ 30 ] ? q.GetInt( DBCache.FID_show_equipsfxlv, 15 ) : __default.m_show_equipsfxlv;
				temp.m_show_winglv = __mask[ 31 ] ? q.GetInt( DBCache.FID_show_winglv, 11 ) : __default.m_show_winglv;
				temp.m_sort_id = __mask[ 33 ] ? q.GetInt( DBCache.FID_sort_id, 7 ) : __default.m_sort_id;
				temp.m_time_lim_attack = __mask[ 34 ] ? q.GetInt( DBCache.FID_time_lim_attack, 15 ) : __default.m_time_lim_attack;
				temp.m_time_lim_hurt = __mask[ 35 ] ? q.GetInt( DBCache.FID_time_lim_hurt, 13 ) : __default.m_time_lim_hurt;
				PlayerDescEx.IsValid_BaseSkill = __mask[ 2 ];
				PlayerDescEx.IsValid_bloom_player = __mask[ 3 ];
				PlayerDescEx.IsValid_cameraAngles = __mask[ 4 ];
				PlayerDescEx.IsValid_cameraAngles_login = __mask[ 5 ];
				PlayerDescEx.IsValid_cameraPos = __mask[ 6 ];
				PlayerDescEx.IsValid_cameraPos_login = __mask[ 7 ];
				PlayerDescEx.IsValid_Equip = __mask[ 10 ];
				PlayerDescEx.IsValid_Equip_show = __mask[ 11 ];
				PlayerDescEx.IsValid_Equip_showingame = __mask[ 12 ];
				PlayerDescEx.IsValid_includesimbo = __mask[ 18 ];
				PlayerDescEx.IsValid_name_color = __mask[ 23 ];
				PlayerDescEx.IsValid_normalSkill = __mask[ 24 ];
				PlayerDescEx.IsValid_roleAngles_female = __mask[ 26 ];
				PlayerDescEx.IsValid_roleAngles_male = __mask[ 27 ];
				PlayerDescEx.IsValid_rolePos = __mask[ 28 ];
				PlayerDescEx.IsValid_rolePos_login = __mask[ 29 ];
				PlayerDescEx.IsValid_skillcolor = __mask[ 32 ];
				if ( PlayerDescEx.onLoadComplexField_BaseSkill != null ) {
					PlayerDescEx.onLoadComplexField_BaseSkill( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_bloom_player != null ) {
					PlayerDescEx.onLoadComplexField_bloom_player( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_cameraAngles != null ) {
					PlayerDescEx.onLoadComplexField_cameraAngles( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_cameraAngles_login != null ) {
					PlayerDescEx.onLoadComplexField_cameraAngles_login( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_cameraPos != null ) {
					PlayerDescEx.onLoadComplexField_cameraPos( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_cameraPos_login != null ) {
					PlayerDescEx.onLoadComplexField_cameraPos_login( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_Equip != null ) {
					PlayerDescEx.onLoadComplexField_Equip( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_Equip_show != null ) {
					PlayerDescEx.onLoadComplexField_Equip_show( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_Equip_showingame != null ) {
					PlayerDescEx.onLoadComplexField_Equip_showingame( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_includesimbo != null ) {
					PlayerDescEx.onLoadComplexField_includesimbo( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_name_color != null ) {
					PlayerDescEx.onLoadComplexField_name_color( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_normalSkill != null ) {
					PlayerDescEx.onLoadComplexField_normalSkill( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_roleAngles_female != null ) {
					PlayerDescEx.onLoadComplexField_roleAngles_female( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_roleAngles_male != null ) {
					PlayerDescEx.onLoadComplexField_roleAngles_male( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_rolePos != null ) {
					PlayerDescEx.onLoadComplexField_rolePos( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_rolePos_login != null ) {
					PlayerDescEx.onLoadComplexField_rolePos_login( temp, q );
				}
				if ( PlayerDescEx.onLoadComplexField_skillcolor != null ) {
					PlayerDescEx.onLoadComplexField_skillcolor( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static PlayerDesc Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			PlayerDesc ret = null;
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

		const int VersionHash = 0x36eab7dd;
		#endregion
	}

	public partial class PlayerDescEx {
		public delegate void LoadComplexField( PlayerDesc data, LuaDatabase.Query q );
		internal static bool IsValid_BaseSkill = true;
		static LoadComplexField OnLoadComplexField_BaseSkill = null;
		public static LoadComplexField onLoadComplexField_BaseSkill {
			get {
				return OnLoadComplexField_BaseSkill;
			}
		}
		internal static bool IsValid_bloom_player = true;
		static LoadComplexField OnLoadComplexField_bloom_player = null;
		public static LoadComplexField onLoadComplexField_bloom_player {
			get {
				return OnLoadComplexField_bloom_player;
			}
		}
		internal static bool IsValid_cameraAngles = true;
		static LoadComplexField OnLoadComplexField_cameraAngles = null;
		public static LoadComplexField onLoadComplexField_cameraAngles {
			get {
				return OnLoadComplexField_cameraAngles;
			}
		}
		internal static bool IsValid_cameraAngles_login = true;
		static LoadComplexField OnLoadComplexField_cameraAngles_login = null;
		public static LoadComplexField onLoadComplexField_cameraAngles_login {
			get {
				return OnLoadComplexField_cameraAngles_login;
			}
		}
		internal static bool IsValid_cameraPos = true;
		static LoadComplexField OnLoadComplexField_cameraPos = null;
		public static LoadComplexField onLoadComplexField_cameraPos {
			get {
				return OnLoadComplexField_cameraPos;
			}
		}
		internal static bool IsValid_cameraPos_login = true;
		static LoadComplexField OnLoadComplexField_cameraPos_login = null;
		public static LoadComplexField onLoadComplexField_cameraPos_login {
			get {
				return OnLoadComplexField_cameraPos_login;
			}
		}
		internal static bool IsValid_Equip = true;
		static LoadComplexField OnLoadComplexField_Equip = null;
		public static LoadComplexField onLoadComplexField_Equip {
			get {
				return OnLoadComplexField_Equip;
			}
		}
		internal static bool IsValid_Equip_show = true;
		static LoadComplexField OnLoadComplexField_Equip_show = null;
		public static LoadComplexField onLoadComplexField_Equip_show {
			get {
				return OnLoadComplexField_Equip_show;
			}
		}
		internal static bool IsValid_Equip_showingame = true;
		static LoadComplexField OnLoadComplexField_Equip_showingame = null;
		public static LoadComplexField onLoadComplexField_Equip_showingame {
			get {
				return OnLoadComplexField_Equip_showingame;
			}
		}
		internal static bool IsValid_includesimbo = true;
		static LoadComplexField OnLoadComplexField_includesimbo = null;
		public static LoadComplexField onLoadComplexField_includesimbo {
			get {
				return OnLoadComplexField_includesimbo;
			}
		}
		internal static bool IsValid_name_color = true;
		static LoadComplexField OnLoadComplexField_name_color = null;
		public static LoadComplexField onLoadComplexField_name_color {
			get {
				return OnLoadComplexField_name_color;
			}
		}
		internal static bool IsValid_normalSkill = true;
		static LoadComplexField OnLoadComplexField_normalSkill = null;
		public static LoadComplexField onLoadComplexField_normalSkill {
			get {
				return OnLoadComplexField_normalSkill;
			}
		}
		internal static bool IsValid_roleAngles_female = true;
		static LoadComplexField OnLoadComplexField_roleAngles_female = null;
		public static LoadComplexField onLoadComplexField_roleAngles_female {
			get {
				return OnLoadComplexField_roleAngles_female;
			}
		}
		internal static bool IsValid_roleAngles_male = true;
		static LoadComplexField OnLoadComplexField_roleAngles_male = null;
		public static LoadComplexField onLoadComplexField_roleAngles_male {
			get {
				return OnLoadComplexField_roleAngles_male;
			}
		}
		internal static bool IsValid_rolePos = true;
		static LoadComplexField OnLoadComplexField_rolePos = null;
		public static LoadComplexField onLoadComplexField_rolePos {
			get {
				return OnLoadComplexField_rolePos;
			}
		}
		internal static bool IsValid_rolePos_login = true;
		static LoadComplexField OnLoadComplexField_rolePos_login = null;
		public static LoadComplexField onLoadComplexField_rolePos_login {
			get {
				return OnLoadComplexField_rolePos_login;
			}
		}
		internal static bool IsValid_skillcolor = true;
		static LoadComplexField OnLoadComplexField_skillcolor = null;
		public static LoadComplexField onLoadComplexField_skillcolor {
			get {
				return OnLoadComplexField_skillcolor;
			}
		}
	}
}
//EOF
