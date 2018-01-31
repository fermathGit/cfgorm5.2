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
	public partial class Player_Deadguide {
		const string DBName = "player_deadguide";
		#region members
		private int m_id = 0;
		private string m_des1 = String.Empty;
		private string m_des2 = String.Empty;
		private string m_des3 = String.Empty;
		private int m_icon1 = 0;
		private int m_icon2 = 0;
		private int m_icon3 = 0;
		private int m_maxlevel = 0;
		private int m_minlevel = 0;
		private int m_type1 = 0;
		private int m_type2 = 0;
		private int m_type3 = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, Player_Deadguide> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, Player_Deadguide>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public string des1 { get { return m_des1; } }
		public string des2 { get { return m_des2; } }
		public string des3 { get { return m_des3; } }
		public int icon1 { get { return m_icon1; } }
		public int icon2 { get { return m_icon2; } }
		public int icon3 { get { return m_icon3; } }
		public int maxlevel { get { return m_maxlevel; } }
		public int minlevel { get { return m_minlevel; } }
		public int type1 { get { return m_type1; } }
		public int type2 { get { return m_type2; } }
		public int type3 { get { return m_type3; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static Player_Deadguide __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static Player_Deadguide() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( Player_Deadguide ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, Player_Deadguide> idCacheData {
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

		static Player_Deadguide ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new Player_Deadguide();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_des1 = __mask[ 0 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_des1, 4 ) : __default.m_des1;
				temp.m_des2 = __mask[ 1 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_des2, 4 ) : __default.m_des2;
				temp.m_des3 = __mask[ 2 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_des3, 4 ) : __default.m_des3;
				temp.m_icon1 = __mask[ 3 ] ? q.GetInt( DBCache.FID_icon1, 5 ) : __default.m_icon1;
				temp.m_icon2 = __mask[ 4 ] ? q.GetInt( DBCache.FID_icon2, 5 ) : __default.m_icon2;
				temp.m_icon3 = __mask[ 5 ] ? q.GetInt( DBCache.FID_icon3, 5 ) : __default.m_icon3;
				temp.m_maxlevel = __mask[ 6 ] ? q.GetInt( DBCache.FID_maxlevel, 8 ) : __default.m_maxlevel;
				temp.m_minlevel = __mask[ 7 ] ? q.GetInt( DBCache.FID_minlevel, 8 ) : __default.m_minlevel;
				temp.m_type1 = __mask[ 8 ] ? q.GetInt( DBCache.FID_type1, 5 ) : __default.m_type1;
				temp.m_type2 = __mask[ 9 ] ? q.GetInt( DBCache.FID_type2, 5 ) : __default.m_type2;
				temp.m_type3 = __mask[ 10 ] ? q.GetInt( DBCache.FID_type3, 5 ) : __default.m_type3;
				return temp;
			}
			return null;
		}

 		public static Player_Deadguide Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			Player_Deadguide ret = null;
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

		const int VersionHash = 0x3f0de535;
		#endregion
	}
}
//EOF