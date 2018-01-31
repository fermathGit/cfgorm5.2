import os, sys
import pysvn
import argparse
import utils
import time

def commit( pathList ):
    svn = pysvn.Client()
    hasError = False
    for path in pathList:
        logMsg = 'PythonTool: commit %s with SvnCommit.py' % path
        try:
            if os.path.isdir( path ):
                print( 'commit dir: %s' % path )
                if not utils.svnCheckInAll( svn, path, ask = True, msg = logMsg ):
                    hasError = True
            elif os.path.isfile( path ):
                print( 'commit file: %s' % path )
                svn.checkin( path, logMsg )
            else:
                print( '%s is not a file or directory' % path )
        except Exception as e:
            hasError = True
            print( e )
    #if hasError:
    #    os.system( 'pause' )
    #else:
    time.sleep( 1 )
    print( 'ok.' )
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser( description = 'commit one file or directory' )
    parser.add_argument( '-path', metavar = 'path', type = str, nargs = '+',
                       help = 'target files or dirs to commit' )
    args = parser.parse_args()
    commit( args.path )
    
