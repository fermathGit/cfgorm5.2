# -*- coding: cp936 -*-
# -*- coding: utf-8 -*

import os
import subprocess
import pysvn

#os.popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client')
#subprocess.Popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client' , shell=True)


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


if __name__=="__main__":
    svn = pysvn.Client()
    print dir(svn)
    #pysvn del -m "Remove STABLE" 'http://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt'
    #svn delete svn ://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt -m "delete test file"
    #svn (del, remove, 'svn ://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt')

    #svn.remove('URL: http://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt')
    #svn.add( 'E:/fx2/client/Tool/_Gadgets/xxx.txt' )
    #result = svn.commit('xxx.txt')
    #print(result)
    print('SVN 文件..................')
    os.chdir('E:/fx2/client/Tool/_Gadgets/IOS/')
    svnfiles = os.popen('svn ls').readlines()
    print svnfiles

    print('本地 文件..................')
    localfiles = os.popen('dir /A-D /B').readlines()
    print localfiles

    xxx = ['1', '2', '3']
    print('>>>>>>>>')
    print(xxx[1])
    #copyFiles('E:/1', 'E:/2')

    
     

