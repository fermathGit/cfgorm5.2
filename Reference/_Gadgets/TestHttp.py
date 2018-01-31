import os, sys
import pysvn
import argparse
import httplib
import urllib  
import urllib2

if __name__ == '__main__':
        print dir(urllib)
	#params = urllib.urlencode({'spam': 1, 'eggs': 2, 'bacon': 0})  
	#headers = {"Content-type": "application/x-www-form-urlencoded",  
	#            "Accept": "text/plain"}  
	#conn = httplib.HTTPConnection('http://127.0.0.1:9999')  
	#conn.request("POST", "", "", headers)  
	#response = conn.getresponse()  
	#print response.status, response.reason  

	#data = response.read()  
	#conn.close()

	data = {}
	data['username'] = 'zgx030030'
	data['password'] = '123456'
	 
	url = 'http://127.0.0.1:9999'
	post_data = urllib.urlencode(data)
	 
	req = urllib2.urlopen(url, post_data)

	#content = req.read()
	print(urllib.urlencode({'USERNAME': 'foo', 'PASSWORD': 'bar'}))