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
_CSReaderForLuaExporter = '../../Client/Assets/StreamingAssets/LuaRoot/DatabaseExporter.lua'
_JavaConfigGenPath = '../../javaServer/Tools'
_ServerJavaDataBasePath = '../../javaServer/GameServer/script/config'
_ServerJavaDataBasePath2 = '../../javaServer/GameServer/src/com/data'

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
   
    print( 'update %s' % _ClientExcelDataBasePath )
    svn.update( _ClientExcelDataBasePath )

    print( 'update %s' % _ClientLuaDataBasePath )
    svn.update( _ClientLuaDataBasePath )
    
    print( 'update %s' % _ClientTextDefPath )
    svn.update( _ClientTextDefPath )

    print( 'update %s' % _CSDatabaseReaderPath )
    svn.update( _CSDatabaseReaderPath )

    print( 'update %s' % _ServerJavaDataBasePath )
    svn.update( _ServerJavaDataBasePath )
    
    print( 'update %s' % _ServerJavaDataBasePath2 )
    svn.update( _ServerJavaDataBasePath2 )
    
    print( 'ok.' )

if __name__ == '__main__':
    checkInLuaDataBase()






