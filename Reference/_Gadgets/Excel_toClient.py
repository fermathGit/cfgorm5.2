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
    question = '��ѡ�񵼳����������س�Ĭ�Ϲ������ã�\r\n\
        1 --->��( China )��½\r\n\
        2 --->��( Taiwan )̨��\r\n\
        3 --->��( SG_MY_TH )����̩\r\n\
        4 --->��( Thailand )̩��\r\n\
        5 --->��( Russian )����˹\r\n\
        6 --->��( Korea )����\n\
        7 --->��( Japan )�ձ�\r\n\
        8 --->��( USA )ŷ��,��������English\r\n\
        9 --->   ( Vietnam )Խ��\r\n\
        10 --->   ( Brand )����\r\n'
    while True:
        #questionGBK = question.decode( 'ascii' ).encode( 'gbk' )
        sys.stdout.write( question  )
        ch = raw_input().lower()
        if ch == '' or ch == '1':
            return 'China'#'#1 --->����½
        elif ch == '2':
            return 'Taiwan'#'#1 --->��̨��
        elif ch == '3':
            return 'SG_MY_TH'#'#1 --->������̩
        elif ch == '4':
            return 'Thailand'#,    // --->��̩��
        elif ch == '5':
            return 'Russian'#,    // --->������
        elif ch == '6':
            return 'Korea'#,    // --->������
        elif ch == '7':
            return 'Japan'#,    // --->������
        elif ch == '8':
            return 'USA'#,    // --->��ŷ��,��������English
        elif ch == '9':
            return 'Vietnam'#, //--->   Խ��
        elif ch == '10':
            return 'Brand'# //--->   ����
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






