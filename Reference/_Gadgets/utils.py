# coding=utf-8
import os
import sys
import codecs
import traceback
import pysvn
import zipfile
import hashlib
import locale

_DirectoryStack = [ os.path.realpath( os.curdir ) ]

def setlocale():
    language_code, encoding = locale.getdefaultlocale()
    if language_code is None:
        language_code = 'en_GB'
    if encoding is None:
        encoding = 'UTF-8'
    if encoding.lower() == 'utf':
        encoding = 'UTF-8'
    print( 'setlocale %s.%s' % ( language_code, encoding ) )
    locale.setlocale( locale.LC_ALL, '%s.%s' % ( language_code, encoding ) )

def svnCheckInAll( svn, folder, ask = False, msg = None ):
    succeeded = True
    for ( path, dirs, files ) in os.walk( folder ):
        for dir in dirs:
            dirPath = os.path.join( path, dir )
            dirPath = dirPath.replace( '\\', '/' )
            #print( dirPath )
            try:
                all_status = svn.status( dirPath, recurse = False, update = False )
                for status in all_status:
                    if not status.is_versioned:
                        #add = False
                        #if ask:
                        #    if queryYesNo( 'Upload %s to SVN Server ?' % dirPath ):
                        #        add = True
                        #if add:    
                            print( 'add folder: %s' % dirPath )
                            svn.add( dirPath )
            except Exception as e:
                print( e )
                succeeded = False
                continue
    for ( path, dirs, files ) in os.walk( folder ):
        #print( path )
        for file in files:
            file = file.replace( '\\', '/' )
            filePath = os.path.join( path, file )
            filePath = filePath.replace( '\\', '/' )
            try:
                all_status = svn.status( filePath, recurse = False, update = False )
                for status in all_status:
                    if not status.is_versioned:
                        #add = False                    
                        #if ask:
                        #    if queryYesNo( 'Upload %s to SVN Server ?' % filePath ):
                        #        add = True
                        #if add:
                            print( 'add file: %s' % filePath )
                            svn.add( filePath )
            except Exception as e:
                print( e )
                succeeded = False
                continue
    try:
        svn.checkin( folder, msg if msg != None else 'PythonTool: commit tool-output for server' )
    except Exception as e:
        print( e )
        succeeded = False
    return succeeded

def queryYesNo( question ):
    prompt = " [y/n] "
    while True:
        questionGBK = question.decode( 'utf-8' ).encode( 'gbk' )
        sys.stdout.write( questionGBK + prompt )
        choice = raw_input().lower()
        if choice == 'y':
            return True
        elif choice == 'n':
            return False
        else:
            sys.stdout.write( 'Please Respond with y or n' )

def deleteDir( src ):
    if os.path.isfile( src ):
        try:
            os.remove( src )
        except:
            pass
    elif os.path.isdir( src ):
        for item in os.listdir( src ):
            itemsrc = os.path.join( src, item )
            deleteDir( itemsrc )
        try:
            os.rmdir( src )
        except:
            pass

def mkdir( name, new = False ):
    while True:
        try:
            if not os.path.isdir( name ):
                os.mkdir( name )
            elif new:
                deleteDir( name )
                os.mkdir( name )
            break
        except e:
            print( 'mkdir error:' + e )
            continue

def pushd( dir, debug = False ):
    global _DirectoryStack
    curdir = os.path.realpath( os.curdir )
    rdir = os.path.realpath( dir )
    _DirectoryStack.append( curdir )
    os.chdir( rdir )
    ret = True if os.path.realpath( os.curdir ) == rdir else False
    if debug and ret:
       print( 'Current directory is:', rdir )
    return ret

def popd():
    global _DirectoryStack
    if len( _DirectoryStack ) > 0:
        os.chdir( _DirectoryStack.pop() )

def printCurDir():
    print( os.path.realpath( os.curdir ) )
    
def pmain( func ):
    oldDir = os.path.realpath( os.curdir )
    try:
        func()
    except:
        print( 'pmain call error!' )
        traceback.print_exc()
    os.chdir( oldDir )

def pmain1( func, arg ):
    oldDir = os.path.realpath( os.curdir )
    try:
        func( arg )
    except:
        print( 'pmain call error!' )
        traceback.print_exc()
    os.chdir( oldDir )

def cast2SvnVer( ver ):
    if isinstance( ver, str ) or isinstance( ver, unicode ):
        ver = ver.lower()
        if ver == 'head' or len( ver ) == 0:
            return pysvn.Revision( pysvn.opt_revision_kind.head )
        else:
            return pysvn.Revision( pysvn.opt_revision_kind.number, int( ver ) )
    elif isinstance( ver, int ):
        return pysvn.Revision( pysvn.opt_revision_kind.number, int( ver ) )
    else:
        return pysvn.Revision( pysvn.opt_revision_kind.unspecified )

def readline( filePath ):
    try:
        f = open( filePath, 'r' )
        ln = f.readline()
    except IOError as e:
        print >> sys.stderr, 'File could not be opened:', e
    f.close()
    return ln

def zipDir( dirname, zipfilename ):  
    filelist = []
    if os.path.isfile( dirname ):
        filelist.append( dirname )  
    else :
        for root, dirs, files in os.walk( dirname ):
            for name in files:
                filelist.append( os.path.join( root, name ) )
    zf = zipfile.ZipFile( zipfilename, "w", zipfile.zlib.DEFLATED )
    for tar in filelist:  
        arcname = tar[ len( dirname ):]
        zf.write( tar, arcname )
    zf.close()  

def unzipFile( zipfilename, unziptodir ):  
    if not os.path.exists( unziptodir ):
        os.mkdir( unziptodir, mode = 0o777 )
    zfobj = zipfile.ZipFile( zipfilename )
    zfobj.extractall( unziptodir )
    zfobj.close()
    
def getFileSize( fileName ):
    size = 0
    try:
        f = open( fileName, 'rb' )
        fs = os.fstat( f.fileno() )
        size = fs[6]
    except IOError as e:
        print( e, 'open file %s failed!' % fileName )
    finally:
        f.close()
    return size

def getFileMd5Code( fileName ):
    code = ''
    try:
        f = open( fileName, 'rb' )
        code = md5.new( f.read() ).hexdigest()
    except IOError as e:
        print( e, 'make file digest failed!' )
        pass
    finally:
        f.close()
    return code

def readFLSFile( fileName ):
    filelist = None
    try:
        f = open( fileName, 'r' )
        fn = fileName.lower()
        if not fn.endswith( '.fls' ):
            raise Exception( 'invalid file type!' )
        fls = f.readlines()
        if not fls or len( fls ) <= 1:
            print( 'empty fls file.' )
            return filelist
        filelist = {}
        for i in range( 1, len( fls ) ):
            s = str.rstrip( fls[i], ' \r\n' )
            if len( s ) > 0:
                filelist[ s ] = i
        return filelist
    except IOError as e:
        print( e, ( 'open file %s failed!' % fileName ) )
    finally:
        f.close()
    return filelist

def checkDirWithFLS( flsFileName, targetPath, oneWayCheck = True, reportEnable = True, userCheckFunction = None ):
    result = False
    targetPath = targetPath.replace( '\\', '/' )
    flsFileName = flsFileName.replace( '\\', '/' )
    flsPath = os.path.dirname( flsFileName )
    if not targetPath.endswith( '/' ):
        targetPath = targetPath + '/'
    if not os.path.isdir( targetPath ):
        raise IOError( 'targetPath not found!' )
    if not os.path.isfile( flsFileName ):
        raise IOError( 'flsFile not found!' )
    
    flsCheckResult = os.path.splitext( flsFileName )[0] + '_checked.h'
    if os.path.isfile( flsCheckResult ):
        #print 'remove the original fls checked file...'
        os.remove( flsCheckResult )
    
    fs = readFLSFile( flsFileName )
    srcFileNum = 0
    
    srcfs = {}
    if pushd( targetPath ):
        for parent, dirnames, filenames, in os.walk( './' ):
            for filename in filenames:
                filepath = os.path.join( parent, filename )
                filepath = filepath.replace( '\\', '/' )
                filepath = filepath.lstrip( './' )
                srcFileNum = srcFileNum + 1
                srcfs[ filepath ] = srcFileNum
        popd()
        
    #compare: src->fls
    fileNotInFls = []
    if not oneWayCheck:
        for v in srcfs:
            if not fs.has_key( v ):
                fileNotInFls.append( v )
        if len( fileNotInFls ) > 0:
            fileNotInFls = sorted( fileNotInFls )
    
    #compare: fls->src
    fileNotInSrc = []
    for v in fs:
        if not srcfs.has_key( v ):
            fileNotInSrc.append( v )
    if len( fileNotInSrc ) > 0:
        fileNotInSrc = sorted( fileNotInSrc )

    if userCheckFunction != None:
        print( 'start user compare:' )
        userCheckFunction( srcfs, fs )
        print( 'end user compare' )
    
    if reportEnable:
        try:
            log = open( flsCheckResult, 'w' )
            if ( oneWayCheck or len( fileNotInFls ) == 0 ) and len( fileNotInSrc ) == 0:
                log.write( '//CheckResult = SUCCEEDED;\n' )
                result = True
                log.close()
                
                os.remove( flsCheckResult )
                return result
            else:
                log.write( '//CheckResult = FAILED;\n' )
                
            log.write( 'static const char* FlsFilePath = \"%s\";\n' % flsFileName )
            
            log.write( '//only check path: dose a file in *.fls really exist in src?\n' )
            if oneWayCheck:
                log.write( 'bool oneWayCheck = true;\n' )
            else:
                log.write( 'bool oneWayCheck = false;\n' )
                
            if len( fileNotInFls ) > 0 and not oneWayCheck:
                log.write( '//+++++++++++++++++++++++++++++++++++++++++++++\n' )
                log.write( '//These files are not in *.fls\n' )
                log.write( 'static const char* fileNotInFls[] = {\n' )
                for v in fileNotInFls:
                    log.write( '    ' )
                    log.write( '\"%s\"' % v )
                    log.write( ',\n' )
                log.write( '};\n' )
                log.write( '//+++++++++++++++++++++++++++++++++++++++++++++\n\n' )
            
            if len( fileNotInSrc ) > 0:
                log.write( '//---------------------------------------------\n' )
                log.write( '//These files in *.fls are not in src directory\n' )
                log.write( 'static const char* fileNotInSrc[] = {\n' )
                for v in fileNotInSrc:
                    log.write( '    ' )
                    log.write( '\"%s\"' % v )
                    log.write( ',\n' )
                log.write( '};\n' )
                log.write( '//---------------------------------------------\n\n' )
            
        except IOError as e:
            print( e, ( 'write file %s failed!' % flsCheckResult ) )
        finally:
            log.close()
    else:
        if ( oneWayCheck or len( fileNotInFls ) == 0 ) and len( fileNotInSrc ) == 0:
            result = True
    return result
  
#new version which supports chinese character
def myUnzip( dir, zipPath ):
    fileCount = 0
    zfobj = None
    try:
        dpushed = pushd( dir )
        if not dpushed:
            return False
        zfobj = zipfile.ZipFile( zipPath )
        for _filename in zfobj.namelist():
            fn = _filename.decode( 'utf-8' ).encode( 'gb2312' )
            print( fn )
            pos = str.find( fn, '/' )
            if pos != -1:
                dirName = fn[:pos]
                _fn = fn[pos+1:]
                if len( _fn ) == 0:
                    #not a file
                    continue
                else:
                    pass
            if len( fn ) == 0 or fn.endswith( '/' ):
                continue    
            seg = str.split( fn, '/' )
            path = ''
            #create sub folders
            for i in range( len( seg ) - 1 ):
                path = os.path.join( path, seg[i] )
                mkdir( path )
            try:
                data = zfobj.read( _filename )
                file = open( fn, "w+b" )
                file.write( data )
                fileCount += 1
            except IOError as e:
                print( 'unpack file[%s] failed:' % fn )
            finally:
                file.close()
    finally:
        if zfobj != None:
            zfobj.close()
        if dpushed:
            popd()
    return fileCount

def copyFiles(sourceDir,  targetDir): 
      if sourceDir.find(".svn") > 0: 
          return 
      for file in os.listdir(sourceDir): 
          sourceFile = os.path.join(sourceDir,  file) 
          targetFile = os.path.join(targetDir,  file) 
          if os.path.isfile(sourceFile): 
              if not os.path.exists(targetDir):  
                  os.makedirs(targetDir)  
              if not os.path.exists(targetFile) or(os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):  
                  open(targetFile, "wb").write(open(sourceFile, "rb").read()) 
          if os.path.isdir(sourceFile): 
              First_Directory = False 
              copyFiles(sourceFile, targetFile)
              
def getBuildTargetName(target):
    names = {5:'StandaloneWindows',
             6:'WebPlayer',
             9:'iPhone',
             13:'Android'
             }
    return names.get(target)
if __name__ == '__main__':
    pass
    
