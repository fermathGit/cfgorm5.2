using System;
using System.Collections.Generic;
using Common;
using UnityEngine;

#pragma warning disable 0219
#pragma warning disable 0168

#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
using LuaStartup = NativeLua.LuaStartup;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaStartup = UniLuax.LuaStartup;
#endif

namespace Database {

    namespace Internal {

        public class RoleAnimEventBank {

            const string DBName = "RoleAnimEventBank";
            #region members
            static String m_root = String.Empty;
            #endregion

            #region properties
            public String root {
                get {
                    return m_root;
                }
            }
            #endregion

            #region method
            static RoleAnimEventBank() {
                LuaStartup.Initialize();
                Load();
            }

            public static bool Load() {
                m_root = String.Empty;
                var db = LuaDatabase.sharedInstance;
                if ( db.Load( DBName ) ) {
                    m_root = db.QueryValue<String>( String.Format( "{0}.{1}.root", LuaDatabase.ROOT_NAME, DBName ) );
                    return true;
                }
                return false;
            }

            public static bool Unload() {
                return LuaDatabase.sharedInstance.Unload( DBName );
            }

            public static bool Reload() {
                Unload();
                return Load();
            }
            #endregion

            // list a model as a list
            public static List<String> GetModelList() {
                var db = LuaDatabase.sharedInstance;
                return db.GetTableSKeys( String.Format( "{0}.models", DBName ) );
            }

            // get all animation clips used by all role's models
            public static List<String> GetAnimationClipPathList() {
                var db = LuaDatabase.sharedInstance;
                return db.GetTableIValues<String>( String.Format( "{0}.animationFiles", DBName ) );
            }

            // get role model's animation clip asset path as a list
            public static List<String> GetModelAnimationFiles( String modelPath ) {
                var fileList = new List<String>();
                var animIndices = GetModelAnimationIndices( modelPath );
                var db = LuaDatabase.sharedInstance;
                var cmdPrefix = String.Format( "{0}.{1}.animationFiles", LuaDatabase.ROOT_NAME, DBName );
                animIndices.ForEach(
                    n => {
                        String fn = db.QueryValue<String>( String.Format( "{0}[{1}]", cmdPrefix, n ) );
                        fileList.Add( fn );
                    }
                );
                return fileList;
            }

            public static List<AnimationEvent> GetAnimationEventListFromFileIndex( int index ) {
                // lua array index start from 1
                index = index + 1;
                var db = LuaDatabase.sharedInstance;
                var L = ( NLuaState )db.GetLuaState();
                var ret = new List<AnimationEvent>();// lua array index start from 1
                using ( var q = db.CreateQuery( String.Format( "{0}.animationEvents[{1}]", DBName, index ) ) ) {
                    var eventsTable = q.ToTable();
                    if ( eventsTable != LuaTinker.Table.Empty ) {
                        int len = eventsTable.Length;
                        for ( int i = 0; i < len; ++i ) {
                            int et = eventsTable.index;
                            L.RawGetI( et, i + 1 );
                            if ( L.IsTable( -1 ) ) {
                                // ... table, index, eventsTable
                                var eventDef = new LuaTinker.Table( L, -1 );
                                var ae = new AnimationEvent();
                                ae.functionName = eventDef.Get<String>( "func" );
                                ae.time = eventDef.Get<Single>( "time", 0.0f );
                                ae.stringParameter = eventDef.Get<String>( "arg_s" );
                                ae.intParameter = eventDef.Get<Int32>( "arg_i", 0 );
                                ae.floatParameter = eventDef.Get<Single>( "arg_f", 0.0f );
                                ae.messageOptions = SendMessageOptions.DontRequireReceiver;
                                ret.Add( ae );
                            }
                            L.Pop( 1 );
                        }
                    }
                }
                return ret;
            }

            public static List<AnimationEvent> GetAnimationEventList( String modelPath, String animName ) {
                var db = LuaDatabase.sharedInstance;
                var L = ( NLuaState )db.GetLuaState();
                var ret = new List<AnimationEvent>();
                int top = L.GetTop();
                try {
                    Int32 index = db.QueryValue<Int32>( String.Format( "{0}.{1}.models[\"{2}\"].animIds.{3}", LuaDatabase.ROOT_NAME, DBName, modelPath, animName ) );
                    if ( index != 0 ) {
                        return GetAnimationEventListFromFileIndex( index );
                    }
                } finally {
                    L.SetTop( top );
                }
                return ret;
            }

            // get role model's animation clip asset path index as a list
            public static List<Int32> GetModelAnimationIndices( String modelPath, List<String> animList = null ) {
                var db = LuaDatabase.sharedInstance;
                var L = ( NLuaState )db.GetLuaState();
                var ret = new List<Int32>();
                if ( animList != null ) {
                    animList.Clear();
                }
                using ( var q = db.CreateQuery( String.Format( "{0}.models[\"{1}\"].animIds", DBName, modelPath ) ) ) {
                    var table = q.ToTable();
                    if ( table != LuaTinker.Table.Empty ) {
                        var tableIndex = table.index;
                        L.PushNil();
                        // stack: table, ..., nil
                        while ( L.Next( tableIndex ) ) {
                            // stack: table, ..., key, value
                            // key: animation clip name
                            // animation file index
                            if ( L.Type( -2 ) == LuaType.LUA_TSTRING ) {
                                if ( L.Type( -1 ) == LuaType.LUA_TNUMBER ) {
                                    ret.Add( L.ToInteger( -1 ) );
                                    if ( animList != null ) {
                                        animList.Add( L.ToString( -2 ) );
                                    }
                                }
                            }
                            L.Pop( 1 );
                        }
                        L.Pop( 1 );
                    }
                }
                return ret;
            }

            public static void Dump() {
                //var ml2 = GetModelAnimationFiles( "player_4/player_4_2" );
                //ml2.ForEach( n => Common.UDebug.Log( n ) );
                GetAnimationEventList( "player_4/player_4_6", "baseattack1" );
            }
        }
    }
}
//EOF
