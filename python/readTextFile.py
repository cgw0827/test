#!/usr/bin/env python

'readTextFile.py -- create text file'

import os

Ls = os.linesep
#get filename
fname=raw_input('Enter filename:')
print ''

try:
    fobj=open(fname,'r')
except IOError,e:
    print '***file open error :',e
else:
    for eachLine in fobj:
        print eachLine,
    fobj.close()
