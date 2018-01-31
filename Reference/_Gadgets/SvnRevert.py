import os, sys
import pysvn
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser( description = 'revert one file or directory' )
    parser.add_argument( '-path', metavar = 'path', type = str, nargs = '+',
                       help = 'target files or dirs to revert' )
    args = parser.parse_args()
    svn = pysvn.Client()
    for path in args.path:
        try:
            if os.path.isdir( path ):
                print( 'revert dir: %s' % path )
                svn.revert( path, recurse = True )
            elif os.path.isfile( path ):
                print( 'revert file: %s' % path )
                svn.revert( path )
            else:
                print( '%s is not a file or directory' % path )
        except Exception as e:
            print( e )







