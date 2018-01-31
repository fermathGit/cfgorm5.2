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
	public partial class GirlItemType {
		const string DBName = "girlitem_type";
		#region members
		private int m_id = 0;
		private int m_open = 0;
		private string m_Ornamty_name = String.Empty;
		private int m_ParentType = 0;
		private string m_Slot = String.Empty;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, GirlItemType> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, GirlItemType>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int open { get { return m_open; } }
		public string Ornamty_name { get { return m_Ornamty_name; } }
		public int ParentType { get { return m_ParentType; } }
		public string Slot { get { return m_Slot; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static GirlItemType __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static GirlItemType() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( GirlItemType ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, GirlItemType> idCacheData {
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

		static GirlItemType ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new GirlItemType();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_open = __mask[ 0 ] ? q.GetInt( DBCache.FID_open, 4 ) : __default.m_open;
				temp.m_Ornamty_name = __mask[ 1 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_Ornamty_name, 12 ) : __default.m_Ornamty_name;
				temp.m_ParentType = __mask[ 3 ] ? q.GetInt( DBCache.FID_ParentType, 10 ) : __default.m_ParentType;
				temp.m_Slot = __mask[ 4 ] ? Dataset.DecodeToDatabaseString( q, DBCache.FID_Slot, 4 ) : __default.m_Slot;
				GirlItemTypeEx.IsValid_Ornamty_show = __mask[ 2 ];
				if ( GirlItemTypeEx.onLoadComplexField_Ornamty_show != null ) {
					GirlItemTypeEx.onLoadComplexField_Ornamty_show( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static GirlItemType Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			GirlItemType ret = null;
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

		const int VersionHash = 0x14fef240;
		#endregion
	}

	public partial class GirlItemTypeEx {
		public delegate void LoadComplexField( GirlItemType data, LuaDatabase.Query q );
		internal static bool IsValid_Ornamty_show = true;
		static LoadComplexField OnLoadComplexField_Ornamty_show = null;
		public static LoadComplexField onLoadComplexField_Ornamty_show {
			get {
				return OnLoadComplexField_Ornamty_show;
			}
		}
	}
}
//EOF
