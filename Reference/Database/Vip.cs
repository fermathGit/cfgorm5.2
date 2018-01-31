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
	public partial class Vip {
		const string DBName = "vip";
		#region members
		private int m_id = 0;
		private int m_attack = 0;
		private int m_buyMoneyNum = 0;
		private int m_buyMoneyType = 0;
		private int m_exp = 0;
		private int m_exp_rate = 0;
		private int m_level = 0;
		private int m_master = 0;
		private string m_model_name = String.Empty;
		private int m_ShowbuyMoneyNum = 0;
		private int m_ShowbuyMoneyType = 0;
		private int m_title = 0;
		private int m_type = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, Vip> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, Vip>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int attack { get { return m_attack; } }
		public int buyMoneyNum { get { return m_buyMoneyNum; } }
		public int buyMoneyType { get { return m_buyMoneyType; } }
		public int exp { get { return m_exp; } }
		public int exp_rate { get { return m_exp_rate; } }
		public int level { get { return m_level; } }
		public int master { get { return m_master; } }
		public string model_name { get { return m_model_name; } }
		public int ShowbuyMoneyNum { get { return m_ShowbuyMoneyNum; } }
		public int ShowbuyMoneyType { get { return m_ShowbuyMoneyType; } }
		public int title { get { return m_title; } }
		public int type { get { return m_type; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static Vip __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static Vip() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( Vip ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, Vip> idCacheData {
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

		static Vip ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new Vip();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_attack = __mask[ 0 ] ? q.GetInt( DBCache.FID_attack, 6 ) : __default.m_attack;
				temp.m_buyMoneyNum = __mask[ 1 ] ? q.GetInt( DBCache.FID_buyMoneyNum, 11 ) : __default.m_buyMoneyNum;
				temp.m_buyMoneyType = __mask[ 2 ] ? q.GetInt( DBCache.FID_buyMoneyType, 12 ) : __default.m_buyMoneyType;
				temp.m_exp = __mask[ 3 ] ? q.GetInt( DBCache.FID_exp, 3 ) : __default.m_exp;
				temp.m_exp_rate = __mask[ 4 ] ? q.GetInt( DBCache.FID_exp_rate, 8 ) : __default.m_exp_rate;
				temp.m_level = __mask[ 5 ] ? q.GetInt( DBCache.FID_level, 5 ) : __default.m_level;
				temp.m_master = __mask[ 7 ] ? q.GetInt( DBCache.FID_master, 6 ) : __default.m_master;
				temp.m_model_name = __mask[ 9 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_model_name, 10 ) : __default.m_model_name;
				temp.m_ShowbuyMoneyNum = __mask[ 13 ] ? q.GetInt( DBCache.FID_ShowbuyMoneyNum, 15 ) : __default.m_ShowbuyMoneyNum;
				temp.m_ShowbuyMoneyType = __mask[ 14 ] ? q.GetInt( DBCache.FID_ShowbuyMoneyType, 16 ) : __default.m_ShowbuyMoneyType;
				temp.m_title = __mask[ 16 ] ? q.GetInt( DBCache.FID_title, 5 ) : __default.m_title;
				temp.m_type = __mask[ 17 ] ? q.GetInt( DBCache.FID_type, 4 ) : __default.m_type;
				VipEx.IsValid_level_item = __mask[ 6 ];
				VipEx.IsValid_model_hight = __mask[ 8 ];
				VipEx.IsValid_model_s = __mask[ 10 ];
				VipEx.IsValid_model_zoom = __mask[ 11 ];
				VipEx.IsValid_power = __mask[ 12 ];
				VipEx.IsValid_specialItem = __mask[ 15 ];
				if ( VipEx.onLoadComplexField_level_item != null ) {
					VipEx.onLoadComplexField_level_item( temp, q );
				}
				if ( VipEx.onLoadComplexField_model_hight != null ) {
					VipEx.onLoadComplexField_model_hight( temp, q );
				}
				if ( VipEx.onLoadComplexField_model_s != null ) {
					VipEx.onLoadComplexField_model_s( temp, q );
				}
				if ( VipEx.onLoadComplexField_model_zoom != null ) {
					VipEx.onLoadComplexField_model_zoom( temp, q );
				}
				if ( VipEx.onLoadComplexField_power != null ) {
					VipEx.onLoadComplexField_power( temp, q );
				}
				if ( VipEx.onLoadComplexField_specialItem != null ) {
					VipEx.onLoadComplexField_specialItem( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static Vip Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			Vip ret = null;
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

		const int VersionHash = 0x4c872edf;
		#endregion
	}

	public partial class VipEx {
		public delegate void LoadComplexField( Vip data, LuaDatabase.Query q );
		internal static bool IsValid_level_item = true;
		static LoadComplexField OnLoadComplexField_level_item = null;
		public static LoadComplexField onLoadComplexField_level_item {
			get {
				return OnLoadComplexField_level_item;
			}
		}
		internal static bool IsValid_model_hight = true;
		static LoadComplexField OnLoadComplexField_model_hight = null;
		public static LoadComplexField onLoadComplexField_model_hight {
			get {
				return OnLoadComplexField_model_hight;
			}
		}
		internal static bool IsValid_model_s = true;
		static LoadComplexField OnLoadComplexField_model_s = null;
		public static LoadComplexField onLoadComplexField_model_s {
			get {
				return OnLoadComplexField_model_s;
			}
		}
		internal static bool IsValid_model_zoom = true;
		static LoadComplexField OnLoadComplexField_model_zoom = null;
		public static LoadComplexField onLoadComplexField_model_zoom {
			get {
				return OnLoadComplexField_model_zoom;
			}
		}
		internal static bool IsValid_power = true;
		static LoadComplexField OnLoadComplexField_power = null;
		public static LoadComplexField onLoadComplexField_power {
			get {
				return OnLoadComplexField_power;
			}
		}
		internal static bool IsValid_specialItem = true;
		static LoadComplexField OnLoadComplexField_specialItem = null;
		public static LoadComplexField onLoadComplexField_specialItem {
			get {
				return OnLoadComplexField_specialItem;
			}
		}
	}
}
//EOF