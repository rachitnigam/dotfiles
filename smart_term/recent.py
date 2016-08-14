#!/usr/local/bin/python

import os
import sys
import MySQLdb.cursors

span = 1000 * 60 * 60 * 7

db = MySQLdb.connect(db="directory", host="localhost",
                     port=3306, user="root", passwd="",
                     cursorclass=MySQLdb.cursors.DictCursor)

cur = db.cursor()

cur.execute("SELECT path from dircounts WHERE UNIX_TIMESTAMP(time) > UNIX_TIMESTAMP(now()) - %s ORDER BY time DESC LIMIT 7", span)

st = cur.fetchall()
flag = (len(sys.argv) == 2) and (int(sys.argv[1]) in range(1, len(st) + 1))
ret = os.environ['PWD']

if(flag):
	switch_row = int(sys.argv[1])
	dir_to_change = st[switch_row - 1]['path']
	ret = dir_to_change
else:
	sys.stderr.write("+ change to recent directory with: r <number>\n")
	count = 1
	for row in st:
		path = row['path']
		sys.stderr.write("%s: %s\n" % (count, path))
		count += 1
	sys.stderr.flush()

db.close
print ret