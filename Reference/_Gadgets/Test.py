# -*- coding: cp936 -*-
# -*- coding: utf-8 -*

import os
import subprocess
import pysvn
import sys
#import AutoGlobal

#os.popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client')
#subprocess.Popen(r'"C:/Program Files (x86)/Unity/Editor/Unity.exe" E:/fx2/client/Client' , shell=True)

def test1():
    try:
        f = open('test.txt','r')
    except Exception, e:
        print('异常1')
        raise e
    finally:
        print('finally1')

def test2():
    try:
        test1()
    except Exception, e:
        print('异常2')
        raise e
    finally:
        print('finally2')
        
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
    #sys.stdout = open("test.txt", "w")
    #open('E:/fx2/client/Tool/_Gadgets/log2016-04-20.txt','w')
    try:
        test2()
    except Exception, e:
        print('异常3')
        raise e
    finally:
        print('finally3')
    pass
