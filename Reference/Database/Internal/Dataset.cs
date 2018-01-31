#define CACHE_DATABASE_STRING

using System;
using System.Text;
using System.Collections.Generic;
using Common;
using System.Runtime.InteropServices;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaTasker = NativeLua.LuaTasker;
using LuaDatabase = NativeLua.LuaDatabase;
using TableHandle = System.Int64;
using LuaStateHandle = System.IntPtr;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaTasker = UniLuax.LuaTasker;
using TableHandle = System.Object;
using LuaStateHandle = UniLua.ILuaState;
#endif

namespace Database {

    public partial class DBCache {
#if USE_NATIVE_LUA
        public static readonly byte[] FID___mask = { ( byte )'_', ( byte )'_', ( byte )'m', ( byte )'a', ( byte )'s', ( byte )'k', 0x00 };
#else
        public const string FID___mask = "__mask";
#endif
        static byte[] _Base64Code = null;

        static DBCache() {
            var code = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            _Base64Code = new byte[ 128 ];
            for ( int i = 0; i < code.Length; ++i ) {
                _Base64Code[ code[ i ] ] = ( byte )i;
            }
        }

        public class FieldMask {
            internal List<byte> buf = new List<byte>();
            public bool this[ int index ] {
                get {
                    var i = index / 6;
                    if ( i >= buf.Count ) {
                        // no mask here, always be able to read
                        return true;
                    }
                    var mod = index % 6;
                    return ( buf[ i ] & ( 1 << mod ) ) != 0;
                }
            }
        }
        static FieldMask GFieldMask = new FieldMask();

        public unsafe static FieldMask LoadCurrentFieldMask( LuaDatabase.Query q, bool enable ) {
            var mask = GFieldMask;
            mask.buf.Clear();
            if ( enable ) {
                uint olen;
                var _cstr = q.GetStringPtr( FID___mask, out olen, 6 );
#if USE_NATIVE_LUA
                var cstr = ( sbyte* )_cstr;
#else
                var cstr = _cstr;
#endif
                var len = ( int )olen;
                for ( int i = 0; i < len; ++i ) {
                    mask.buf.Add( _Base64Code[ cstr[ i ] ] );
                }
            }
            return mask;
        }
    }

    public static class Localize {
        public static string KLanguagePrefsKey = "area_prefs_key";
        public static Locale.DistributionRegion _region = Locale.DistributionRegion.China;

        public static string _curLan = "";
        public static string _oriLan = "";

        // default language
        static Localize() {
#if ARES_CHT
            _region =  Locale.DistributionRegion.Taiwan;         
#elif ARES_ENG || ARES_ENU
            _region =  Locale.DistributionRegion.USA;      
#elif ARES_THA
            _region = Locale.DistributionRegion.Thailand;
#elif ARES_RUS
            _region =  Locale.DistributionRegion.Russian;
#elif ARES_KOR
            _region =  Locale.DistributionRegion.Korea;
#elif ARES_JPN
            _region =  Locale.DistributionRegion.Japan;
#elif ARES_XMT
			_region =  Locale.DistributionRegion.SG_MY_TH;
#elif ARES_VIETNAM
			_region =  Locale.DistributionRegion.Vietnam;
#elif ARES_VERSION
			_region =  Locale.DistributionRegion.Brand;
#else
            _region = Locale.DistributionRegion.China;
#endif
            _curLan = _oriLan = Locale.LanguageConfig.GetDefaultLan( _region );

#if ARES_XMT
            // user setting, xm only
            if (UnityEngine.PlayerPrefs.HasKey(KLanguagePrefsKey)) {
                _curLan = UnityEngine.PlayerPrefs.GetString( KLanguagePrefsKey );
            }
#endif
        }

        public static bool doesLanguageChanged {
            get { return _oriLan != _curLan; }
        }

        public static bool SetLanguage( string lan ) {
            if ( lan == _curLan || !Locale.LanguageConfig.Support(lan) ) {
                return false;
            } else {
                UnityEngine.PlayerPrefs.SetString( KLanguagePrefsKey, lan );
                UnityEngine.PlayerPrefs.Save();
                _curLan = lan;
                return true;
            }
        }

        public static Locale.DistributionRegion region {
            get { return _region; }
        }

        public static string orignalLan {
            get { return _oriLan; }
        }

        public static string language {
            get { return _curLan; }
        }
    }

    public class IKeys {
        List<int> _keys;
        public IKeys( List<int> raw ) {
            _keys = raw;
        }
        public int Count {
            get {
                return _keys.Count;
            }
        }
        public int this[ int index ] {
            get {
                return _keys[ index ];
            }
        }

        public List<int> ToList() {
            return new List<int>( _keys );
        }
    }

    public class SKeys {
        List<String> _keys;
        public SKeys( List<String> raw ) {
            _keys = raw;
        }
        public int Count {
            get {
                return _keys.Count;
            }
        }
        public String this[ int index ] {
            get {
                return _keys[ index ];
            }
        }
    }

    public class NKeys {
        List<double> _keys;
        public NKeys( List<double> raw ) {
            _keys = raw;
        }
        public int Count {
            get {
                return _keys.Count;
            }
        }
        public double this[ int index ] {
            get {
                return _keys[ index ];
            }
        }
    }

    public static class Dataset {

        const Char LocalizedStringTag = '@';
        const String LocalizedStringBankFile = "_LocaleText.csv";

        static Dictionary<int, String> m_stringBank = null;
        static Dataset() {
            LuaDatabase.datasetUnloadEvent += _DatasetUnload;
        }
        
        public static String GetLanguageTextBankFileName() {
            if ( Localize.language == Locale.LanguageConfig.DefaultLanguageTag) {
                return LocalizedStringBankFile;
            }
            var fileName = String.Format( "_LocaleText_{0}.csv", Localize.language.ToString() );
            var fn = String.Format( "{0}/{1}", LuaDatabase.ROOT, fileName );
            if ( !System.IO.File.Exists( fn ) ) {
                Common.ULogFile.sharedInstance.LogError( "Language text bank file not found: {0}", fn );
                return LocalizedStringBankFile;
            }
            return fileName;
        }

        static bool _IsDigit( int c ) {
            var x = c - ( int )'0';
            return x >= 0 && x < 10;
        }

        public static String LocalizeString( String id, int __len ) {
            if ( m_stringBank == null ) {
                LoadStringBank();
            }
            var len = id.Length;
            if ( len > 1 && id[ 0 ] == LocalizedStringTag ) {
                var _id = 0;
                for ( int i = 1; i < len; ++i ) {
                    var c = id[ i ];
                    if ( _IsDigit( c ) ) {
                        _id = _id * 10 + ( c - '0' );
                    } else {
                        break;
                    }
                }
                var r = id;
                if ( m_stringBank != null && m_stringBank.TryGetValue( _id, out r ) ) {
                    return r;
                }
            }
            return _DecodeUTF8FromPtr( id );
        }

        public unsafe static String LocalizeString( IntPtr cstr, int len ) {
            if ( m_stringBank == null ) {
                LoadStringBank();
            }
            byte* p = ( byte* )cstr;
            if ( len > 1 && *p == LocalizedStringTag ) {
                ++p;
                var _id = 0;
                while ( *p != 0 ) {
                    var _c = ( byte )( *p );
                    if ( _IsDigit( _c ) ) {
                        _id = _id * 10 + ( _c - '0' );
                    } else {
                        break;
                    }
                    ++p;
                }
                String r = null;
                if ( m_stringBank != null && m_stringBank.TryGetValue( _id, out r ) ) {
                    return r;
                }
            }
            return _DecodeUTF8FromPtr( cstr, len );
        }

        public static String LocalizeString( int id ) {
            if ( m_stringBank == null ) {
                LoadStringBank();
            }
            String r;
            if ( m_stringBank != null && m_stringBank.TryGetValue( id, out r ) ) {
                return r;
            }
            return id.ToString();
        }

        public static void LoadStringBank() {
            m_stringBank = new Dictionary<int, String>();
            try {
                var fn = String.Format( "{0}/{1}", LuaDatabase.ROOT, GetLanguageTextBankFileName() );
                if ( System.IO.File.Exists( fn ) ) {
                    Common.ULogFile.sharedInstance.Log( "Load string bank: {0}", fn );
                    long fileSize = 0;
                    using ( var fs = new System.IO.FileStream( fn, System.IO.FileMode.Open, System.IO.FileAccess.Read ) ) {
                        fileSize = fs.Seek( 0, System.IO.SeekOrigin.End );
                        if ( fileSize > 3 ) {
                            fs.Seek( 0, System.IO.SeekOrigin.Begin );
                            var _1 = fs.ReadByte();
                            var _2 = fs.ReadByte();
                            var _3 = fs.ReadByte();
                            if ( _1 == 0xef && _2 == 0xbb && _3 == 0xbf ) {
                                var row = new Common.CsvFile.CsvRow( 2 );
                                var sb = new StringBuilder( 128 );
                                using ( var reader = new Common.CsvFile.CsvFileReader( fs ) ) {
                                    row.Clear();
                                    while ( reader.ReadRow( row ) ) {
                                        if ( row.Count >= 2 ) {
                                            int id = 0;
                                            if ( int.TryParse( row[ 0 ], out id ) ) {
                                                sb.Length = 0;
                                                var s = StringUtils.DecodeEscape( row[ 1 ], sb );
                                                m_stringBank.Add( id, s );
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Common.UDebug.Log( "Database string bank size: {0}, file size: {1}", m_stringBank.Count, StringUtils.FormatMemorySize( fileSize ) );
                }
            } catch ( Exception e ) {
                Common.ULogFile.sharedInstance.LogException( e );
            }
        }

        static LuaStateHandle _CurrentLuaState = default( LuaStateHandle );
        static Dictionary<TableHandle, TArray<int>> _LuaIntArrayDict = new Dictionary<TableHandle, TArray<int>>();
        static Dictionary<TableHandle, TArray<double>> _LuaNumberArrayDict = new Dictionary<TableHandle, TArray<double>>();
        static Dictionary<TableHandle, TArray<TArray<int>>> _LuaIntArray2dDict = new Dictionary<TableHandle, TArray<TArray<int>>>();
        static Dictionary<TableHandle, TArray<TArray<double>>> _LuaNumberArray2dDict = new Dictionary<TableHandle, TArray<TArray<double>>>();

        static TArray<int> _EmptyTArrayI = new TArray<int>( null, true );
        static TArray<double> _EmptyTArrayN = new TArray<double>( null, true );
        static TArray<TArray<int>> _EmptyTArrayI2d = new TArray<TArray<int>>( null, true );
        static TArray<TArray<double>> _EmptyTArrayN2d = new TArray<TArray<double>>( null, true );

        static Dictionary<String, List<TableHandle>> _DatasetTableHandles = new Dictionary<String, List<TableHandle>>();

        static void _DatasetUnload( LuaStateHandle L, TableHandle tablePtr, String name ) {
            if ( _CheckLuaDict( L ) ) {
                List<TableHandle> handles = null;
                if ( _DatasetTableHandles.TryGetValue( name, out handles ) ) {
                    if ( handles != null ) {
                        for ( int i = 0; i < handles.Count; ++i ) {
                            var h = handles[ i ];
                            _LuaIntArrayDict.Remove( h );
                            _LuaNumberArrayDict.Remove( h );
                            _LuaIntArray2dDict.Remove( h );
                            _LuaNumberArray2dDict.Remove( h );
                        }
                    }
                    _DatasetTableHandles.Remove( name );
                }
            }
        }

        static bool _CheckLuaDict( LuaStateHandle L ) {
            if ( _CurrentLuaState != L ) {
                _LuaIntArrayDict.Clear();
                _LuaNumberArrayDict.Clear();
                _LuaIntArray2dDict.Clear();
                _LuaNumberArray2dDict.Clear();
                _DatasetTableHandles.Clear();
                _CurrentLuaState = L;
                return false;
            }
            return true;
        }

        static void _AddHandleToDataset( String dataset, TableHandle handle ) {
            if ( !String.IsNullOrEmpty( dataset ) && handle != default( TableHandle ) ) {
                List<TableHandle> r = null;
                if ( !_DatasetTableHandles.TryGetValue( dataset, out r ) ) {
                    r = new List<TableHandle>();
                    _DatasetTableHandles.Add( dataset, r );
                }
                r.Add( handle );
            }
        }

        static TArray<int> _ToUnique( LuaStateHandle L, TableHandle handle, TArray<int> array, String tag ) {
            if ( handle == default( TableHandle ) ) {
                return _EmptyTArrayI;
            }
            if ( String.IsNullOrEmpty( tag ) ) {
                return array;
            }
            _CheckLuaDict( L );
            TArray<int> o = null;
            if ( _LuaIntArrayDict.TryGetValue( handle, out o ) ) {
                array = o;
            } else if ( array != null ) {
                _LuaIntArrayDict.Add( handle, array );
                _AddHandleToDataset( tag, handle );
            }
            return array;
        }

        static TArray<TArray<int>> _ToUnique( LuaStateHandle L, TableHandle handle, TArray<TArray<int>> array, String tag ) {
            if ( handle == default( TableHandle ) ) {
                return _EmptyTArrayI2d;
            }
            if ( String.IsNullOrEmpty( tag ) ) {
                return array;
            }
            _CheckLuaDict( L );
            TArray<TArray<int>> o = null;
            if ( _LuaIntArray2dDict.TryGetValue( handle, out o ) ) {
                array = o;
            } else if ( array != null ) {
                _LuaIntArray2dDict.Add( handle, array );
                _AddHandleToDataset( tag, handle );
            }
            return array;
        }

        static TArray<double> _ToUnique( LuaStateHandle L, TableHandle handle, TArray<double> array, String tag ) {
            if ( handle == default( TableHandle ) ) {
                return _EmptyTArrayN;
            }
            if ( String.IsNullOrEmpty( tag ) ) {
                return array;
            }
            _CheckLuaDict( L );
            TArray<double> o = null;
            if ( _LuaNumberArrayDict.TryGetValue( handle, out o ) ) {
                array = o;
            } else if ( array != null ) {
                _LuaNumberArrayDict.Add( handle, array );
                _AddHandleToDataset( tag, handle );
            }
            return array;
        }

        static TArray<TArray<double>> _ToUnique( LuaStateHandle L, TableHandle handle, TArray<TArray<double>> array, String tag ) {
            if ( handle == default( TableHandle ) ) {
                return _EmptyTArrayN2d;
            }
            if ( String.IsNullOrEmpty( tag ) ) {
                return array;
            }
            _CheckLuaDict( L );
            TArray<TArray<double>> o = null;
            if ( _LuaNumberArray2dDict.TryGetValue( handle, out o ) ) {
                array = o;
            } else if ( array != null ) {
                _LuaNumberArray2dDict.Add( handle, array );
                _AddHandleToDataset( tag, handle );
            }
            return array;
        }

        static TArray<int> _TryGet_I( LuaStateHandle L, TableHandle handle, String tag ) {
            if ( !_CheckLuaDict( L ) || String.IsNullOrEmpty( tag ) ) {
                return null;
            }
            TArray<int> o = null;
            if ( _LuaIntArrayDict.TryGetValue( handle, out o ) ) {
                return o;
            }
            return null;
        }

        static TArray<TArray<int>> _TryGet_I2d( LuaStateHandle L, TableHandle handle, String tag ) {
            if ( !_CheckLuaDict( L ) || String.IsNullOrEmpty( tag ) ) {
                return null;
            }
            TArray<TArray<int>> o = null;
            if ( _LuaIntArray2dDict.TryGetValue( handle, out o ) ) {
                return o;
            }
            return null;
        }

        static TArray<double> _TryGet_N( LuaStateHandle L, TableHandle handle, String tag ) {
            if ( !_CheckLuaDict( L ) || String.IsNullOrEmpty( tag ) ) {
                return null;
            }
            TArray<double> o = null;
            if ( _LuaNumberArrayDict.TryGetValue( handle, out o ) ) {
                return o;
            }
            return null;
        }

        static TArray<TArray<double>> _TryGet_N2d( LuaStateHandle L, TableHandle handle, String tag ) {
            if ( !_CheckLuaDict( L ) || String.IsNullOrEmpty( tag ) ) {
                return null;
            }
            TArray<TArray<double>> o = null;
            if ( _LuaNumberArray2dDict.TryGetValue( handle, out o ) ) {
                return o;
            }
            return null;
        }

        static TArray<int> _LoadIntArray( NLuaState L, int index, String tag ) {
            int[] ret = null;
            int top = L.GetTop();
            TableHandle handle = default( TableHandle );
            try {
                if ( L.IsTable( index ) ) {
                    handle = ( TableHandle )L.ToObject( index );
                    var o = _TryGet_I( L, handle, tag );
                    if ( o != null ) {
                        return o;
                    }
                    var len = L.RawLen( index );
                    ret = new int[ len ];
                    for ( int i = 0; i < len; ++i ) {
                        L.RawGetI( -1, i + 1 );
                        switch ( L.Type( -1 ) ) {
                        case LuaType.LUA_TBOOLEAN:
                            ret[ i ] = L.ToBoolean( -1 ) ? 1 : 0;
                            break;
                        case LuaType.LUA_TNUMBER:
                            ret[ i ] = L.ToInteger( -1 );
                            break;
                        case LuaType.LUA_TSTRING:
                            if ( !int.TryParse( L.ToString( -1 ), out ret[ i ] ) ) {
                                ret[ i ] = 0;
                            }
                            break;
                        default:
                            ret[ i ] = 0;
                            break;
                        }
                        L.Pop( 1 );
                    }
                } else {
                    ret = null;
                }
            } finally {
                L.SetTop( top );
            }
            return _ToUnique( L, handle, new TArray<int>( ret, true ), tag );
        }

        static TArray<TArray<int>> _LoadIntArray2d( NLuaState L, int index, String tag ) {
            TArray<int>[] ret = null;
            int top = L.GetTop();
            TableHandle handle = default( TableHandle );
            try {
                if ( L.IsTable( index ) ) {
                    handle = ( TableHandle )L.ToObject( index );
                    var o = _TryGet_I2d( L, handle, tag );
                    if ( o != null ) {
                        return o;
                    }
                    var len = L.RawLen( index );
                    ret = new TArray<int>[ len ];
                    for ( int i = 0; i < len; ++i ) {
                        L.RawGetI( -1, i + 1 );
                        if ( L.IsTable( -1 ) ) {
                            ret[ i ] = _LoadIntArray( L, -1, tag );
                        } else {
                            ret[ i ] = null;
                        }
                        L.Pop( 1 );
                    }
                } else {
                    ret = null;
                }
            } finally {
                L.SetTop( top );
            }
            return _ToUnique( L, handle, new TArray<TArray<int>>( ret, true ), tag );
        }

        static TArray<TArray<double>> _LoadNumberArray2d( NLuaState L, int index, String tag ) {
            TArray<double>[] ret = null;
            int top = L.GetTop();
            TableHandle handle = default( TableHandle );
            try {
                if ( L.IsTable( index ) ) {
                    handle = ( TableHandle )L.ToObject( index );
                    var o = _TryGet_N2d( L, handle, tag );
                    if ( o != null ) {
                        return o;
                    }
                    var len = L.RawLen( index );
                    ret = new TArray<double>[ len ];
                    for ( int i = 0; i < len; ++i ) {
                        L.RawGetI( -1, i + 1 );
                        if ( L.IsTable( -1 ) ) {
                            ret[ i ] = _LoadNumberArray( L, -1, tag );
                        } else {
                            ret[ i ] = null;
                        }
                        L.Pop( 1 );
                    }
                } else {
                    ret = null;
                }
            } finally {
                L.SetTop( top );
            }
            return _ToUnique( L, handle, new TArray<TArray<double>>( ret, true ), tag );
        }

        static TArray<double> _LoadNumberArray( NLuaState L, int index, String tag ) {
            double[] ret = null;
            int top = L.GetTop();
            TableHandle handle = default( TableHandle );
            try {
                if ( L.IsTable( index ) ) {
                    handle = ( TableHandle )L.ToObject( index );
                    var o = _TryGet_N( L, handle, tag );
                    if ( o != null ) {
                        return o;
                    }
                    var len = L.RawLen( index );
                    ret = new double[ len ];
                    for ( int i = 0; i < len; ++i ) {
                        L.RawGetI( -1, i + 1 );
                        switch ( L.Type( -1 ) ) {
                        case LuaType.LUA_TBOOLEAN:
                            ret[ i ] = L.ToBoolean( -1 ) ? 1 : 0;
                            break;
                        case LuaType.LUA_TNUMBER:
                            ret[ i ] = L.ToNumber( -1 );
                            break;
                        case LuaType.LUA_TSTRING:
                            if ( !double.TryParse( L.ToString( -1 ), out ret[ i ] ) ) {
                                ret[ i ] = 0;
                            }
                            break;
                        default:
                            ret[ i ] = 0;
                            break;
                        }
                        L.Pop( 1 );
                    }
                } else {
                    ret = null;
                }
            } finally {
                L.SetTop( top );
            }
            return _ToUnique( L, handle, new TArray<double>( ret, true ), tag );
        }

        public static TArray<int> LoadIntArray( String fieldName, LuaDatabase.Query q ) {
            TArray<int> ret = null;
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                q.GetField( fieldName );
                ret = _LoadIntArray( L, -1, q.tag );
            } finally {
                L.SetTop( top );
            }
            return ret;
        }

        public static TArray<double> LoadNumberArray( String fieldName, LuaDatabase.Query q ) {
            TArray<double> ret = null;
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                q.GetField( fieldName );
                ret = _LoadNumberArray( L, -1, q.tag );
            } finally {
                L.SetTop( top );
            }
            return ret;
        }

        public static TArray<TArray<int>> LoadIntArray2d( String fieldName, LuaDatabase.Query q ) {
            TArray<TArray<int>> ret = null;
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                q.GetField( fieldName );
                ret = _LoadIntArray2d( L, -1, q.tag );
            } finally {
                L.SetTop( top );
            }
            return ret;
        }

        public static TArray<TArray<double>> LoadNumberArray2d( String fieldName, LuaDatabase.Query q ) {
            TArray<TArray<double>> ret = null;
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                q.GetField( fieldName );
                ret = _LoadNumberArray2d( L, -1, q.tag );
            } finally {
                L.SetTop( top );
            }
            return ret;
        }

        [Obsolete( "Please use LoadIntArray/LoadNumberArray instead!" )]
        public static DataTable LoadArray( String fieldName, LuaDatabase.Query q ) {
            DataTable ret = null;
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                q.GetField( fieldName );
                if ( L.IsTable( -1 ) ) {
                    ret = new DataTable();
                    Dataset.ReadLuaArray( L, ret );
                } else {
                    ret = new DataTable();
                }
            } finally {
                L.SetTop( top );
            }
            return ret;
        }

        public static void ReadLuaArray( NLuaState L, DataTable dest ) {
            int top = L.GetTop();
            try {
                _ReadLuaArray( L, dest );
            } catch ( Exception e ) {
                UnityEngine.Debug.LogException( e );
            } finally {
                L.SetTop( top );
            }
        }

        static void _ReadLuaArray( NLuaState L, DataTable dest ) {
            var tableIndex = L.GetTop();
            var size = L.RawLen( tableIndex );
            for ( int i = 0; i < size; ++i ) {
                // lua table index start from 1
                L.RawGetI( tableIndex, i + 1 );
                var type = L.Type( -1 );
                try {
                    switch ( type ) {
                    case LuaType.LUA_TNUMBER: {
                            var n = L.ToNumber( -1 );
                            if ( n == Math.Round( n ) ) {
                                dest.Set( i, ( int )n );
                            } else {
                                dest.Set( i, n );
                            }
                        }
                        break;
                    case LuaType.LUA_TSTRING: {
                            dest.Set( i, L.ToString( -1 ) );
                        }
                        break;
                    case LuaType.LUA_TBOOLEAN: {
                            dest.Set( i, L.ToBoolean( -1 ) );
                        }
                        break;
                    case LuaType.LUA_TTABLE: {
                            var subTable = new DataTable();
                            _ReadLuaArray( L, subTable );
                            dest.Set( i, subTable );
                        }
                        break;
                    }
                } finally {
                    L.Pop( 1 );
                }
            }
        }

        public static System.Object Query( String cmd, Type type ) {
            var db = LuaDatabase.sharedInstance;
            using ( var q = db.CreateQuery( cmd ) ) {
                if ( q.IsTable() ) {
                    System.Object obj = Activator.CreateInstance( type );
                    if ( obj != null ) {
                        var L = db.GetLuaState();
                        var fields = type.GetFields( System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic );
                        for ( int i = 0; i < fields.Length; ++i ) {
                            var fi = fields[ i ];
                            String nameInLua = fi.Name;
                            int m_ = fi.Name.IndexOf( "m_" );
                            if ( m_ != -1 ) {
                                nameInLua = fi.Name.Substring( 2 );
                            }
                            q.GetField( nameInLua );
                            if ( !L.IsNil( -1 ) ) {
                                var value = LuaTinker.ReadObjectAsType( L, fi.FieldType, -1 );
                                if ( value != null ) {
                                    if ( fi.FieldType == typeof( String ) ) {
                                        value = Dataset.DecodeFromUtf8( value as String );
                                    }
                                    fi.SetValue( obj, value );
                                } else {
                                    UDebug.LogError( String.Format( "{0}.{1} not initialized.", type.Name, fi.Name ) );
                                }
                            } else {
                                L.Pop( 1 );
                            }
                        }
                    }
                    return obj;
                }
            }
            return null;
        }

        public static T Query<T>( String cmd ) where T : class {
            return Query( cmd, typeof( T ) ) as T;
        }

        static String _DecodeUTF8FromPtr( IntPtr cstr, int len ) {
            if ( cstr != IntPtr.Zero && len > 0 ) {
                var buf = BlockPool<byte>.sharedInstance.Allocate( len );
                try {
                    Marshal.Copy( cstr, buf, 0, len );
                    return Encoding.UTF8.GetString( buf, 0, len );
                } finally {
                    BlockPool<byte>.sharedInstance.Free( ref buf );
                }
            }
            return String.Empty;
        }

        static String _DecodeUTF8FromPtr( String str ) {
            if ( !String.IsNullOrEmpty( str ) ) {
                var buf = BlockPool<byte>.sharedInstance.Allocate( str.Length );
                try {
                    for ( int i = 0; i < str.Length; ++i ) {
                        buf[ i ] = ( byte )str[ i ];
                    }
                    return Encoding.UTF8.GetString( buf, 0, str.Length );
                } finally {
                    BlockPool<byte>.sharedInstance.Free( ref buf );
                }
            }
            return String.Empty;
        }

        public static String DecodeFromUtf8( String s ) {
            return LocalizeString( s, s.Length );
        }

        public static String DecodeToLocalizedString( LuaDatabase.Query q, String field ) {
#if CACHE_DATABASE_STRING
            uint len = 0;
            var cstr = q.GetStringPtr( field, out len );
            return LocalizeString( cstr, ( int )len );
#else
            var str = q.GetString( field );
            return LocalizeString( str, str.Length );
#endif
        }

        public static String DecodeToDatabaseString( LuaDatabase.Query q, String field ) {
#if CACHE_DATABASE_STRING
            uint len = 0;
            return UniqueString.Intern( q.GetStringPtr( field, out len ), ( int )len );
#else
            return q.GetString( field );
#endif
        }

#if USE_NATIVE_LUA

        public static String DecodeToDatabaseString( LuaDatabase.Query q, byte[] field, int len ) {
#if CACHE_DATABASE_STRING
            uint olen = 0;
            return UniqueString.Intern( q.GetStringPtr( field, out olen, len ), ( int )olen );
#else
            return q.GetString( field, len );
#endif
        }

        public static String DecodeToLocalizedString( LuaDatabase.Query q, byte[] field, int len ) {
#if CACHE_DATABASE_STRING
            uint olen = 0;
            var cstr = q.GetStringPtr( field, out olen, len );
            return LocalizeString( cstr, ( int )olen );
#else
            var str = q.GetString( field, len );
            return LocalizeString( str, str.Length );
#endif
        }
#else

        public static String DecodeToLocalizedString( LuaDatabase.Query q, String field, int dymmy ) {
#if CACHE_DATABASE_STRING
            uint olen = 0;
            var cstr = q.GetStringPtr( field, out olen, dymmy );
            return LocalizeString( cstr, ( int )olen );
#else
            var str = q.GetString( field );
            return LocalizeString( str, str.Length );
#endif
        }

        public static String DecodeToDatabaseString( LuaDatabase.Query q, String field, int dymmy ) {
#if CACHE_DATABASE_STRING
            uint olen = 0;
            return UniqueString.Intern( q.GetStringPtr( field, out olen ), ( int )olen );
#else
            return q.GetString( field );
#endif
        }
#endif
        public static void ClearCacheEx() {
            m_stringBank = null;
        }

        public static long GetTotalMemoryUsed() {
            long size = 0;
#if USE_NATIVE_LUA
            var L = LuaTasker.GetLuaMainThread();
            if ( L != IntPtr.Zero ) {
                LuaTinker.GC( L, LuaTinker.LUA_GC.Collect, 0 );
                var kb = LuaTinker.GC( L, LuaTinker.LUA_GC.Count, 0 );
                var b = LuaTinker.GC( L, LuaTinker.LUA_GC.Countb, 0 );
                size = ( kb << 10 ) + b;
            }
#endif
            return size;
        }
    }
}
