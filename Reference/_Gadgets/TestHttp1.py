import httplib
import urllib
h = httplib.Http()  
data = dict(name="Joe", comment="A test comment")  
resp, content = h.request("http://127.0.0.1:9999", "POST", urlencode(data))  
resp  






