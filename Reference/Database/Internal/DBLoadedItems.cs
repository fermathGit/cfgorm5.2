
using System;
using System.Linq;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
#endif

namespace Database {

    public static class DBLoadedItems {

        static HashSet<String> m_loaded = null;
        static HashSet<Type> m_typeLoaded = null;

        static DBLoadedItems() {      
            m_loaded = new HashSet<String>();
            m_typeLoaded = new HashSet<Type>();
        }

        public static void MarkAutoLoaded( String dbName, Type type = null ) {
            if ( !m_loaded.Contains( dbName ) ) {
                m_loaded.Add( dbName );
            }
            if ( !m_typeLoaded.Contains( type ) ) {
                m_typeLoaded.Add( type );
            }
        }

        public static void Reload() {
            LuaDatabase.sharedInstance.UnloadAll();
            if ( m_loaded.Count > 0 ) {
                foreach ( var dbName in m_loaded ) {
                    LuaDatabase.sharedInstance.Load( dbName );
                }
            }
        }

        public static void EnsureLoaded() {
            if ( m_loaded.Count > 0 ) {
                foreach ( var dbName in m_loaded ) {
                    LuaDatabase.sharedInstance.Load( dbName );
                }
            }
        }

        public static List<String> GetAutoLoaded() {
            var ret = new List<String>( m_loaded.Count );
            if ( m_loaded.Count > 0 ) {
                foreach ( var dbName in m_loaded ) {
                    ret.Add( dbName );
                }
            }
            return ret;
        }

        public static void Sweep( bool force = false ) {
            object[] p = new object[] { force };
            if ( m_typeLoaded.Count > 0 ) {
                foreach ( var t in m_typeLoaded ) {
                    var mi = t.GetMethod( "Sweep", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
                    if ( mi != null ) {
                        mi.Invoke( null, p );
                        Common.UDebug.Log( "Sweep database: {0}", t.Name );
                    }
                }
            }
        }

        public static void CheckDatabase( Type t ) {
            var sf1 = t.GetMethod( "EnsureLoaded", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
            if ( sf1 != null ) {
                sf1.Invoke( null, new object[] {} );
                Common.UDebug.Log( "call {0}.EnsureLoaded", t.Name );
            }
            var sf = t.GetMethod( "GetKeys", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
            if ( sf != null ) {
                sf.Invoke( null, new object[] { false, null } );
                Common.UDebug.Log( "call {0}.GetKeys", t.Name );
            }
            var sf3 = t.GetMethod( "CacheAll", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
            if ( sf3 != null ) {
                sf3.Invoke( null, new object[] {} );
                Common.UDebug.Log( "call {0}.CacheAll", t.Name );
            }
        }

        public static bool CheckStaticMembers( Type t ) {
            // check static fields & properies
            var sf = t.GetFields( System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static ).Where(
                x => x.IsLiteral == false &&
                    x.IsInitOnly == false &&
                    typeof( Delegate ).IsAssignableFrom( x.FieldType ) == false &&
                    x.Name != "DBName" &&
                    x.Name != "m_idCache" &&
                    x.Name != "m_nameCache" &&
                    x.Name != "m_ids" ).ToArray();

            if( sf != null && sf.Length > 0 ) {
                if( t.GetMethod( "ClearCacheEx", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static ) == null ) {
                    var sb = Common.StringUtils.newStringBuilder;
                    for( int i = 0; i < sf.Length; ++i ) {
                        if( sb.Length > 0 ) {
                            sb.Append( "," );
                        }
                        sb.Append( sf[i].Name );
                    }
                    Common.UDebug.LogError( "please do not add any static fields into database class: check for class {0}-{1}", t.FullName, sb.ToString() );
                    return false;
                }
            }
            return true;
        }

        public static void ClearCacheEx() {
            if ( m_typeLoaded.Count > 0 ) {
                foreach ( var t in m_typeLoaded ) {
                    if ( t != null ) {
                        CheckStaticMembers( t );
                        var type = Type.GetType( t.FullName + "Ex" );
                        if ( type != null ) {
                            if ( !CheckStaticMembers( type ) ) {
                                var mi = t.GetMethod( "ClearCacheEx", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
                                if ( mi != null ) {
                                    mi.Invoke( null, null );
                                } else {
                                    Common.UDebug.LogError( "{0} found, but there is no ClearCacheEx method!", type.FullName );
                                }
                            }
                        }
                    }
                }
            }
        }

        public static void ClearCache() {
            if ( m_typeLoaded.Count > 0 ) {
                foreach ( var t in m_typeLoaded ) {
                    if ( t != null ) {
                        var mi = t.GetMethod( "ClearCache", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
                        if ( mi != null ) {
                            mi.Invoke( null, null );
                        }
                        var mie = t.GetMethod( "ClearCacheEx", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
                        if ( mie != null ) {
                            mie.Invoke( null, null );
                        }
                    }
                }
            }
        }

        public static void CacheAll() {
            if ( m_typeLoaded.Count > 0 ) {
                foreach ( var t in m_typeLoaded ) {
                    if ( t != null ) {
                        var mi = t.GetMethod( "CacheAll", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static );
                        if ( mi != null ) {
                            mi.Invoke( null, null );
                        }
                    }
                }
            }
        }
    }
}
//EOF
