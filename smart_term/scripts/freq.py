#!/usr/local/bin/python

import os
import sys
import MySQLdb.cursors

listLen = 7

db = MySQLdb.connect(db="directory", host="localhost",
                     port=3306, user="root", passwd="",
                     cursorclass=MySQLdb.cursors.DictCursor)

cur = db.cursor()
cur.execute("SELECT path from dircounts ORDER BY count DESC LIMIT %s", listLen)
st = cur.fetchall()

flag = False
ret = os.environ['PWD']

try:
    flag = (len(sys.argv) == 2) and (int(sys.argv[1]) in range(1, len(st) + 1))
except ValueError:
    pass

if(flag):
	switch_row = int(sys.argv[1])
	dir_to_change = st[switch_row - 1]['path']
	ret = dir_to_change
else:
	sys.stderr.write("+ change to frequent directory with: f <number>\n")
	count = 1
	for row in st:
		path = row['path']
		sys.stderr.write("%s: %s\n" % (count, path))
		count += 1
	sys.stderr.flush()

db.close()
print ret
