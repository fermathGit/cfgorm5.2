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
	public partial class LevelReward {
		const string DBName = "level_reward";
		#region members
		private int m_id = 0;
		private int m_item1 = 0;
		private int m_item10 = 0;
		private int m_item2 = 0;
		private int m_item3 = 0;
		private int m_item4 = 0;
		private int m_item5 = 0;
		private int m_item6 = 0;
		private int m_item7 = 0;
		private int m_item8 = 0;
		private int m_item9 = 0;
		private int m_level = 0;
		private int m_num1 = 0;
		private int m_num10 = 0;
		private int m_num2 = 0;
		private int m_num3 = 0;
		private int m_num4 = 0;
		private int m_num5 = 0;
		private int m_num6 = 0;
		private int m_num7 = 0;
		private int m_num8 = 0;
		private int m_num9 = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, LevelReward> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, LevelReward>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int item1 { get { return m_item1; } }
		public int item10 { get { return m_item10; } }
		public int item2 { get { return m_item2; } }
		public int item3 { get { return m_item3; } }
		public int item4 { get { return m_item4; } }
		public int item5 { get { return m_item5; } }
		public int item6 { get { return m_item6; } }
		public int item7 { get { return m_item7; } }
		public int item8 { get { return m_item8; } }
		public int item9 { get { return m_item9; } }
		public int level { get { return m_level; } }
		public int num1 { get { return m_num1; } }
		public int num10 { get { return m_num10; } }
		public int num2 { get { return m_num2; } }
		public int num3 { get { return m_num3; } }
		public int num4 { get { return m_num4; } }
		public int num5 { get { return m_num5; } }
		public int num6 { get { return m_num6; } }
		public int num7 { get { return m_num7; } }
		public int num8 { get { return m_num8; } }
		public int num9 { get { return m_num9; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static LevelReward __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static LevelReward() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( LevelReward ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, LevelReward> idCacheData {
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

		static LevelReward ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new LevelReward();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_item1 = __mask[ 0 ] ? q.GetInt( DBCache.FID_item1, 5 ) : __default.m_item1;
				temp.m_item10 = __mask[ 1 ] ? q.GetInt( DBCache.FID_item10, 6 ) : __default.m_item10;
				temp.m_item2 = __mask[ 2 ] ? q.GetInt( DBCache.FID_item2, 5 ) : __default.m_item2;
				temp.m_item3 = __mask[ 3 ] ? q.GetInt( DBCache.FID_item3, 5 ) : __default.m_item3;
				temp.m_item4 = __mask[ 4 ] ? q.GetInt( DBCache.FID_item4, 5 ) : __default.m_item4;
				temp.m_item5 = __mask[ 5 ] ? q.GetInt( DBCache.FID_item5, 5 ) : __default.m_item5;
				temp.m_item6 = __mask[ 6 ] ? q.GetInt( DBCache.FID_item6, 5 ) : __default.m_item6;
				temp.m_item7 = __mask[ 7 ] ? q.GetInt( DBCache.FID_item7, 5 ) : __default.m_item7;
				temp.m_item8 = __mask[ 8 ] ? q.GetInt( DBCache.FID_item8, 5 ) : __default.m_item8;
				temp.m_item9 = __mask[ 9 ] ? q.GetInt( DBCache.FID_item9, 5 ) : __default.m_item9;
				temp.m_level = __mask[ 10 ] ? q.GetInt( DBCache.FID_level, 5 ) : __default.m_level;
				temp.m_num1 = __mask[ 11 ] ? q.GetInt( DBCache.FID_num1, 4 ) : __default.m_num1;
				temp.m_num10 = __mask[ 12 ] ? q.GetInt( DBCache.FID_num10, 5 ) : __default.m_num10;
				temp.m_num2 = __mask[ 13 ] ? q.GetInt( DBCache.FID_num2, 4 ) : __default.m_num2;
				temp.m_num3 = __mask[ 14 ] ? q.GetInt( DBCache.FID_num3, 4 ) : __default.m_num3;
				temp.m_num4 = __mask[ 15 ] ? q.GetInt( DBCache.FID_num4, 4 ) : __default.m_num4;
				temp.m_num5 = __mask[ 16 ] ? q.GetInt( DBCache.FID_num5, 4 ) : __default.m_num5;
				temp.m_num6 = __mask[ 17 ] ? q.GetInt( DBCache.FID_num6, 4 ) : __default.m_num6;
				temp.m_num7 = __mask[ 18 ] ? q.GetInt( DBCache.FID_num7, 4 ) : __default.m_num7;
				temp.m_num8 = __mask[ 19 ] ? q.GetInt( DBCache.FID_num8, 4 ) : __default.m_num8;
				temp.m_num9 = __mask[ 20 ] ? q.GetInt( DBCache.FID_num9, 4 ) : __default.m_num9;
				return temp;
			}
			return null;
		}

 		public static LevelReward Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			LevelReward ret = null;
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

		const int VersionHash = 0x2c88c95c;
		#endregion
	}
}
//EOF