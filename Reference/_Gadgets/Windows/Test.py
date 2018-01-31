# -*- coding: cp936 -*-
# -*- coding: utf-8 -*

import os
import subprocess
import pysvn

#os.popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client')
#subprocess.Popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client' , shell=True)

        
if __name__=="__main__":
    #svn = pysvn.Client()
    #print dir(svn)
    #pysvn del -m "Remove STABLE" 'http://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt'
    #svn delete svn ://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt -m "delete test file"
    #svn (del, remove, 'svn ://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt')

    #svn.remove('URL: http://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/xxx.txt')
    #svn.add( 'E:/fx2/client/Tool/_Gadgets/xxx.txt' )
    #result = svn.commit('xxx.txt')
    #print(result)
    print('SVN 文件..................')
    svnfiles = os.popen('svn ls').readlines()
    print svnfiles

    print('本地 文件..................')
    localfiles = os.popen('dir /A-D /B').readlines()
    print localfiles

    
    svninfo = os.popen('svn info').readlines()
    print(svninfo)
    path = svninfo[1][:len(svninfo[1])-1]
    print(path)

    for i in range(0,len(svnfiles)-1):
        sourcefile = svnfiles[i][:len(svnfiles[i])-1]    
        if sourcefile[len(sourcefile)-1:] == "/":
            sourcefile = sourcefile[:len(sourcefile)-1]
        bDelete = True

        for j in range(0,len(localfiles)-1):
            localfile = localfiles[j][:len(localfiles[j])-1]
            #print localfile
            #if sourcefile == 'IOS':
            #   print('>>>>>>>>>>>>>>>>')
            #   print(localfile)
            if sourcefile == localfile:
                bDelete = False
                break
        if bDelete:
            print('\\\\\\\\\\\\\\\\')
            print(sourcefile)
            
        if bDelete == True:
            #optstr = "svn delete %s\Tool\_Gadgets\Windows\%s -m \"\" \n"%(path[5:],sourcefile)
            #optstr = 'svn delete svn ://192.168.1.8:8080/svn/fanxian2/trunk/Tool/_Gadgets/Windows/3.txt -m "delete test file"'
            optstr = 'svn delete 4.txt'
            print optstr
            os.system(optstr)
            optstr = 'svn ci -m "delete test file"'
            print optstr
            os.system(optstr)
            os.system("svn up")
     

