# -*- coding: cp936 -*-
import os, sys
import pysvn
import zipfile
import time
import traceback
import utils

_ClientPath = '../../Client'
_ClientExcelDataBasePath = '../../Gamedata/Config'
_ReadExcelBuilderPath = '../../Tool/_Gadgets'
_ReadExcelWriteLuaFileName = 'ExportExcleData.bat'
_ClientStreamingAssetsPath = '../../Client/Assets/StreamingAssets'
_ClientLuaDataBasePath = '../../Client/Assets/StreamingAssets/Database'
_ClientTextDefPath = '../../Client/Assets/Code/Localization/TextDef.cs'
_CSDatabaseReaderPath = '../../Client/Assets/Code/Database'
_LuaToolRootPath = '../../Client/Assets/StreamingAssets/LuaRoot'
_CSReaderForLuaExporter = '../../Client/Assets/StreamingAssets/LuaRoot/DatabaseExporter.lua'
_JavaConfigGenPath = '../../javaServer/Tools'
_ServerJavaDataBasePath = '../../javaServer/'


def checkInDir( svn, dir ):
    for ( path, dirs, files ) in os.walk( dir ):
       for file in files:
            filePath = os.path.join( path, file )
            filePathUTF8 = filePath.decode( 'gbk' ).encode('utf-8')
            filePathUTF8 = filePathUTF8.replace('\\', '/')
            try:
                all_status = svn.status( filePathUTF8, recurse = False, update = False )
            except:
                continue
            for status in all_status:
               if status.entry is None:
                   if not filePath.endswith( '.luac' ) and not filePath.endswith( '.luac.meta' ) :
                        print( 'add file: %s' % filePath )
                        try:
                            svn.add( filePath )
                        except Exception as e:
                            print( e )

def checkInLuaDataBase():
    svn = pysvn.Client()

    if utils.queryYesNo('Upload to SVN Server ?'):
        print( 'update %s' % _LuaToolRootPath )
        svn.update( _LuaToolRootPath )
    
        print( 'commit %s' % _ClientExcelDataBasePath )
        checkInDir( svn, _ClientExcelDataBasePath )
        svn.checkin( _ClientExcelDataBasePath, 'PythonTool: upload Excel data' )
        
        print( 'commit %s' % _ClientLuaDataBasePath )
        checkInDir( svn, _ClientLuaDataBasePath )
        svn.checkin( _ClientLuaDataBasePath, 'PythonTool: upload Lua data' )

        print( 'commit %s' % _ClientTextDefPath )
        svn.checkin( _ClientTextDefPath, 'PythonTool: text def source code' )

        print( 'commit %s' % _CSDatabaseReaderPath )
        svn.checkin( _CSDatabaseReaderPath, 'PythonTool: database reader for csharp' )
        
        print( 'commit %s' % _ServerJavaDataBasePath )
        svn.checkin( _ServerJavaDataBasePath, 'PythonTool: upload server config' )
    
    print( 'ok.' )

if __name__ == '__main__':
    checkInLuaDataBase()






