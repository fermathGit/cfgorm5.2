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
	public partial class Wild_Coordinates {
		const string DBName = "wild_coordinates";
		#region members
		private int m_id = 0;
		private int m_lv_max = 0;
		private int m_lv_min = 0;
		private string m_map = String.Empty;
		private int m_map_id = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, Wild_Coordinates> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, Wild_Coordinates>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int lv_max { get { return m_lv_max; } }
		public int lv_min { get { return m_lv_min; } }
		public string map { get { return m_map; } }
		public int map_id { get { return m_map_id; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static Wild_Coordinates __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static Wild_Coordinates() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( Wild_Coordinates ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, Wild_Coordinates> idCacheData {
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

		static Wild_Coordinates ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new Wild_Coordinates();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_lv_max = __mask[ 1 ] ? q.GetInt( DBCache.FID_lv_max, 6 ) : __default.m_lv_max;
				temp.m_lv_min = __mask[ 2 ] ? q.GetInt( DBCache.FID_lv_min, 6 ) : __default.m_lv_min;
				temp.m_map = __mask[ 3 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_map, 3 ) : __default.m_map;
				temp.m_map_id = __mask[ 4 ] ? q.GetInt( DBCache.FID_map_id, 6 ) : __default.m_map_id;
				Wild_CoordinatesEx.IsValid_coordinates = __mask[ 0 ];
				if ( Wild_CoordinatesEx.onLoadComplexField_coordinates != null ) {
					Wild_CoordinatesEx.onLoadComplexField_coordinates( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static Wild_Coordinates Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			Wild_Coordinates ret = null;
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

		const int VersionHash = 0x66a27850;
		#endregion
	}

	public partial class Wild_CoordinatesEx {
		public delegate void LoadComplexField( Wild_Coordinates data, LuaDatabase.Query q );
		internal static bool IsValid_coordinates = true;
		static LoadComplexField OnLoadComplexField_coordinates = null;
		public static LoadComplexField onLoadComplexField_coordinates {
			get {
				return OnLoadComplexField_coordinates;
			}
		}
	}
}
//EOF
