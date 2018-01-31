import os, sys
import pysvn
import argparse
import httplib
import urllib  

if __name__ == '__main__':
    parser = argparse.ArgumentParser( description = 'update one file or directory' )
    parser.add_argument( '-path', metavar = 'path', type = str, nargs = '+',
                       help = 'target files or dirs to update' )
    args = parser.parse_args()
    svn = pysvn.Client()
    for path in args.path:
        try:
            if os.path.isdir( path ):
                print( 'update dir: %s' % path )
                svn.update( path )
            elif os.path.isfile( path ):
                print( 'update file: %s' % path )
                svn.update( path )
            else:
                print( '%s is not a file or directory' % path )
        except Exception as e:
            print( e )






