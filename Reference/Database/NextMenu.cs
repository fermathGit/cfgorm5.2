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
	public partial class NextMenu {
		const string DBName = "nextMenu";
		#region members
		private int m_id = 0;
		private int m_dailyID = 0;
		private string m_description = String.Empty;
		private string m_Frontshowtips = String.Empty;
		private int m_icon = 0;
		private int m_ishide = 0;
		private int m_level = 0;
		private string m_name = String.Empty;
		private int m_showlevel = 0;
		private string m_showtips = String.Empty;
		private int m_textures = 0;
		private int m_type = 0;
		#endregion
		#region caches
		private static IKeys m_ids = null;
		private static Common.Collections.Generic.Lit.Dictionary<int, NextMenu> m_idCache = new Common.Collections.Generic.Lit.Dictionary<int, NextMenu>();
		#endregion
		#region properties
		public int id { get { return m_id; } }
		public int dailyID { get { return m_dailyID; } }
		public string description { get { return m_description; } }
		public string Frontshowtips { get { return m_Frontshowtips; } }
		public int icon { get { return m_icon; } }
		public int ishide { get { return m_ishide; } }
		public int level { get { return m_level; } }
		public string name { get { return m_name; } }
		public int showlevel { get { return m_showlevel; } }
		public string showtips { get { return m_showtips; } }
		public int textures { get { return m_textures; } }
		public int type { get { return m_type; } }
		#endregion
		#region method
		static LuaTableHandle __this = default( LuaTableHandle );
		static NextMenu __default = null;
		static int __hash = 0;
		static bool __masked = false;

		static NextMenu() {
			LuaDatabase.datasetUnloadEvent += OnUnload;
			if ( Load() ) {
				DBLoadedItems.MarkAutoLoaded( DBName, typeof( NextMenu ) );
			}
		}

		public static String DbName {
			get { return DBName; }
		}

		public static Common.Collections.Generic.Lit.Dictionary<int, NextMenu> idCacheData {
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

		static NextMenu ReadOne( LuaDatabase.Query q, int id ) {
			if ( q.IsTable() ) {
				var temp = new NextMenu();
				var __mask = DBCache.LoadCurrentFieldMask( q, __masked );
				temp.m_id = id;
				temp.m_dailyID = __mask[ 0 ] ? q.GetInt( DBCache.FID_dailyID, 7 ) : __default.m_dailyID;
				temp.m_description = __mask[ 1 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_description, 11 ) : __default.m_description;
				temp.m_Frontshowtips = __mask[ 2 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_Frontshowtips, 13 ) : __default.m_Frontshowtips;
				temp.m_icon = __mask[ 3 ] ? q.GetInt( DBCache.FID_icon, 4 ) : __default.m_icon;
				temp.m_ishide = __mask[ 4 ] ? q.GetInt( DBCache.FID_ishide, 6 ) : __default.m_ishide;
				temp.m_level = __mask[ 6 ] ? q.GetInt( DBCache.FID_level, 5 ) : __default.m_level;
				temp.m_name = __mask[ 7 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_name, 4 ) : __default.m_name;
				temp.m_showlevel = __mask[ 8 ] ? q.GetInt( DBCache.FID_showlevel, 9 ) : __default.m_showlevel;
				temp.m_showtips = __mask[ 9 ] ? Dataset.DecodeToLocalizedString( q, DBCache.FID_showtips, 8 ) : __default.m_showtips;
				temp.m_textures = __mask[ 10 ] ? q.GetInt( DBCache.FID_textures, 8 ) : __default.m_textures;
				temp.m_type = __mask[ 11 ] ? q.GetInt( DBCache.FID_type, 4 ) : __default.m_type;
				NextMenuEx.IsValid_item1 = __mask[ 5 ];
				if ( NextMenuEx.onLoadComplexField_item1 != null ) {
					NextMenuEx.onLoadComplexField_item1( temp, q );
				}
				return temp;
			}
			return null;
		}

 		public static NextMenu Get( int id ) {
			if ( id == 0 ) {
				return null;
			}
			NextMenu ret = null;
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

		const int VersionHash = 0x6f02b0b4;
		#endregion
	}

	public partial class NextMenuEx {
		public delegate void LoadComplexField( NextMenu data, LuaDatabase.Query q );
		internal static bool IsValid_item1 = true;
		static LoadComplexField OnLoadComplexField_item1 = null;
		public static LoadComplexField onLoadComplexField_item1 {
			get {
				return OnLoadComplexField_item1;
			}
		}
	}
}
//EOF
