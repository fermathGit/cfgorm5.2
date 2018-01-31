#! /usr/bin/env python
#coding=utf-8
import pysvn
import os, sys
import codecs
import utils

_ClientAssetsPath = 'L:/Tool/test'

list_conflict_files = []


def conflicted(fileName):
    #version 1  
    if os.path.isfile(fileName + '.mine'):
        return True
    else:
        return False;

def checkMetaFiles():
    print( '\nStart check all mate files in %s and upload to SVN server ...' % _ClientAssetsPath )
    svn = pysvn.Client()
    svn.update(_ClientAssetsPath);
    for ( path, dirs, files ) in os.walk( _ClientAssetsPath ):
        for file in files:
            filePath = os.path.join(path, file)
            if not filePath.endswith( '.meta' ):
                fpath = filePath.decode( 'gbk' ).encode( 'utf-8' )
                fpath = fpath.replace( '\\', '/' )
                try:
                    all_status = svn.status( fpath, recurse = False, update = False )
                except:
                    print( '\n Check this file in SVN server Failed %s , Ignore This File ' % filePath )
                    if os.path.isfile(filePath + '.meta'):
                        print( '\n Delete mate file %s' % (filePath + '.meta') )
                        os.remove(filePath + '.meta')
                    continue
                if conflicted(filePath):
                    list_conflict_files.append(filePath)
                    continue
                for status in all_status:                    
                    if status.is_versioned:
                        metaFilePath = filePath + '.meta'
                        metaPathUtf = metaFilePath.decode( 'gbk' ).encode( 'utf-8' )
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
                                    #print( 'commit %s' % metaFilePath )
                                    svn.checkin( metaPath, 'PythonTool: Commite meta files for client' )
                    else:
                        print( '\n Cant find this file in SVN server %s , Ignore This File ' % filePath )
                        if os.path.isfile(filePath + '.meta'):
                            print( '\n Delete mate file %s' % (filePath + '.meta') )
                            os.remove(filePath + '.meta')
    print('\nCommit completed')
    #print Conflicted names
    if len(list_conflict_files) > 0 :
        for name in list_conflict_files:
            print('\n File Conflicted : %s' % name)
    
    
if __name__ == '__main__':
    checkMetaFiles()
    print('\nCheckMetaFiles End ...')
    os.system( 'pause' )