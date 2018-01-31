import os, sys
import pysvn
import utils

try:
	default_encoding = 'utf-8'
	if sys.getdefaultencoding() != default_encoding:
		reload(sys)
		sys.setdefaultencoding(default_encoding)
except Exception,e:
	print e

def commit( filePath ):
	logMsg = 'PythonTool: commit %s with SvnSingleFileCommit.py' % filePath
	Input = raw_input("commit " + filePath + " to SVN (Y/N)? :")
	if Input.strip().lower().startswith('y'):
		try:
			svn = pysvn.Client()
			if(os.path.isfile( filePath )):
				print 'commit %s' % filePath
				svn.checkin( [filePath], logMsg)
			elif (os.path.isdir( filePath )):
				print( 'commit dir: %s' % filePath )
				utils.svnCheckInAll( svn, filePath, ask = True, msg = logMsg )
		except Exception as e:
			print( e )
			Input2 = raw_input("commit FAILED!!!!" + filePath)

if __name__ == "__main__":
	print sys.argv;	
	argvLen = len(sys.argv);
	if(argvLen >= 2):		
		for i,eachArg in enumerate(sys.argv):
			print "[%d]=%s"%(i, eachArg);
			if (i == 1) :
				commit(eachArg)