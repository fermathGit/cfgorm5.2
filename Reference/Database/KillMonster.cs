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
	public partial class KillMonster {
		const string DBName = "killmonster";
		#region members
		private int m_id = 0;
		private int m_beginTime = 0;
		private int m_endTime = 0;
		private string m_icon = String.Empty;
		private int m_mapDataId = 0;
		private string m_name = String.Empty;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, KillMonster> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, KillMonster>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int beginTime { get { return m_beginTime; } }
		public int endTime { get { return m_endTime; } }
		public string icon { get { return m_icon; } }
		public int mapDataId { get { return m_mapDataId; } }
		public string name { get { return m_name; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static KillMonster __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static KillMonster() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( KillMonster ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, KillMonster> idCacheData {
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

		static KillMonster ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new KillMonster();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_beginTime = __mask[ 0 ] ? q.GetInt( DBCache.FID_beginTime, 9 ) : __default.m_beginTime;
				temp.m_endTime = __mask[ 1 ] ? q.GetInt( DBCache.FID_endTime, 7 ) : __default.m_endTime;
				temp.m_icon = __mask[ 2 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_icon, 4 ) : __default.m_icon;
				temp.m_mapDataId = __mask[ 3 ] ? q.GetInt( DBCache.FID_mapDataId, 9 ) : __default.m_mapDataId;
				temp.m_name = __mask[ 5 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_name, 4 ) : __default.m_name;
				KillMonsterEx.IsValid_monsterDataIds = __mask[ 4 ];
				KillMonsterEx.IsValid_pathfinding = __mask[ 6 ];
				KillMonsterEx.IsValid_posSet = __mask[ 7 ];
				KillMonsterEx.IsValid_refreshMoster = __mask[ 8 ];
				KillMonsterEx.IsValid_showItems = __mask[ 9 ];
				if ( KillMonsterEx.onLoadComplexField_monsterDataIds != null ) {
					KillMonsterEx.onLoadComplexField_monsterDataIds( temp, q );
				}
				if ( KillMonsterEx.onLoadComplexField_pathfinding != null ) {
					KillMonsterEx.onLoadComplexField_pathfinding( temp, q );
				}
				if ( KillMonsterEx.onLoadComplexField_posSet != null ) {
					KillMonsterEx.onLoadComplexField_posSet( temp, q );
				}
				if ( KillMonsterEx.onLoadComplexField_refreshMoster != null ) {
					KillMonsterEx.onLoadComplexField_refreshMoster( temp, q );
				}
				if ( KillMonsterEx.onLoadComplexField_showItems != null ) {
					KillMonsterEx.onLoadComplexField_showItems( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static KillMonster Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			KillMonster ret = null;
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

		const int VersionHash = 0x26bc5d13;
		#endregion
	}

	public partial class KillMonsterEx {
		public delegate void LoadComplexField( KillMonster data, LuaDatabase.Query q );
		internal static bool IsValid_monsterDataIds = true;
		static LoadComplexField OnLoadComplexField_monsterDataIds = null;
		public static LoadComplexField onLoadComplexField_monsterDataIds {
			get {
				return OnLoadComplexField_monsterDataIds;
			}
		}
		internal static bool IsValid_pathfinding = true;
		static LoadComplexField OnLoadComplexField_pathfinding = null;
		public static LoadComplexField onLoadComplexField_pathfinding {
			get {
				return OnLoadComplexField_pathfinding;
			}
		}
		internal static bool IsValid_posSet = true;
		static LoadComplexField OnLoadComplexField_posSet = null;
		public static LoadComplexField onLoadComplexField_posSet {
			get {
				return OnLoadComplexField_posSet;
			}
		}
		internal static bool IsValid_refreshMoster = true;
		static LoadComplexField OnLoadComplexField_refreshMoster = null;
		public static LoadComplexField onLoadComplexField_refreshMoster {
			get {
				return OnLoadComplexField_refreshMoster;
			}
		}
		internal static bool IsValid_showItems = true;
		static LoadComplexField OnLoadComplexField_showItems = null;
		public static LoadComplexField onLoadComplexField_showItems {
			get {
				return OnLoadComplexField_showItems;
			}
		}
	}
}
//EOF
