# -*- coding: cp936 -*-
import os, sys
import pysvn
import zipfile
import time
import traceback
import utils

_ServerMapInfoPath = '../../javaServer/GameServer/maps'
_StreamingAssetsPath = '../../Client/Assets/StreamingAssets'
_ClientMapInfoPath = _StreamingAssetsPath + '/MapInfo'
_ClientMinimapInfoPath = _ClientMapInfoPath + '/Minimap'
_ClientPathGridPath = '../../Client/Assets/ToolOutput/PathGrid'
_ClientPathGridPathRunTime = _StreamingAssetsPath + '/PathGridRunTime'
_ToolOutputForServer = '../../Client/Assets/ToolOutput/ForServer'

def checkInMapInfo():
    succeeded = False
    try:
        svn = pysvn.Client()
        print( 'update %s' % _ServerMapInfoPath )
        svn.update( _ServerMapInfoPath )
        
        print( 'update %s' % _ClientMapInfoPath )
        svn.update( _ClientMapInfoPath )
        
        print( 'update %s' % _ToolOutputForServer )
        svn.update( _ToolOutputForServer )
        
        cmd = 'call ExportMapsForServer.bat'
        os.system( cmd )
        
        print( 'commit %s' % _ServerMapInfoPath )
        svn.checkin( _ServerMapInfoPath, 'PythonTool: commit map-info for server' )

        print( 'commit %s' % _ClientMapInfoPath )
        svn.checkin( _ClientMapInfoPath, 'PythonTool: commit map-info for client' )

        print( 'commit %s' % _ClientMinimapInfoPath )
        svn.checkin( _ClientMinimapInfoPath, 'PythonTool: commit minimap-info for client' )

        print( 'commit %s' % _ClientPathGridPath )
        svn.checkin( _ClientPathGridPath, 'PythonTool: commit path-grid for client' )

        print( 'commit %s' % _ClientPathGridPathRunTime )
        svn.checkin( _ClientPathGridPathRunTime, 'PythonTool: commit path-grid RunTime for client' )
        
        if utils.queryYesNo( 'Upload to SVN Server?' ):
            print( 'commit %s' % _ToolOutputForServer )
            if utils.queryYesNo( 'Do you want to add a SVN log?' ):
                print( 'please add a svn log:' )
                msg = raw_input()
                utils.svnCheckInAll( svn, _ToolOutputForServer, False, msg )
                utils.svnCheckInAll( svn, _ServerMapInfoPath,  False, msg )
                utils.svnCheckInAll( svn, _ClientMapInfoPath,  False, msg )
                utils.svnCheckInAll( svn, _ClientMinimapInfoPath,  False, msg )
                utils.svnCheckInAll( svn, _ClientPathGridPath,  False, msg )
                utils.svnCheckInAll( svn, _ClientPathGridPathRunTime,  False, msg )
            else:
                utils.svnCheckInAll( svn, _ToolOutputForServer )
                utils.svnCheckInAll( svn, _ServerMapInfoPath )
                utils.svnCheckInAll( svn, _ClientMapInfoPath )
                utils.svnCheckInAll( svn, _ClientMinimapInfoPath )
                utils.svnCheckInAll( svn, _ClientPathGridPath )
                utils.svnCheckInAll( svn, _ClientPathGridPathRunTime )
        succeeded = True
    except e:
        print( 'error:' + e )
    if succeeded:
        raw_input( "all succeeded! press any key to exit." )
    else:
        raw_input( "press any key to abort." )
if __name__ == '__main__':
    checkInMapInfo()
   
    




