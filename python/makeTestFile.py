#!/usr/bin/env python

'makeTextFile.py -- create text file'

import os

Ls = os.linesep
#get filename
while True:
    #文件名的格式是完整路径，如：/users/chenguangwen/mylog.txt
    fname = raw_input('enter file name :')
    if os.path.exists(fname):#有这个文件才会写到文件中，找不到这个文件就直接退出了。
        print "ERROR: '%s' already exists" % fname
    else:
        break

    allText = []
    print "\n Enter lines ('.' by itself to quit).\n"

    while True:
        entry = raw_input('>')
        if entry == '.':
            break
        else:
            allText.append(entry)

    fobj = open(fname,'w')

    fobj.writelines(['%s%s' % (x,Ls) for x in allText])

    fobj.close()
    print 'DONE!'
