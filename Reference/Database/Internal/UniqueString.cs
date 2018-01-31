using System;
using System.Collections.Generic;
using System.Reflection;
using System.Linq;
using System.Text;

namespace Database {

    public static class UniqueString {

        class _EqualityComparer : IEqualityComparer<String> {
            // x: C# string
            // y: C string
            public unsafe bool Equals( String x, String y ) {
                var c = 0;
                fixed ( char* _x = x, _y = y ) {
                    var px = _x;
                    var py = _y;
                    var xlen = x.Length;
                    var ylen = y.Length;
                    for ( int i = 0, j = 0; i < xlen && *py != '\0' && *px != '\0' && j < ylen; ++i, ++j ) {
                        if ( *px != *py ) {
                            break;
                        }
                        ++c;
                        ++px;
                        ++py;
                    }
                }
                return c == x.Length;
            }
            public unsafe int GetHashCode( String obj ) {
                var val = 0;
                var index = 0;
                var len = obj.Length;
                fixed ( char* _p = obj ) {
                    var p = _p;
                    while ( *p != 0 && index < len ) {
                        val += ( *p++ ) * 193951;
                        val *= 399283;
                        ++index;
                    }
                }
                return val;
            }
        }

        static String _temp_string = new String( '\0', 256 );
        static Common.Collections.Generic.Dictionary<string, string> _strings = new Common.Collections.Generic.Dictionary<String, string>( 256, new _EqualityComparer() );

        static unsafe String _TempStr( IntPtr cstr, int len ) {
            if ( cstr != IntPtr.Zero && len > 0 ) {
                if ( len >= _temp_string.Length ) {
                    var size = MathLib.CeilPowerOfTwo( len + 1 );
                    _temp_string = new String( '?', size );
                }
                fixed ( char* _dst = _temp_string ) {
                    var dst = _dst;
                    byte* src = ( byte* )cstr;
                    while ( *src != 0 ) {
                        *dst++ = ( char )( *src++ );
                    }
                    *dst = '\0';
                }
                return _temp_string;
            } else {
                return String.Empty;
            }
        }

        public unsafe static String Intern( IntPtr cstr, int len ) {
            var _o = String.Empty;
            if ( cstr != IntPtr.Zero && len > 0 ) {
                String str = _TempStr( cstr, len );
                if ( !_strings.TryGetValue( str, out _o ) ) {
                    // convert to managed string
                    _o = new String( ( sbyte* )cstr, 0, len );
                    _strings.Add( _o, _o );
                }
            }
            return _o;
        }

        public static String Intern( String str, int len ) {
            var _o = String.Empty;
            if ( !_strings.TryGetValue( str, out _o ) ) {
                _o = str;
                _strings.Add( str, str );
            }
            return _o;
        }

        public static bool IsInterned( String str ) {
            return _strings.ContainsKey( str );
        }

        public static void Clear() {
            _strings.Clear();
        }
    }
}
