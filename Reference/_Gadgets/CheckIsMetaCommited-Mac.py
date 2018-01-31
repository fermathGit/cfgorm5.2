#! /usr/bin/env python
#coding=utf-8
import pysvn
import os, sys
import codecs
import utils

_ClientAssetsPath = 'L:/Client/Assets'

list_conflict_files = []


def conflicted(fileName):
    #version 1  
    if os.path.isfile(fileName + '.mine'):
        return True;
    else:
        return False;
    
def get_login( realm, username, may_save ):
    return True, 'lujian', 'lujian', True;

def preConfig():
    g_control_deleteMate = False
    g_control_commiteMate = False
    g_control_showConflict = False
    
    if(utils.queryYesNo('\nDelete meta file when Source file unversioned in SVN ?\n')):
        g_control_deleteMate = True
    else:
        g_control_deleteMate = False
        
    if(utils.queryYesNo('\nCommite meta file when Source file versioned in SVN ?\n')):
        g_control_commiteMate = True
    else:
        g_control_commiteMate = False
        
    if(utils.queryYesNo('\nShow all Conflict files ?\n')):
        g_control_showConflict = True
    else:
        g_control_showConflict = False
    
    return g_control_deleteMate, g_control_commiteMate, g_control_showConflict

def checkMetaFiles():
    g_control_deleteMate = False
    g_control_commiteMate = False
    g_control_showConflict = False
    g_control_deleteMate, g_control_commiteMate, g_control_showConflict = preConfig()
    print( '\nStart check all mate files in %s and upload to SVN server ...' % _ClientAssetsPath )
    svn = pysvn.Client()
    svn.callback_get_login = get_login
    svn.update(_ClientAssetsPath)
    for ( path, dirs, files ) in os.walk( _ClientAssetsPath ):
        for file in files:
            filePath = os.path.join(path, file)
            if not filePath.endswith( '.meta' ):
                fpath = ''
                # try trans filePath encoding
                try:
                    fpath = filePath.decode( 'gbk' ).encode( 'utf-8' )
                except:
                     fpath = filePath   
                fpath = fpath.replace( '\\', '/' )
                # try get file status from Server
                try:
                    all_status = svn.status( fpath, recurse = False, update = False )
                except:
                    print( '\n Check this file in SVN server Failed %s , Ignore This File ' % filePath )
                    if (g_control_deleteMate) and (os.path.isfile(filePath + '.meta')):
                        print( '\n Delete mate file %s' % (filePath + '.meta') )
                        os.remove(filePath + '.meta')
                    continue
                if (g_control_showConflict) and conflicted(filePath):
                    list_conflict_files.append(filePath)
                    continue
                for status in all_status:                    
                    if (status.is_versioned) or (not status.entry is None):
                        metaFilePath = filePath + '.meta'
                        metaPathUtf = ''
                        try:
                            metaPathUtf = metaFilePath.decode( 'gbk' ).encode( 'utf-8' )
                        except:
                            metaPathUtf = metaFilePath   
                        metaPathUtf = metaPathUtf.replace( '\\', '/' )
                        if os.path.isfile( metaFilePath ):
                            try:
                                metaAllStatus = svn.status( metaPathUtf, recurse = False, update = False )
                            except:
                                continue
                            for metaStatus in metaAllStatus:
                                metaPath = metaPathUtf.decode( 'utf-8' )
                                if metaStatus.entry is None:
                                    print( '\n add file: %s' % metaFilePath )
                                    svn.add( metaPath )
                                    print( ' commit %s' % metaFilePath )
                                    svn.checkin( metaPath, 'PythonTool: Commite meta files for client' )
                                else:
                                    if(g_control_commiteMate):
                                        print( 'commit %s' % metaFilePath )
                                        svn.checkin( metaPath, 'PythonTool: Commite meta files for client' )
                    else:
                        print( '\n Cant find this file in SVN server %s , Ignore This File ' % filePath )
                        if (g_control_deleteMate) and (os.path.isfile(filePath + '.meta')):
                            print( '\n Delete mate file %s' % (filePath + '.meta') )
                            os.remove(filePath + '.meta')
    print('\nCommit completed')
    #print Conflicted names
    if len(list_conflict_files) > 0 :
        for name in list_conflict_files:
            print('\n File Conflicted : %s' % name)
    
    
if __name__ == '__main__':
    checkMetaFiles()
    print('\nCheckMetaFiles End ... \n')
