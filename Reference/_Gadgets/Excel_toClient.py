# -*- coding: cp936 -*-
import os, sys
import pysvn
import zipfile
import time
import traceback
import utils

_ClientPath = '../../Client'
_ClientExcelDataBasePath = '../../Gamedata/Config'
_ClientExcelDataBasePathEx = '../../Gamedata/ConfigEx'
_ReadExcelBuilderPath = '../../Tool/_Gadgets'
_ReadExcelWriteLuaFileName = 'ExportExcleData.bat'
_ClientStreamingAssetsPath = '../../Client/Assets/StreamingAssets'
_ClientLuaDataBasePath = '../../Client/Assets/StreamingAssets/Database'
_ClientTextDefPath = '../../Client/Assets/Code/Localization/TextDef.cs'
_CSDatabaseReaderPath = '../../Client/Assets/Code/Database'
_LuaToolRootPath = '../../Client/Assets/StreamingAssets/LuaRoot'
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

def queryArea():
    question = '请选择导出地区：（回车默认国内配置）\r\n\
        1 --->　( China )大陆\r\n\
        2 --->　( Taiwan )台湾\r\n\
        3 --->　( SG_MY_TH )新马泰\r\n\
        4 --->　( Thailand )泰国\r\n\
        5 --->　( Russian )俄罗斯\r\n\
        6 --->　( Korea )韩国\n\
        7 --->　( Japan )日本\r\n\
        8 --->　( USA )欧美,区分新马English\r\n\
        9 --->   ( Vietnam )越南\r\n\
        10 --->   ( Brand )版署\r\n'
    while True:
        #questionGBK = question.decode( 'ascii' ).encode( 'gbk' )
        sys.stdout.write( question  )
        ch = raw_input().lower()
        if ch == '' or ch == '1':
            return 'China'#'#1 --->　大陆
        elif ch == '2':
            return 'Taiwan'#'#1 --->　台湾
        elif ch == '3':
            return 'SG_MY_TH'#'#1 --->　新马泰
        elif ch == '4':
            return 'Thailand'#,    // --->　泰文
        elif ch == '5':
            return 'Russian'#,    // --->　俄文
        elif ch == '6':
            return 'Korea'#,    // --->　韩文
        elif ch == '7':
            return 'Japan'#,    // --->　日文
        elif ch == '8':
            return 'USA'#,    // --->　欧美,区分新马English
        elif ch == '9':
            return 'Vietnam'#, //--->   越南
        elif ch == '10':
            return 'Brand'# //--->   版署
        else:
            sys.stdout.write( 'Please input 1-10 ' )

def localizeConfig( area ):
    print ( 'Localize config to: ' + area )
    #prepare config
    dest = _ClientExcelDataBasePath + '/../' + area
    dest = os.path.abspath( os.getcwd() + os.sep + dest )
    if os.path.exists(dest):
        print ('remove dir: %s' % ( dest ))
        os.system ('rmdir /s /q %s' % ( dest ))

    print ('mkdir: %s' % ( dest ))
    os.system ('mkdir %s' % ( dest ))
    
    #copy all config
    src = os.path.abspath( os.getcwd() + os.sep +_ClientExcelDataBasePath)
    print ('coppy file: %s to %s' % ( src, dest ))
    os.system ("xcopy /r/y %s %s" % (src, dest))

    #for file in os.listdir(src):
    #    file = src + '/' + file
    #    if os.path.isfile(file):
    #        print ('coppy file: %s to %s' % ( file, dest ))
    #        os.system ("xcopy /r/y %s %s" % (file, dest))
    #    else:
    #        print ('path is not a file: ' + file)
            
    #copy diff config
    src = os.path.abspath( os.getcwd() + os.sep + _ClientExcelDataBasePathEx + os.sep + area );
        
    if os.path.exists(src):
        print ('coppy file: %s to %s' % ( src, dest ))
        os.system ("xcopy /r/y %s %s" % (src, dest))
        return True
    else:
        print ('Dir not found ' + src)
        return False

def checkInLuaDataBase():
    area = queryArea()
    if not localizeConfig( area ):
        if not utils.queryYesNo('Localize failed, continue ? '):
            return 0

    if utils.pushd( _ReadExcelBuilderPath ):
        cmd = 'call ' + _ReadExcelWriteLuaFileName + ' ' + area
        os.system( cmd )
        utils.popd()

    dest = _ClientExcelDataBasePath + '/../' + area
    dest = os.path.abspath( os.getcwd() + os.sep + dest )
    if os.path.exists(dest):
        print ('remove dir: %s' % ( dest ))
        os.system ('rmdir /s /q %s' % ( dest ))

    print( 'export lua reader for cs' )
    clientPath = os.path.abspath( os.getcwd() + os.sep + _ClientPath )
    os.system( 'lua ' + _CSReaderForLuaExporter + ' \"' + clientPath + '\"' + ' ' + area)

if __name__ == '__main__':
    checkInLuaDataBase()






